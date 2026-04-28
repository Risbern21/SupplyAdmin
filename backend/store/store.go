package store

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"google.golang.org/grpc"
)

type Storer interface {
	SaveShipment(ctx context.Context, shipment *pb.Shipment) error
	GetShipment(ctx context.Context, shpimentID string) (*pb.Shipment, error)
	UpdateShipment(ctx context.Context, shipmentID string, currentLocation *pb.Location, status string) (*pb.Shipment, error)
	DeleteShipment(ctx context.Context, shipmentID string) (*pb.DeleteShipmentResponse, error)
	ListAllShipments(ctx context.Context, ownerID string) (*pb.ListShipmentsResponse, error)
	AddRoute(ctx context.Context, route *pb.Route) error
	GetRoute(ctx context.Context, shipmentID string) (*pb.Route, error)
	AddDisruptionRisk(ctx context.Context, disruptionRisk *pb.DisruptionRisk) error
	ListDisruptions(ctx context.Context) ([]*pb.DisruptionRisk, error)

	TrackShipment(stream grpc.ServerStreamingServer[pb.ShipmentStatusUpdate], shipmentID string) error
}
