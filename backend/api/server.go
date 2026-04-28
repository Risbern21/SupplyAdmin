package api

import (
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/interceptors"
	"github.com/risbern21/SupplyAdmin/store"
	"go.uber.org/zap"
	"google.golang.org/grpc"
)

func NewServer(s store.Storer) *grpc.Server {
	logger, _ := zap.NewProduction()
	defer logger.Sync()

	grpcSever := grpc.NewServer(
		grpc.UnaryInterceptor(interceptors.UnaryLoggingInterceptor(logger)),
	)

	pb.RegisterShipmentServiceServer(grpcSever, NewShipmentHandler(s))
	pb.RegisterDisruptionServiceServer(grpcSever, NewDisruptionHandler(s))
	pb.RegisterRouteServiceServer(grpcSever, NewRouteHandler(s))

	return grpcSever
}
