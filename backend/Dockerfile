FROM golang:1.26.0-alpine AS builder
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod tidy
COPY . .
RUN GOOS=linux GOARCH=amd64 go build -o app .

FROM alpine:3.14
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
