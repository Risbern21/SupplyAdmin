package api

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/interceptors"
	"github.com/risbern21/SupplyAdmin/ml"
	"github.com/risbern21/SupplyAdmin/store"
	"google.golang.org/grpc"
)

type DisruptionHandler struct {
	pb.UnimplementedDisruptionServiceServer
	store    store.Storer
	mlClient *ml.MLClient
}

func NewDisruptionHandler(s store.Storer, mlClient *ml.MLClient) *DisruptionHandler {
	return &DisruptionHandler{
		store:    s,
		mlClient: mlClient,
	}
}

func (h *DisruptionHandler) AnalyzeShipment(ctx context.Context, req *pb.AnalyzeShipmentRequest) (*pb.AnalyzeShipmentResponse, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, err
	}

	_, err = h.store.GetShipment(ctx, req.ShipmentId, claims.UserID)
	if err != nil {
		return nil, err
	}

	// analysisRes, err := h.mlClient.AnalyzeDisruption(req.ShipmentId, shipment.Origin.Name, shipment.Destination.Name, req.CargoType, req.Conditions)

	// res := &pb.AnalyzeShipmentResponse{
	// 	ShipmentId: req.ShipmentId,
	// 	Risks: &pb.DisruptionRisk{
	// 		ShipmentId: req.ShipmentId,
	// 		Type:       analysisRes.Summary,
	// 	},
	// 	Rerouted: analysisRes.SuggestedActions,
	// }
	//
	return nil, nil
}

func (h *DisruptionHandler) ListDisruptions(ctx context.Context, req *pb.ListDisruptionsRequest) (*pb.ListDisruptionsResponse, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, err
	}

	severity := "AT_RISK"
	if req.Severity != nil {
		severity = *req.Severity
	}

	r, err := h.store.ListDisruptions(ctx, claims.UserID, severity)
	if err != nil {
		return nil, err
	}
	return &pb.ListDisruptionsResponse{
		Disruptions: r,
	}, nil
}

func (h *DisruptionHandler) WatchDisruptions(req *pb.WatchDisruptionsRequest, stream grpc.ServerStreamingServer[pb.WatchDisruptionsResponse]) error {
	return nil
}
