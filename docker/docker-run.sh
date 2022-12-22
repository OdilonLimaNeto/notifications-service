#!/bin/bash

echo "Starting notifications service"

# rm -rf node_modules
# Install the project dependencies
npm install --network-concurrency 1

npx prisma generate

npx prisma migrate dev

npm run start:dev