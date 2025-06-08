frontend-dev-build:
	docker build \
		-f $(PWD)/docker/dev/frontend.Dockerfile \
		-t chocobe/study-k3s-deployment-frontend \
		.

frontend-dev-run:
	docker run \
		-it \
		--rm \
		-p 5173:5173 \
		-v $(PWD)/frontend:/app \
		-v node_modules:/app/node_modules \
		--name study-k3s-deployment-frontend \
		chocobe/study-k3s-deployment-frontend
