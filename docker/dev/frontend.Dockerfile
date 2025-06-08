FROM node:20-alpine
WORKDIR /app
EXPOSE 5173

COPY ../../frontend/package.json ./
COPY ../../frontend/pnpm-lock.yaml ./

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install

CMD [ "pnpm", "dev" ]
