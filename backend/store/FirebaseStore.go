package store

import (
	"context"

	"firebase.google.com/go/db"
	"github.com/risbern21/SupplyAdmin/gen/pb"
)

type FirebaseStore struct {
	db *db.Client
}

func NewFirebaseStore(db *db.Client) *FirebaseStore {
	return &FirebaseStore{
		db: db,
	}
}

func (s *FirebaseStore) SaveShipment(ctx context.Context, shipment *pb.Shipment) error {
	return nil
}

func (s *FirebaseStore) GetShipment(ctx context.Context, shpiment_id string) (*pb.Shipment, error) {
	return nil, nil
}

func (s *FirebaseStore) UpdateShipment(ctx context.Context, shipment *pb.Shipment) (*pb.Shipment, error) {
	return nil, nil
}

func (s *FirebaseStore) ListAllShipments(ctx context.Context, owner_id string) ([]*pb.Shipment, error) {
	return nil, nil
}

func (s *FirebaseStore) AddRoute(ctx context.Context, route *pb.Route) error {
	return nil
}

func (s *FirebaseStore) GetRoute(ctx context.Context, shipment_id string) (*pb.Route, error) {
	return nil, nil
}

func (s *FirebaseStore) AddDisruptionRisk(ctx context.Context, disruptionRisk *pb.DisruptionRisk) error {
	return nil
}

func (s *FirebaseStore) ListDisruptions(ctx context.Context) ([]*pb.DisruptionRisk, error) {
	return nil, nil
}
