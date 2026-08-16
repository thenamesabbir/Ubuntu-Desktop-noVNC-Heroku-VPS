#!/bin/bash

set -e

PORT="${PORT:-8080}"

echo "Starting noVNC on port ${PORT}"

exec websockify \
    --web=/usr/share/novnc \
    "0.0.0.0:${PORT}" \
    "127.0.0.1:5900"
