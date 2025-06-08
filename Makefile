frontend-dev-build:
	docker build \
		-f $(PWD)/docker/dev/frontend.Dockerfile \
		-t chocobe/study-k3s-deployment-frontend-dev \
		--progress=plain \
		.

frontend-dev-run:
	docker run \
		-it \
		--rm \
		-p 5173:5173 \
		-v $(PWD)/frontend:/app \
		-v study-k3s-deployment-frontend-dev-node_modules:/app/node_modules \
		--name study-k3s-deployment-frontend \
		chocobe/study-k3s-deployment-frontend-dev

backend-dev-build:
	docker build \
		-f $(PWD)/docker/dev/backend.Dockerfile \
		-t chocobe/study-k3s-deployment-backend-dev \
		--progress=plain \
		.

backend-dev-run:
	docker run \
		-it \
		--rm \
		-p 3000:3000 \
		-v $(PWD)/backend:/app \
		-v study-k3s-deployment-backend-dev-node_modules:/app/node_modules \
		--name study-k3s-deployment-backend-dev \
		chocobe/study-k3s-deployment-backend-dev

dev-compose-up:
	docker compose \
		-f ./docker/dev/docker-compose.yaml \
		up

dev-compose-down:
	docker compose \
		-f ./docker/dev/docker-compose.yaml \
		down
