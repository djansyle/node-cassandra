#!/bin/bash

set -eo pipefail
service cassandra start

for ((i=1; i<30; i++)) do
  echo Attempt $i
  if nodetool status | grep "^UN"; then
    exec "$@"
    exit 0
  else
    echo "Waiting for cassandra service to be ready. Timed out 5s."
    sleep 5
  fi
done

echo "Cassandra timeout."
exit 1

