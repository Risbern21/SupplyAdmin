package constants

import "errors"

var (
	ErrShipmentNotFound     = errors.New("shipment not found")
	ErrNotEnoughPermissions = errors.New("not enough permissions to access this resource")
	ErrUserNotFound         = errors.New("user not found")
	ErrEmailAlreadyUsed     = errors.New("email already in use")
)
