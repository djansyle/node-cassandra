#!/bin/bash

set -eo pipefail
service cassandra start

exec "$@"

