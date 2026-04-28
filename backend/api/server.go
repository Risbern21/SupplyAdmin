package api

import (
	"cloud.google.com/go/firestore"
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/interceptors"
	"github.com/risbern21/SupplyAdmin/store"
	"go.uber.org/zap"
	"google.golang.org/grpc"
)

func NewServer(s store.Storer, db *firestore.Client) *grpc.Server {
	logger, _ := zap.NewProduction()
	defer logger.Sync()

	grpcSever := grpc.NewServer(
		grpc.ChainUnaryInterceptor(interceptors.UnaryLoggingInterceptor(logger)),
		grpc.ChainStreamInterceptor(interceptors.StreamLoggingInterceptor(logger)),
	)

	pb.RegisterShipmentServiceServer(grpcSever, NewShipmentHandler(s, db))
	pb.RegisterDisruptionServiceServer(grpcSever, NewDisruptionHandler(s, db))
	pb.RegisterRouteServiceServer(grpcSever, NewRouteHandler(s, db))

	return grpcSever
}
