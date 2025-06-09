# --- --- --- --- --- --- --- --- --- ---
#
# Development Mode
#
# --- --- --- --- --- --- --- --- --- ---
k3s-backend-dev-build:
	docker volume rm \
		k3s-backend-dev-node_modules || true && \
	docker build \
		-f ./docker/dev/backend.Dockerfile \
		-t chocobe/k3s-backend-dev \
		.

k3s-backend-dev-run:
	docker run \
		-it \
		-p 3000:3000 \
		--rm \
		--name k3s-backend-dev \
		-v k3s-backend-dev-node_modules:/app/node_modules \
		-v ./backend:/app \
		chocobe/k3s-backend-dev

k3s-frontend-dev-build:
	docker volume rm \
		k3s-frontend-dev-node_modules || true && \
	docker build \
		-f ./docker/dev/frontend.Dockerfile \
		-t chocobe/k3s-frontend-dev \
		--no-cache \
		--progress=plain \
		.

k3s-frontend-dev-run:
	docker run \
		-it \
		-p 5173:5173 \
		--rm \
		--name k3s-frontend-dev \
		-v k3s-frontend-dev-node_modules:/app/node_modules \
		-v ./frontend:/app \
		chocobe/k3s-frontend-dev

k3s-dev-compose-up:
	docker compose \
		-f ./docker/dev/docker-compose.yaml \
		up

k3s-dev-compose-down:
	docker compose \
		-f ./docker/dev/docker-compose.yaml \
		down

# --- --- --- --- --- --- --- --- --- ---
#
# Production Mode
#
# --- --- --- --- --- --- --- --- --- ---
k3s-backend-prod-build:
	time docker build \
		-f ./docker/prod/backend.Dockerfile \
		-t chocobe/k3s-backend-prod \
		--progress=plain \
		--no-cache \
		.

k3s-backend-prod-run:
	docker run \
		-it \
		-p 3000:3000 \
		--rm \
		--name k3s-backend-prod \
		chocobe/k3s-backend-prod

k3s-frontend-prod-build:
	time docker build \
		-f ./docker/prod/frontend.Dockerfile \
		-t chocobe/k3s-frontend-prod \
		--no-cache \
		--progress=plain \
		.

k3s-frontend-prod-run:
	docker run \
		-it \
		-p 5173:80 \
		--rm \
		--name k3s-frontend-prod \
		chocobe/k3s-frontend-prod

