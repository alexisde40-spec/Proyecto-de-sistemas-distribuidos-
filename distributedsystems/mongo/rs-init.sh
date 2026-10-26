#!/bin/sh
set -e

mongosh --host mongodb1:27017 \
  -u "$MONGO_ROOT_USERNAME" -p "$MONGO_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --eval 'rs.initiate({_id:"rs0",members:[{_id:0,host:"mongodb1:27017"},{_id:1,host:"mongodb2:27017"},{_id:2,host:"mongodb3:27017"}]})'

echo "Replica set rs0 initiated"
