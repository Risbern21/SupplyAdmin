package auth

import (
	"context"
	"errors"
	"fmt"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

type AuthService struct {
	secret []byte
}

var ErrInvalidToken = errors.New("invalid token")

func NewAuthService(secret string) (*AuthService, error) {
	if secret == "" {
		return nil, fmt.Errorf("no secret provided")
	}
	return &AuthService{
		secret: []byte(secret),
	}, nil
}

func (s *AuthService) IssueToken(_ context.Context, userID, email, username string) (string, error) {
	claims := NewUserClaims(userID, email, username, 15*time.Minute)
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenStr, err := token.SignedString(s.secret)
	if err != nil {
		return "", fmt.Errorf("error signing token : %v", err)
	}

	return tokenStr, nil
}

func (s *AuthService) ValidateToken(_ context.Context, tokenStr string) (*UserClaims, error) {
	token, err := jwt.ParseWithClaims(tokenStr, &UserClaims{}, func(token *jwt.Token) (any, error) {
		_, ok := token.Method.(*jwt.SigningMethodHMAC)
		if !ok {
			return nil, ErrInvalidToken
		}

		return s.secret, nil
	})
	if err != nil {
		return nil, err
	}

	claims, ok := token.Claims.(*UserClaims)
	if !ok {
		return nil, ErrInvalidToken
	}

	return claims, nil
}
