package main

import (
	"context"
	"log"
	"net"

	"github.com/risbern21/SupplyAdmin/api"
	"github.com/risbern21/SupplyAdmin/db"
	"github.com/risbern21/SupplyAdmin/store"
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

	grpcServer := api.NewServer(s)
	log.Println("server running on port : 8080")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to server server %v", err)
	}
}
