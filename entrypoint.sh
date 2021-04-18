#!/bin/bash
set -e

#Remove a potentally pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Sleep for 14 seconds to allow mysql db to setup and connect
# sleep 14

# Check and wait for mysql container to be setup and connected
echo "Waiting for MySQL DB connection ..."

status=$(nc -z db 3306; echo $?)
echo $status

while [ $status != 0 ]
do
  echo "Waiting 3s ..."
  sleep 3s
  status=$(nc -z db 3306; echo $?)
  echo $status
done

echo "DB is up ..."

# Migrate all pending db migrations
rails db:migrate

# Then exec the containers main process (what's set as CMD in the Dockerfile).
exec "$@"