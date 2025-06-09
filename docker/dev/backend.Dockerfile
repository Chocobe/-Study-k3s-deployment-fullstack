# syntax=docker/dockerfile:1

FROM node:20-alpine
WORKDIR /app
EXPOSE 3000

ENV NODE_ENV=development

# docker build 실행 시, 지정한 context 경로값을 기준으로 함
COPY ./backend/package.json ./
COPY ./backend/pnpm-lock.yaml ./

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install

CMD [ "pnpm", "dev" ]
