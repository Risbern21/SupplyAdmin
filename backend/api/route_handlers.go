package api

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/store"
)

type RouteHandler struct {
	pb.UnimplementedRouteServiceServer
	store store.Storer
}

func NewRouteHandler(s store.Storer) *RouteHandler {
	return &RouteHandler{
		store: s,
	}
}

func (h *RouteHandler) OptimizeRoute(ctx context.Context, req *pb.OptimizeRouteRequest) (*pb.Route, error) {
	return nil, nil
}

func (h *RouteHandler) GetRoute(ctx context.Context, req *pb.GetRouteRequest) (*pb.Route, error) {
	return nil, nil
}
