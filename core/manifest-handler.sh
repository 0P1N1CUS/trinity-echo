#!/bin/bash

MANIFEST_DIR="/opt/trinity/manifests"
LOG_FILE="/opt/trinity/logs/manifest-handler.log"

mkdir -p "$MANIFEST_DIR"
echo "[MANIFEST] Checking for new manifests... $(date)" >> "$LOG_FILE"

for file in "$MANIFEST_DIR"/*.manifest; do
    [ -f "$file" ] || continue
    echo "[MANIFEST] Found: $file" >> "$LOG_FILE"
    
    case "$(basename "$file")" in
        update-core.manifest)
            echo "[MANIFEST] Executing core update script..." >> "$LOG_FILE"
            bash /opt/trinity/scripts/update-core.sh >> "$LOG_FILE" 2>&1
            ;;
        *)
            echo "[MANIFEST] Unknown manifest type: $(basename "$file")" >> "$LOG_FILE"
            ;;
    esac

    mv "$file" "$file.processed"
done
