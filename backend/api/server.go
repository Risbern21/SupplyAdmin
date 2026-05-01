package api

import (
	"github.com/risbern21/SupplyAdmin/auth"
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/interceptors"
	"github.com/risbern21/SupplyAdmin/ml"
	"github.com/risbern21/SupplyAdmin/store"
	"go.uber.org/zap"
	"google.golang.org/grpc"
)

func NewServer(s store.Storer, mlClient *ml.MLClient, authSvc *auth.AuthService) *grpc.Server {
	logger, _ := zap.NewProduction()
	defer logger.Sync()

	li := interceptors.NewLoggingInterceptor(logger)
	ai, err := interceptors.NewAuthInterceptor(authSvc)
	if err != nil {
		return nil
	}

	grpcSever := grpc.NewServer(
		grpc.ChainUnaryInterceptor(ai.UnaryAuthInterceptor()),
		grpc.ChainUnaryInterceptor(li.UnaryLoggingInterceptor()),
		grpc.ChainStreamInterceptor(li.StreamLoggingInterceptor()),
	)

	pb.RegisterAuthServiceServer(grpcSever, NewAuthHandler(s, authSvc))
	pb.RegisterShipmentServiceServer(grpcSever, NewShipmentHandler(s, mlClient))
	pb.RegisterDisruptionServiceServer(grpcSever, NewDisruptionHandler(s, mlClient))
	pb.RegisterRouteServiceServer(grpcSever, NewRouteHandler(s, mlClient))

	return grpcSever
}
