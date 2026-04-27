package api

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/store"
	"google.golang.org/grpc"
)

type DisruptionHandler struct {
	pb.UnimplementedDisruptionServiceServer
	store store.Storer
}

func NewDisruptionHandler(s store.Storer) *DisruptionHandler {
	return &DisruptionHandler{
		store: s,
	}
}

func (h *DisruptionHandler) AnalyzeShipment(context.Context, *pb.AnalyzeShipmentRequest) (*pb.AnalyzeShipmentResponse, error) {
	return nil, nil
}

func (h *DisruptionHandler) ListDisruptions(context.Context, *pb.ListDisruptionsRequest) (*pb.ListDisruptionsResponse, error) {
	return nil, nil
}

func (h *DisruptionHandler) WatchDisruptions(*pb.WatchDisruptionsRequest, grpc.ServerStreamingServer[pb.WatchDisruptionsResponse]) error {
	return nil
}
