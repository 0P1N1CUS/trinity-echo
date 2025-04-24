#!/bin/bash

echo "[TRINITY INIT] Starting system self-check..."

mkdir -p /opt/trinity/logs /opt/trinity/tmp

echo "[TRINITY INIT] Ensuring watchdog timer and heartbeat are active..."
systemctl restart trinity-watchdog.timer 2>/dev/null
/opt/trinity/scripts/trinity-heartbeat.sh

echo "[TRINITY INIT] Fetching latest Echo manifests..."
git -C ~/trinity-echo pull origin master

echo "[TRINITY INIT] Trinity Core Node initialized."
