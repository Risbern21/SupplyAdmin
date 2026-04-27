package api

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/store"
	"google.golang.org/grpc"
)

type ShipmentHandler struct {
	pb.UnimplementedShipmentServiceServer
	store store.Storer
}

func NewShipmentHandler(s store.Storer) *ShipmentHandler {
	return &ShipmentHandler{
		store: s,
	}
}

func (h *ShipmentHandler) CreateShipment(ctx context.Context, req *pb.CreateShipmentRequest) (*pb.Shipment, error) {
	return nil, nil
}

func (h *ShipmentHandler) GetShipment(ctx context.Context, req *pb.GetShipmentRequest) (*pb.Shipment, error) {
	return nil, nil
}

func (h *ShipmentHandler) UpdateShipment(ctx context.Context, req *pb.UpdateShipmentRequest) (*pb.Shipment, error) {
	return nil, nil
}

func (h *ShipmentHandler) DeleteShipment(ctx context.Context, req *pb.DeleteShipmentRequest) (*pb.DeleteShipmentResponse, error) {
	return nil, nil
}

func (h *ShipmentHandler) ListShipments(ctx context.Context, req *pb.ListShipmentsRequest) (*pb.ListShipmentsResponse, error) {
	return nil, nil
}

func (h *ShipmentHandler) TrackShipment(*pb.GetShipmentRequest, grpc.ServerStreamingServer[pb.ShipmentStatusUpdate]) error {
	return nil
}
