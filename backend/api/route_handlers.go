package api

import (
	"context"

	"cloud.google.com/go/firestore"
	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/store"
)

type RouteHandler struct {
	pb.UnimplementedRouteServiceServer
	store store.Storer
	db    *firestore.Client
}

func NewRouteHandler(s store.Storer, db *firestore.Client) *RouteHandler {
	return &RouteHandler{
		store: s,
		db:    db,
	}
}

func (h *RouteHandler) OptimizeRoute(ctx context.Context, req *pb.OptimizeRouteRequest) (*pb.Route, error) {
	return nil, nil
}

func (h *RouteHandler) GetRoute(ctx context.Context, req *pb.GetRouteRequest) (*pb.Route, error) {
	route, err := h.store.GetRoute(ctx, req.ShipmentId)
	if err != nil {
		return nil, err
	}

	return route, nil
}
