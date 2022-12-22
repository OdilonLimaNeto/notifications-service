#!/bin/bash

npm install
npm run prisma:push
npm run prisma:seed

set -e

echo ""
echo "Sleep 5 seconds to wait database to be initialized ..."
sleep 5

echo "Executing Tests..."
cd src/
npm run test
exit $?
