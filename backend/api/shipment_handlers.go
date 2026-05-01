package api

import (
	"context"

	"github.com/google/uuid"
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/interceptors"
	"github.com/risbern21/SupplyAdmin/ml"
	"github.com/risbern21/SupplyAdmin/store"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type ShipmentHandler struct {
	pb.UnimplementedShipmentServiceServer
	store    store.Storer
	mlClient *ml.MLClient
}

func NewShipmentHandler(s store.Storer, mlClient *ml.MLClient) *ShipmentHandler {
	return &ShipmentHandler{
		store:    s,
		mlClient: mlClient,
	}
}

func (h *ShipmentHandler) CreateShipment(ctx context.Context, req *pb.CreateShipmentRequest) (*pb.Shipment, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, err
	}

	s := new(pb.Shipment)
	s.Id = uuid.NewString()
	s.OwnerId = claims.UserID
	s.Origin = req.Origin
	s.Destination = req.Destination
	s.Carrier = req.Carrier
	s.EstimatedArrival = req.EstimatedArrival
	s.CurrentLocation = req.Origin
	s.RoutePoints = []*pb.Location{}
	s.Status = "IN_TRANSIT"
	s.CargoType = req.CargoType
	s.CreatedAt = timestamppb.Now()

	if err := h.store.CreateShipment(ctx, s); err != nil {
		return nil, err
	}

	route := &pb.Route{
		ShipmentId: s.Id,
		Points: []*pb.RoutePoint{
			{
				Lat:      s.Origin.Lat,
				Lng:      s.Origin.Lng,
				Label:    "origin",
				Sequence: 1,
			},
		},
		EstimatedDurationMinutes: (float64(s.EstimatedArrival.Seconds) + float64(s.EstimatedArrival.Nanos)/1e9) / 60,
		DistanceKm:               0,
		Reason:                   "",
	}
	if err := h.store.AddRoute(ctx, route); err != nil {
		return nil, err
	}

	return s, nil
}

func (h *ShipmentHandler) GetShipment(ctx context.Context, req *pb.GetShipmentRequest) (*pb.Shipment, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	s, err := h.store.GetShipment(ctx, req.Id, claims.UserID)
	if err != nil {
		return nil, err
	}

	return s, nil
}

func (h *ShipmentHandler) UpdateShipment(ctx context.Context, req *pb.UpdateShipmentRequest) (*pb.Shipment, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	s, err := h.store.UpdateShipment(ctx, req.Id, claims.UserID, req.CurrentLocation, req.Status)
	if err != nil {
		return nil, err
	}
	return s, nil
}

func (h *ShipmentHandler) DeleteShipment(ctx context.Context, req *pb.DeleteShipmentRequest) (*pb.DeleteShipmentResponse, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}

	res, err := h.store.DeleteShipment(ctx, req.Id, claims.UserID)
	if err != nil {
		return nil, err
	}
	return res, nil
}

func (h *ShipmentHandler) ListShipments(ctx context.Context, req *pb.ListShipmentsRequest) (*pb.ListShipmentsResponse, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, err
	}

	s, err := h.store.ListAllShipments(ctx, claims.UserID)
	if err != nil {
		return nil, err
	}

	return s, nil
}

func (h *ShipmentHandler) TrackShipment(req *pb.TrackShipmentRequest, stream grpc.ServerStreamingServer[pb.TrackShipmentResponse]) error {
	claims, err := interceptors.ClaimsFromContext(stream.Context())
	if err != nil {
		return err
	}
	return h.store.TrackShipment(stream, req.Id, claims.UserID)
}
