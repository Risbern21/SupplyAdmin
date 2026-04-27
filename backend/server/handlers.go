package server

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"google.golang.org/grpc"
)

type Handler struct {
}

func NewHandler() *Handler {
	return &Handler{}
}

func (h *Handler) CreateShipment(ctx context.Context, req *pb.CreateShipmentRequest) (*pb.Shipment, error) {
	return nil, nil
}

func (h *Handler) GetShipment(ctx context.Context, req *pb.GetShipmentRequest) (*pb.Shipment, error) {
	return nil, nil
}

func (h *Handler) UpdateShipment(ctx context.Context, req *pb.UpdateShipmentRequest) (*pb.Shipment, error) {
	return nil, nil
}

func (h *Handler) DeleteShipment(ctx context.Context, req *pb.DeleteShipmentRequest) (*pb.DeleteShipmentResponse, error) {
	return nil, nil
}

func (h *Handler) ListShipments(ctx context.Context, req *pb.ListShipmentsRequest) (*pb.ListShipmentsResponse, error) {
	return nil, nil
}

func (h *Handler) TrackShipment(ctx context.Context, req *pb.GetShipmentRequest) (*pb.ShipmentStatusUpdate, error) {
	return nil, nil
}

func (h *Handler) AnalyzeShipment(ctx context.Context, req *pb.AnalyzeShipmentRequest) (*pb.AnalyzeShipmentResponse, error) {
	return nil, nil
}

func (h *Handler) ListDisruptions(ctx context.Context, req *pb.ListDisruptionsRequest) (*pb.ListDisruptionsResponse, error) {
	return nil, nil
}

func (h *Handler) WatchDisruptions(ctx context.Context, req *pb.WatchDisruptionsRequest) (grpc.ServerStreamingClient[pb.WatchDisruptionsResponse], error) {
	return nil, nil
}

func (h *Handler) OptimizeRoute(ctx context.Context, req *pb.OptimizeRouteRequest) (*pb.Route, error) {
	return nil, nil
}

func (h *Handler) GetRoute(ctx context.Context, req *pb.GetRouteRequest) (*pb.Route, error) {
	return nil, nil
}
