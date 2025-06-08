FROM node:20-alpine
WORKDIR /app
EXPOSE 3000

ENV NODE_ENV=development

COPY ../../backend/package.json ./
COPY ../../backend/pnpm-lock.yaml ./


RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install

CMD [ "pnpm", "dev" ]
