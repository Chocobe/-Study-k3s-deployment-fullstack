# syntax=docker/dockerfile:1

#
# package stage
#
FROM node:20-alpine AS packages
WORKDIR /app

COPY ./backend/package.json ./
COPY ./backend/pnpm-lock.yaml ./

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --frozen-lockfile

#
# build stage
#
FROM node:20-alpine AS build
WORKDIR /app

COPY ./backend ./
COPY --from=packages /app/node_modules /app/node_modules

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm build

#
# server stage
#
FROM node:20-alpine
EXPOSE 3000
WORKDIR /app

COPY --from=packages /app/package.json ./
COPY --from=packages /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist

CMD [ "node", "./dist/index.js" ]
