package ml

import (
	"context"
	"time"

	"github.com/risbern21/SupplyAdmin/gen/pb"
	"google.golang.org/grpc"
)

type MLClient struct {
	cc grpc.ClientConnInterface
}

func NewMLClient(conn grpc.ClientConnInterface) *MLClient {
	return &MLClient{
		cc: conn,
	}
}

func (mc *MLClient) PredictRisk() (*pb.PredictRiskResponse, error) {
	client := pb.NewShipmentServiceClient(mc.cc)

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	req := &pb.PredictRiskRequest{
		VehicleSpeed:      56.77,
		WeatherSeverity:   34.4,
		TrafficDensity:    34.4,
		RouteCongestion:   23.33,
		DistanceRemaining: 34.0,
		TimeOfDay:         2.30,
		DayOfWeek:         5,
	}

	res, err := client.PredictRisk(ctx, req)
	if err != nil {
		return nil, err
	}

	return res, nil
}

func (mc *MLClient) AnalyzeDisruption(ctx context.Context, req *pb.AnalyzeShipmentRequest) (*pb.AnalyzeShipmentResponse, error) {
	client := pb.NewDisruptionServiceClient(mc.cc)

	ctx, cancel := context.WithTimeout(ctx, 10*time.Second)
	defer cancel()

	res, err := client.AnalyzeShipment(ctx, req)
	if err != nil {
		return nil, err
	}

	return res, nil
}
