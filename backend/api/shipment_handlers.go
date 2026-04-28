package api

import (
	"context"

	"github.com/google/uuid"
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
	s := new(pb.Shipment)
	s.Id = uuid.NewString()
	s.OwnerId = req.OwnerId
	s.Origin = req.Origin
	s.Destination = req.Destination
	s.Carrier = req.Carrier
	s.EstimatedArrival = req.EstimatedArrival
	s.CurrentLocation = req.Origin
	s.RoutePoints = nil
	s.Status = "IN_TRANSIT"

	if err := h.store.SaveShipment(ctx, s); err != nil {
		return nil, err
	}
	return s, nil
}

func (h *ShipmentHandler) GetShipment(ctx context.Context, req *pb.GetShipmentRequest) (*pb.Shipment, error) {
	s, err := h.store.GetShipment(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return s, nil
}

func (h *ShipmentHandler) UpdateShipment(ctx context.Context, req *pb.UpdateShipmentRequest) (*pb.Shipment, error) {
	s, err := h.store.UpdateShipment(ctx, req.Id, req.CurrentLocation, req.Status)
	if err != nil {
		return nil, err
	}
	return s, nil
}

func (h *ShipmentHandler) DeleteShipment(ctx context.Context, req *pb.DeleteShipmentRequest) (*pb.DeleteShipmentResponse, error) {
	res, err := h.store.DeleteShipment(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return res, nil
}

func (h *ShipmentHandler) ListShipments(ctx context.Context, req *pb.ListShipmentsRequest) (*pb.ListShipmentsResponse, error) {
	s, err := h.store.ListAllShipments(ctx, req.OwnerId)
	if err != nil {
		return nil, err
	}

	return s, nil
}

func (h *ShipmentHandler) TrackShipment(*pb.GetShipmentRequest, grpc.ServerStreamingServer[pb.ShipmentStatusUpdate]) error {
	return nil
}
