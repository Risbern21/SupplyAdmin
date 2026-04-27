package store

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
)

type Storer interface {
	SaveShipment(ctx context.Context) (*pb.Shipment, error)
	GetShipment(ctx context.Context) (*pb.Shipment, error)
	UpdateShipment(ctx context.Context) (*pb.Shipment, error)
	ListAllShipments(ctx context.Context) ([]*pb.Shipment, error)
}
