#!/bin/bash

# Production application entry-point
echo "Starting Application"

set -e

echo "Running: npx prisma migrate deploy"
npx prisma migrate deploy

echo "Running: npm run start:prod"
npm run start:prod
