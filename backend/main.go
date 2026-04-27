package main

import (
	"log"
	"net"

	"github.com/risbern21/SupplyAdmin/server"
)

func main() {
	lis, err := net.Listen("tcp", "8080")
	if err != nil {
		log.Fatalf("unable to listen on port 8080 : %v", err)
	}

	grpcServer := server.NewServer()
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to server %v", err)
	}
}
