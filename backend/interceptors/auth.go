package interceptors

import (
	"context"
	"fmt"
	"strings"

	"github.com/risbern21/SupplyAdmin/auth"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

type (
	Validator interface {
		ValidateToken(context.Context, string) (*auth.UserClaims, error)
	}

	authInterceptor struct {
		validator Validator
	}
)

func NewAuthInterceptor(validator Validator) (*authInterceptor, error) {
	if validator == nil {
		return nil, fmt.Errorf("no validator passed")
	}

	return &authInterceptor{
		validator: validator,
	}, nil
}

type contextKey struct{}

var userClaimsKey = contextKey{}

func contextWithClaims(ctx context.Context, claims *auth.UserClaims) context.Context {
	return context.WithValue(ctx, userClaimsKey, claims)
}

func ClaimsFromContext(ctx context.Context) (*auth.UserClaims, error) {
	claims, ok := ctx.Value(userClaimsKey).(*auth.UserClaims)
	if !ok || claims == nil {
		return nil, fmt.Errorf("userclaims not found in context")
	}
	return claims, nil
}

func (i *authInterceptor) UnaryAuthInterceptor() grpc.UnaryServerInterceptor {
	publicHandlers := map[string]bool{
		"/supplychain.AuthService/Register": true,
		"/supplychain.AuthService/Login":    true,
	}

	return func(ctx context.Context, req any, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (any, error) {
		if publicHandlers[info.FullMethod] {
			return handler(ctx, req)
		}

		//metadata from incoming request
		md, ok := metadata.FromIncomingContext(ctx)
		if !ok {
			return nil, status.Error(codes.Unauthenticated, "metadata is not provided")
		}

		tokens := md.Get("Authorization")
		if len(tokens) == 0 {
			return nil, status.Error(codes.Unauthenticated, "no authorization token provided")
		}

		const prefix = "Bearer "
		if !strings.HasPrefix(tokens[0], prefix) {
			return nil, status.Error(codes.Unauthenticated, "authorization header must start with 'Bearer '")
		}
		tokenStr := strings.TrimPrefix(tokens[0], prefix)

		//validate token and get user claims
		claims, err := i.validator.ValidateToken(ctx, tokenStr)
		if err != nil {
			print(err.Error())
			return nil, status.Error(codes.Unauthenticated, fmt.Sprintf("invalid token : %v", err))
		}

		ctx = contextWithClaims(ctx, claims)

		return handler(ctx, req)
	}
}
