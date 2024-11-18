#!/bin/bash

# Set strict error handling
set -euo pipefail

# Default values
IMAGE_NAME="devcontainer-builder"
TAG="latest"

# Function to display usage
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -h, --help        Display this help message"
    echo "  -t, --tag TAG     Specify the tag for the image (default: latest)"
    echo "  --no-cache        Build without using cache"
    exit 1
}

# Function to build the root dockerfile
build_root() {
    local build_cmd="docker build"
    
    if [ "${NO_CACHE:-false}" = true ]; then
        build_cmd+=" --no-cache"
    fi
    
    echo "Building root dockerfile..."
    $build_cmd -t "${IMAGE_NAME}:${TAG}" .
    
    echo "Build completed successfully!"
    echo "Image: ${IMAGE_NAME}:${TAG}"
}

# Parse command line arguments
NO_CACHE=false
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            ;;
        -t|--tag)
            TAG="$2"
            shift 2
            ;;
        --no-cache)
            NO_CACHE=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

# Execute the build
build_root