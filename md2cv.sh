#!/bin/bash
# MD2CV - Docker wrapper script
# Usage: ./md2cv.sh input.md [--format pdf|docx|all] [--template name]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
IMAGE_NAME="md2cv"

# Build image if not exists
if ! docker image inspect $IMAGE_NAME >/dev/null 2>&1; then
    echo "🔨 Building MD2CV Docker image..."
    docker build -t $IMAGE_NAME "$SCRIPT_DIR"
fi

# Run conversion
docker run --rm \
    -v "$SCRIPT_DIR/examples:/app/examples:ro" \
    -v "$SCRIPT_DIR/templates:/app/templates:ro" \
    -v "$SCRIPT_DIR/output:/app/output" \
    -v "$SCRIPT_DIR:/app/input:ro" \
    $IMAGE_NAME "$@"
