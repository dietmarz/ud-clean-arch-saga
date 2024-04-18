#!/bin/bash

# Define the PostgreSQL data directory
DATA_DIR="/home/dietmar/project/hexa/volume/postgres"

# Define PostgreSQL password (consider a more secure approach for production use)
POSTGRES_PASSWORD="changeme"

CONTAINER_NAME="food-postgres-db"

# Check if the data directory exists, create it if it doesn't
if [ ! -d "$DATA_DIR" ]; then
    sudo mkdir -p "$DATA_DIR"
    sudo chown -R 999:999 "$DATA_DIR"
    echo "Created directory and set permissions: $DATA_DIR"
else
    echo "Directory already exists: $DATA_DIR"
fi

echo "delete container ${CONTAINER_NAME} first"
docker rm -f ${CONTAINER_NAME} 2> /dev/null || true

echo "Run the PostgreSQL container with volume mapping"
docker run --name ${CONTAINER_NAME} \
-e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
-v "$DATA_DIR:/var/lib/postgresql/data" \
postgres

echo "PostgreSQL container started with volume mapping to $DATA_DIR"
