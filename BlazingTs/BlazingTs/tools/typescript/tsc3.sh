#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Determine Node executable
if [ -f "$SCRIPT_DIR/node" ]; then
    NODE_EXEC="$SCRIPT_DIR/node"
else
    NODE_EXEC="node"
fi

# Execute TypeScript compiler with all passed arguments
exec "$NODE_EXEC" "$SCRIPT_DIR/bin/tsc" "$@"