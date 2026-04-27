package server

import (
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"google.golang.org/grpc"
)

func NewServer() *grpc.Server {
	grpcSever := grpc.NewServer()
	handler := NewHandler()

	pb.RegisterShipmentServiceServer(grpcSever, handler)
	pb.RegisterDisruptionServiceServer(grpcSever, handler)
	pb.RegisterRouteServiceServer(grpcSever, handler)

	return grpcSever
}
