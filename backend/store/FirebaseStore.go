package store

import (
	"context"
	"fmt"

	"cloud.google.com/go/firestore"
	"github.com/risbern21/SupplyAdmin/gen/pb"
)

type FirebaseStore struct {
	db *firestore.Client
}

func NewFirebaseStore(db *firestore.Client) *FirebaseStore {
	return &FirebaseStore{
		db: db,
	}
}

// helpers
// convert a route point i.e *pb.Location to a map[string]any
func locationToMap(loc *pb.Location) map[string]any {
	if loc == nil {
		return nil
	}
	return map[string]any{
		"Lat":  loc.Lat,
		"Lng":  loc.Lng,
		"Name": loc.Name,
	}
}

// converts route points i.e []*pb.Location to a []map[string]any
func locationsToMap(locs []*pb.Location) []map[string]any {
	results := []map[string]any{}
	for _, loc := range locs {
		results = append(results, locationToMap(loc))
	}
	return results
}

func (s *FirebaseStore) SaveShipment(ctx context.Context, shipment *pb.Shipment) error {
	coll := s.db.Collection("shipments")
	_, _, err := coll.Add(ctx, shipment)
	return err
}

func (s *FirebaseStore) GetShipment(ctx context.Context, shipmentID string) (*pb.Shipment, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil {
		return nil, err
	}

	if len(docs) == 0 {
		return nil, fmt.Errorf("shipment not found")
	}

	shipment := new(pb.Shipment)
	if err := docs[0].DataTo(shipment); err != nil {
		return nil, err
	}
	return shipment, nil
}

func (s *FirebaseStore) UpdateShipment(ctx context.Context, shipmentID string, currentLocation *pb.Location, status string) (*pb.Shipment, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil {
		return nil, err
	}

	if len(docs) == 0 {
		return nil, fmt.Errorf("shipment not found")
	}

	oldShipment := new(pb.Shipment)
	if err := docs[0].DataTo(oldShipment); err != nil {
		return nil, err
	}

	// build firestore update slice
	firestoreUpdates := []firestore.Update{}
	//save the old CurrentLocation in routepoints
	updatedRoutepoints := append(oldShipment.RoutePoints, oldShipment.CurrentLocation)
	firestoreUpdates = append(firestoreUpdates, firestore.Update{
		Path:  "RoutePoints",
		Value: locationsToMap(updatedRoutepoints),
	})
	firestoreUpdates = append(firestoreUpdates, firestore.Update{
		Path:  "CurrentLocation",
		Value: locationToMap(currentLocation),
	})
	firestoreUpdates = append(firestoreUpdates, firestore.Update{
		Path:  "Status",
		Value: status,
	})

	_, err = docs[0].Ref.Update(ctx, firestoreUpdates)
	if err != nil {
		fmt.Printf("error while updating %v", err)
		return nil, fmt.Errorf("failed to update shipment: %w", err)
	}

	// fetch shipment again
	docs, err = coll.
		Where("Id", "==", shipmentID).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil {
		return nil, err
	}

	if len(docs) == 0 {
		return nil, fmt.Errorf("shipment not found")
	}

	shipment := new(pb.Shipment)
	if err := docs[0].DataTo(shipment); err != nil {
		return nil, err
	}
	return shipment, nil
}

func (s *FirebaseStore) DeleteShipment(ctx context.Context, shipmentID string) (*pb.DeleteShipmentResponse, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Limit(1).
		Documents(ctx).GetAll()
	if err != nil {
		return nil, err
	}

	if len(docs) == 0 {
		return nil, fmt.Errorf("shipment not found")
	}

	_, err = docs[0].Ref.Delete(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to delete shipment: %w", err)
	}

	res := &pb.DeleteShipmentResponse{
		Success: true,
		Message: "shipment deleted successfully",
	}

	return res, nil
}

func (s *FirebaseStore) ListAllShipments(ctx context.Context, ownerID string) (*pb.ListShipmentsResponse, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("OwnerId", "==", ownerID).
		Documents(ctx).
		GetAll()

	if err != nil {
		return nil, err
	}

	shipments := &pb.ListShipmentsResponse{}

	for _, doc := range docs {
		shipment := new(pb.Shipment)
		if err := doc.DataTo(shipment); err != nil {
			return nil, fmt.Errorf("failed to parse shipment : %v", err)
		}
		shipments.Shipments = append(shipments.Shipments, shipment)
	}

	return shipments, nil
}

func (s *FirebaseStore) AddRoute(ctx context.Context, route *pb.Route) error {
	coll := s.db.Collection("routes")
	_, _, err := coll.Add(ctx, route)
	return err
}

func (s *FirebaseStore) GetRoute(ctx context.Context, shipmentID string) (*pb.Route, error) {
	coll := s.db.Collection("routes")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Limit(1).
		Documents(ctx).
		GetAll()

	if err != nil {
		return nil, nil
	}

	if len(docs) == 0 {
		return nil, fmt.Errorf("no routes found for this shipment")
	}

	route := new(pb.Route)
	if err := docs[0].DataTo(route); err != nil {
		return nil, err
	}
	return route, nil
}

func (s *FirebaseStore) AddDisruptionRisk(ctx context.Context, disruptionRisk *pb.DisruptionRisk) error {
	coll := s.db.Collection("disruption_risks")
	_, _, err := coll.Add(ctx, disruptionRisk)
	return err
}

func (s *FirebaseStore) ListDisruptions(ctx context.Context) ([]*pb.DisruptionRisk, error) {
	return nil, nil
}
