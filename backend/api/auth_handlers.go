package api

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"github.com/risbern21/SupplyAdmin/auth"
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/store"
	"github.com/risbern21/SupplyAdmin/util"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type AuthHandler struct {
	pb.UnimplementedAuthServiceServer
	store   store.Storer
	authSvc *auth.AuthService
}

func NewAuthHandler(store store.Storer, authSvc *auth.AuthService) *AuthHandler {
	return &AuthHandler{
		store:   store,
		authSvc: authSvc,
	}
}

func (h *AuthHandler) Register(ctx context.Context, req *pb.RegisterRequest) (*pb.RegisterResponse, error) {
	user := new(pb.User)
	user.Id = uuid.NewString()
	user.Username = req.Username
	user.Email = req.Email

	hashedPassword, err := util.HashPassword(req.Password)
	if err != nil {
		return nil, err
	}

	user.Password = hashedPassword
	user.CreatedAt = timestamppb.Now()

	if err := h.store.CreateUser(ctx, user); err != nil {
		return nil, err
	}

	res := new(pb.RegisterResponse)
	res.Id = user.Id
	res.Username = user.Username
	res.Email = user.Email
	res.CreatedAt = user.CreatedAt

	return res, nil
}

func (h *AuthHandler) Login(ctx context.Context, req *pb.LoginRequest) (*pb.LoginResponse, error) {
	u, err := h.store.GetUser(ctx, req.Email)
	if err != nil {
		return nil, err
	}

	if err := util.CheckPassword(req.Password, u.Password); err != nil {
		return nil, fmt.Errorf("invalid password")
	}

	accessToken, err := h.authSvc.IssueToken(ctx, u.Id, u.Email, u.Username)
	if err != nil {
		return nil, err
	}

	res := new(pb.LoginResponse)
	res.AccessToken = accessToken
	return res, nil
}
