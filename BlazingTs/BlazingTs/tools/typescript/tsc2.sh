#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOG_FILE="$SCRIPT_DIR/typescript.log"

# Initialize log file
echo "[TypeScript] Starting compilation..." > "$LOG_FILE"

# Determine Node executable
if [ -f "$SCRIPT_DIR/node" ]; then
    NODE_EXEC="$SCRIPT_DIR/node"
else
    NODE_EXEC="node"
fi

echo "[TypeScript] Using Node from: $NODE_EXEC" >> "$LOG_FILE"

# Version check
VERSION_LINE=$("$NODE_EXEC" "$SCRIPT_DIR/bin/tsc" --version)
echo "[TypeScript] $VERSION_LINE" >> "$LOG_FILE"

# Transpilation
echo "[TypeScript] Running tsc with arguments: $@" >> "$LOG_FILE"
"$NODE_EXEC" "$SCRIPT_DIR/bin/tsc" "$@" >> "$LOG_FILE" 2>&1

EXIT_CODE=$?
if [ $EXIT_CODE -eq 0 ]; then
    echo "[TypeScript] Compilation completed successfully" >> "$LOG_FILE"
else
    echo "[TypeScript] Compilation failed with error code $EXIT_CODE" >> "$LOG_FILE"
fi

exit $EXIT_CODE