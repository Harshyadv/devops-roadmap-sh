#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="${1:-}"

if [[ -z "$LOG_DIR" || ! -d "$LOG_DIR" ]]; then
  echo "Usage: $0 <log-directory>"
 exit 1
fi

ARCHIVE_DIR="./archives"
mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# -c: create archive
# -z: compress with gzip
# -f: specify output filename
# -C: change into the target directory first so paths inside the archive are clean
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" . 2>&1 >/dev/null | while IFS= read -r line; do
  echo "[$(date +"%Y-%m-%d %H:%M:%S")] [ERROR] (Source: $LOG_DIR): $line" | tee -a "${ARCHIVE_DIR}/error.log" >&2
  done

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived '$LOG_DIR' -> '$ARCHIVE_PATH'" >> "${ARCHIVE_DIR}/archive.log"
echo "Success: Created $ARCHIVE_PATH"
