FROM node:16-alpine

WORKDIR /usr/src/app

COPY package.json package.lock.json ./
COPY tsconfig* ./
COPY nest-cli.json ./
COPY prisma/ prisma/
COPY src/ src/
COPY docker/docker-entrypoint.sh docker-entrypoint.sh

RUN npm install --network-concurrency 1

RUN npm run build

EXPOSE ${SERVICE_PORT}

ENTRYPOINT ["sh", "/usr/src/app/docker-entrypoint.sh"]