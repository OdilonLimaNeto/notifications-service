#!/bin/bash

echo "Starting notifications service"

npm install --network-concurrency 1

npx prisma generate

npx prisma migrate dev

npm run start:dev