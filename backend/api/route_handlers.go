package api

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"github.com/risbern21/SupplyAdmin/interceptors"
	"github.com/risbern21/SupplyAdmin/ml"
	"github.com/risbern21/SupplyAdmin/store"
)

type RouteHandler struct {
	pb.UnimplementedRouteServiceServer
	store    store.Storer
	mlClient *ml.MLClient
}

func NewRouteHandler(s store.Storer, mlClient *ml.MLClient) *RouteHandler {
	return &RouteHandler{
		store:    s,
		mlClient: mlClient,
	}
}

func (h *RouteHandler) OptimizeRoute(ctx context.Context, req *pb.OptimizeRouteRequest) (*pb.OptimizeRouteResponse, error) {
	claims, err := interceptors.ClaimsFromContext(ctx)
	if err != nil {
		return nil, err
	}

	_, err = h.store.GetShipment(ctx, req.ShipmentId, claims.UserID)
	if err != nil {
		return nil, err
	}

	return nil, nil
}

func (h *RouteHandler) GetRoute(ctx context.Context, req *pb.GetRouteRequest) (*pb.Route, error) {
	route, err := h.store.GetRoute(ctx, req.ShipmentId)
	if err != nil {
		return nil, err
	}

	return route, nil
}
