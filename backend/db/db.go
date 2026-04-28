package db

import (
	"context"
	"fmt"
	"os"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
)

var client *firestore.Client

func Client() *firestore.Client {
	return client
}

func Connect(ctx context.Context) error {
	path := os.Getenv("GOOGLE_APPLICATION_CREDENTIALS")
	projectID := os.Getenv("FIREBASE_PROJECT_ID")

	conf := &firebase.Config{
		ProjectID: projectID,
	}
	options := option.WithCredentialsFile(path)
	app, err := firebase.NewApp(ctx, conf, options)
	if err != nil {
		return fmt.Errorf("error initializing app: %v", err)
	}

	client, err = app.Firestore(ctx)
	if err != nil {
		return fmt.Errorf("error while creating a db client instance : %v", err)
	}

	return nil
}

func Disconnect() error {
	if client != nil {
		return client.Close()
	}
	return nil
}
