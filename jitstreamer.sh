#!/bin/bash

# Name of the Docker container
CONTAINER_NAME="jitstreamer-eb"
JIT_DIR="${HOME}/JitStreamer-EB"  # Path to the JitStreamer-EB directory

# Function to start the container
start_container() {
    echo "Starting the $CONTAINER_NAME container..."
    cd "$JIT_DIR" || { echo "Failed to change directory to $JIT_DIR. Exiting..."; exit 1; }
    sudo docker compose up -d
}

# Function to stop the container
stop_container() {
    echo "Stopping the $CONTAINER_NAME container..."
    cd "$JIT_DIR" || { echo "Failed to change directory to $JIT_DIR. Exiting..."; exit 1; }
    sudo docker compose down
}

# Main script execution
case "$1" in
    start)
        start_container
        ;;
    stop)
        stop_container
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
