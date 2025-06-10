#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "Plex MCP Service: Initializing..."

# Validate required environment variables
if [ -z "$PLEX_URL" ]; then
    echo "Error: PLEX_URL environment variable is required"
    exit 1
fi

if [ -z "$PLEX_TOKEN" ]; then
    echo "Error: PLEX_TOKEN environment variable is required"
    exit 1
fi

# Set defaults for MCP server configuration
export PLEX_MCP_HOST=${PLEX_MCP_HOST:-"0.0.0.0"}
export PLEX_MCP_PORT=${PLEX_MCP_PORT:-"9150"}
export PLEX_MCP_TRANSPORT=${PLEX_MCP_TRANSPORT:-"sse"}
export PLEX_LOG_LEVEL=${PLEX_LOG_LEVEL:-"INFO"}

echo "Plex MCP Service: Configuration validated"
echo "  - PLEX_URL: $PLEX_URL"
echo "  - PLEX_TOKEN: ***SET***"
echo "  - MCP_HOST: $PLEX_MCP_HOST"
echo "  - MCP_PORT: $PLEX_MCP_PORT"
echo "  - MCP_TRANSPORT: $PLEX_MCP_TRANSPORT"
echo "  - LOG_LEVEL: $PLEX_LOG_LEVEL"

# Change to app directory (important for relative path handling)
cd /app

echo "Plex MCP Service: Starting server..."
exec python3 plex-mcp-server.py 