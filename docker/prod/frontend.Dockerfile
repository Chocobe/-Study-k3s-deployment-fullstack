# syntax=docker/dockerfile:1

#
# package stage
#
FROM node:20-alpine AS packages
WORKDIR /app

COPY ./frontend/package.json ./
COPY ./frontend/pnpm-lock.yaml ./

RUN corepack enable && corepack prepare pnpm@latest --activate
# RUN pnpm install
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install

#
# build stage
#
FROM node:20-alpine AS build
WORKDIR /app

COPY ./frontend ./
COPY --from=packages /app/node_modules /app/node_modules

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm build

#
# web server stage
#
FROM nginx:alpine AS web-server
EXPOSE 80

COPY ./docker/prod/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
