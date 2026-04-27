package db

import (
	"context"
	"fmt"
	"os"

	firebase "firebase.google.com/go"
	"firebase.google.com/go/db"
	"google.golang.org/api/option"
)

var client *db.Client

func Client() *db.Client {
	return client
}

func Connect(ctx context.Context) error {
	path := os.Getenv("GOOGLE_APPLICATION_CREDENTIALS")
	databaseUrl := os.Getenv("DATABASE_URL")

	conf := &firebase.Config{
		DatabaseURL: databaseUrl,
	}
	options := option.WithCredentialsFile(path)
	app, err := firebase.NewApp(ctx, conf, options)
	if err != nil {
		return fmt.Errorf("error initializing app: %v", err)
	}

	client, err = app.Database(ctx)
	if err != nil {
		return fmt.Errorf("error while creating a db client instance : %v", err)
	}

	return nil
}
