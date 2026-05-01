package store

import (
	"context"
	"fmt"

	"cloud.google.com/go/firestore"
	"github.com/risbern21/SupplyAdmin/gen/pb"
	constants "github.com/risbern21/SupplyAdmin/internal/constants/errors"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
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

// Auth
func (s *FirebaseStore) CreateUser(ctx context.Context, user *pb.User) error {
	emailRef := s.db.Collection("unique_emails").Doc(user.Email)
	userRef := s.db.Collection("users").NewDoc()

	return s.db.RunTransaction(ctx, func(ctx context.Context, tx *firestore.Transaction) error {
		snap, err := tx.Get(emailRef)
		if err != nil && status.Code(err) != codes.NotFound {
			return err
		} else {
			if snap.Exists() {
				return constants.ErrEmailAlreadyUsed
			}
		}

		if err := tx.Set(emailRef, map[string]any{
			"UserId": user.Id,
		}); err != nil {
			return fmt.Errorf("failed to reserve email: %w", err)
		}
		if err := tx.Set(userRef, user); err != nil {
			return fmt.Errorf("failed to create user: %w", err)
		}
		return nil
	})
}

func (s *FirebaseStore) GetUser(ctx context.Context, email string) (*pb.User, error) {
	coll := s.db.Collection("users")
	docs, err := coll.
		Where("Email", "==", email).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil || len(docs) == 0 {
		return nil, constants.ErrUserNotFound
	}

	user := new(pb.User)
	if err := docs[0].DataTo(user); err != nil {
		return nil, err
	}
	return user, nil
}

func (s *FirebaseStore) CreateShipment(ctx context.Context, shipment *pb.Shipment) error {
	coll := s.db.Collection("shipments")
	_, _, err := coll.Add(ctx, shipment)
	return err
}

func (s *FirebaseStore) GetShipment(ctx context.Context, shipmentID, ownerID string) (*pb.Shipment, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Where("OwnerId", "==", ownerID).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil || len(docs) == 0 {
		return nil, constants.ErrShipmentNotFound
	}

	shipment := new(pb.Shipment)
	if err := docs[0].DataTo(shipment); err != nil {
		return nil, err
	}
	return shipment, nil
}

func (s *FirebaseStore) UpdateShipment(ctx context.Context, shipmentID, ownerID string, currentLocation *pb.Location, shipmentStatus string) (*pb.Shipment, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Where("OwnerId", "==", ownerID).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil || len(docs) == 0 {
		return nil, constants.ErrShipmentNotFound
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
		Value: shipmentStatus,
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
		return nil, constants.ErrShipmentNotFound
	}

	shipment := new(pb.Shipment)
	if err := docs[0].DataTo(shipment); err != nil {
		return nil, err
	}
	return shipment, nil
}

func (s *FirebaseStore) DeleteShipment(ctx context.Context, shipmentID, ownerID string) (*pb.DeleteShipmentResponse, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Where("OwnerId", "==", ownerID).
		Limit(1).
		Documents(ctx).GetAll()
	if err != nil || len(docs) == 0 {
		return nil, constants.ErrShipmentNotFound
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
		Where("ShipmentId", "==", shipmentID).
		Limit(1).
		Documents(ctx).
		GetAll()
	if err != nil || len(docs) == 0 {
		return nil, constants.ErrShipmentNotFound
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

func (s *FirebaseStore) ListDisruptions(ctx context.Context, ownerID, severity string) ([]*pb.DisruptionRisk, error) {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Status", "==", severity).
		Where("OwnerId", "==", ownerID).
		Documents(ctx).
		GetAll()
	if err != nil {
		return nil, err
	}

	res := []*pb.DisruptionRisk{}
	for _, doc := range docs {
		shipment := new(pb.Shipment)
		if err := doc.DataTo(shipment); err != nil {
			return nil, err
		}

		res = append(res, &pb.DisruptionRisk{
			ShipmentId:  shipment.Id,
			Severity:    shipment.Status,
			Type:        shipment.Status,
			Description: fmt.Sprintf("lat: %v - lng: %v -  current location: %v", shipment.CurrentLocation.Lat, shipment.CurrentLocation.Lng, shipment.CurrentLocation.Name),
		})
	}

	return res, nil
}

// TrackShipment for streaming shipment updates
func (s *FirebaseStore) TrackShipment(stream grpc.ServerStreamingServer[pb.TrackShipmentResponse], shipmentID, ownerID string) error {
	coll := s.db.Collection("shipments")
	docs, err := coll.
		Where("Id", "==", shipmentID).
		Where("OwnerId", "==", ownerID).
		Limit(1).
		Documents(stream.Context()).
		GetAll()
	if err != nil || len(docs) == 0 {
		return constants.ErrShipmentNotFound
	}

	snapshots := docs[0].Ref.Snapshots(stream.Context())

	for {
		snap, err := snapshots.Next()
		if err != nil {
			return err
		}

		shipmentData := new(pb.Shipment)
		if err := snap.DataTo(shipmentData); err != nil {
			return err
		}

		err = stream.Send(&pb.TrackShipmentResponse{
			ShipmentId:      shipmentData.Id,
			Status:          shipmentData.Status,
			CurrentLocation: shipmentData.CurrentLocation,
		})
		if err != nil {
			return err
		}
	}
}
