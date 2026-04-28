package api

import (
	"context"
	"fmt"

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
	coll := h.db.Collection("routes")
	docs, err := coll.
		Where("ShipmentId", "==", req.ShipmentId).
		Documents(ctx).
		GetAll()

	if err != nil || len(docs) == 0 {
		return nil, fmt.Errorf("shipment not found")
	}

	route := new(pb.Route)
	if err := docs[0].DataTo(route); err != nil {
		return nil, err
	}

	fmt.Println(route)

	return route, nil
}
