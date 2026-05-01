package main

import (
	"context"
	"log"
	"net"
	"os"

	"github.com/risbern21/SupplyAdmin/api"
	"github.com/risbern21/SupplyAdmin/auth"
	"github.com/risbern21/SupplyAdmin/db"
	"github.com/risbern21/SupplyAdmin/ml"
	"github.com/risbern21/SupplyAdmin/store"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func main() {
	if err := db.Connect(context.Background()); err != nil {
		log.Fatalf("error while connecting to db : %v", err)
	}

	s := store.NewFirebaseStore(db.Client())

	lis, err := net.Listen("tcp", ":8080")
	if err != nil {
		log.Fatalf("unable to listen on port 8080 : %v", err)
	}

	conn, err := grpc.NewClient("localhost:50051", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("unable to setup gRPC client conn : %w\n", err)
	}

	secret, ok := os.LookupEnv("SECRET_KEY")
	if !ok {
		log.Fatalf("secret not defined : %v", err)
	}
	authSvc, err := auth.NewAuthService(secret)

	grpcServer := api.NewServer(s, ml.NewMLClient(conn), authSvc)
	log.Println("server running on port : 8080")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to server server %v", err)
	}
}
