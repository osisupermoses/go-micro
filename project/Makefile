FRONT_END_BINARY=frontApp
BROKER_BINARY=brokerApp
AUTH_BINARY=authApp
LOGGER_BINARY=loggerServiceApp
MAIL_BINARY=mailerApp
LISTENER_BINARY=listenerApp
FRONT_BINARY=frontEndApp

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build_amd64: build_broker_amd64 build_auth_amd64 build_logger_amd64 build_mail_amd64 build_listener_amd64 build_front_linux_amd64
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_broker build_auth build_logger build_mail build_listener build_front_linux
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_front_linux_amd64: builds the front end binary as a linux amd64 executable
build_front_linux_amd64:
	@echo "Building front end linux binary..."
	cd ../front-end && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${FRONT_BINARY} ./cmd/web
	@echo "Done!"

## build_front_linux: builds the front end binary as a linux arm64 executable
build_front_linux:
	@echo "Building front end linux binary..."
	cd ../front-end && env GOOS=linux CGO_ENABLED=0 go build -o ${FRONT_BINARY} ./cmd/web
	@echo "Done!"

## build_broker_amd64: builds the broker binary as a linux executable
build_broker_amd64:
	@echo "Building broker binary..."
	cd ../broker-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
build_broker:
	@echo "Building broker binary..."
	cd ../broker-service && env GOOS=linux CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

## build_mail_amd64: builds the mail binary as a linux executable
build_mail_amd64:
	@echo "Building mail binary..."
	cd ../mail-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./cmd/api
	@echo "Done!"

## build_mail: builds the mail binary as a linux executable
build_mail:
	@echo "Building mail binary..."
	cd ../mail-service && env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./cmd/api
	@echo "Done!"

## build_logger_amd64: builds the logger binary as a linux executable
build_logger_amd64:
	@echo "Building logger binary..."
	cd ../logger-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ./cmd/api
	@echo "Done!"

## build_logger: builds the logger binary as a linux executable
build_logger:
	@echo "Building logger binary..."
	cd ../logger-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ./cmd/api
	@echo "Done!"

## build_listener_amd64: builds the listener binary as a linux executable
build_listener_amd64:
	@echo "Building listener binary..."
	cd ../listener-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${LISTENER_BINARY} .
	@echo "Done!"

## build_listener: builds the listener binary as a linux executable
build_listener:
	@echo "Building listener binary..."
	cd ../listener-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LISTENER_BINARY} .
	@echo "Done!"

## build_auth_amd64: builds the auth binary as a linux executable
build_auth_amd64:
	@echo "Building auth binary..."
	cd ../authentication-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api
	@echo "Done!"


## build_auth: builds the auth binary as a linux executable
build_auth:
	@echo "Building auth binary..."
	cd ../authentication-service && env GOOS=linux CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api
	@echo "Done!"

## build_front: builds the frone end binary
build_front:
	@echo "Building front end binary..."
	cd ../front-end && env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

## start: starts the front end
start: build_front
	@echo "Starting front end"
	cd ../front-end && ./${FRONT_END_BINARY} &

## stop: stop the front end
stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"