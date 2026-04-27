package api

import (
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/store"
	"google.golang.org/grpc"
)

func NewServer(s store.Storer) *grpc.Server {
	grpcSever := grpc.NewServer()

	pb.RegisterShipmentServiceServer(grpcSever, NewShipmentHandler(s))
	pb.RegisterDisruptionServiceServer(grpcSever, NewDisruptionHandler(s))
	pb.RegisterRouteServiceServer(grpcSever, NewRouteHandler(s))

	return grpcSever
}
