#!/bin/bash

# Define pgAdmin environment variables
PGADMIN_DEFAULT_EMAIL="user@example.com"
PGADMIN_DEFAULT_PASSWORD="admin123" # Consider a more secure approach for production use

# Define pgAdmin container name
CONTAINER_NAME="food-pgadmin"

# Define port mapping (HostPort:ContainerPort)
PORT_MAPPING="5050:80"

echo "delete container ${CONTAINER_NAME} first"
docker rm -f ${CONTAINER_NAME} 2> /dev/null || true

echo "Run the pgAdmin container"
docker run --name $CONTAINER_NAME -p $PORT_MAPPING \
    -e "PGADMIN_DEFAULT_EMAIL=$PGADMIN_DEFAULT_EMAIL" \
    -e "PGADMIN_DEFAULT_PASSWORD=$PGADMIN_DEFAULT_PASSWORD" \
    dpage/pgadmin4

echo "pgAdmin container started. Access it via portmapping ${PORT_MAPPING}"

