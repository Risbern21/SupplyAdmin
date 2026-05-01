package store

import (
	"context"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"google.golang.org/grpc"
)

type Storer interface {
	CreateUser(ctx context.Context, user *pb.User) error
	GetUser(ctx context.Context, email string) (*pb.User, error)

	CreateShipment(ctx context.Context, shipment *pb.Shipment) error
	GetShipment(ctx context.Context, shpimentID, ownerID string) (*pb.Shipment, error)
	UpdateShipment(ctx context.Context, shipmentID, ownerID string, currentLocation *pb.Location, status string) (*pb.Shipment, error)
	DeleteShipment(ctx context.Context, shipmentID, ownerID string) (*pb.DeleteShipmentResponse, error)
	ListAllShipments(ctx context.Context, ownerID string) (*pb.ListShipmentsResponse, error)

	AddRoute(ctx context.Context, route *pb.Route) error
	GetRoute(ctx context.Context, shipmentID string) (*pb.Route, error)

	AddDisruptionRisk(ctx context.Context, disruptionRisk *pb.DisruptionRisk) error
	ListDisruptions(ctx context.Context, ownerID, severity string) ([]*pb.DisruptionRisk, error)

	TrackShipment(stream grpc.ServerStreamingServer[pb.TrackShipmentResponse], shipmentID, ownerID string) error
}
