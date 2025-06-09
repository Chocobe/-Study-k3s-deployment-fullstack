FROM node:20-alpine
WORKDIR /app
EXPOSE 5173

# docker build 실행 시, 지정한 context 경로값을 기준으로 함
COPY ./frontend/package.json ./
COPY ./frontend/pnpm-lock.yaml ./

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install

CMD [ "pnpm", "dev" ]
