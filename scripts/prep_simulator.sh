#!/usr/bin/env bash
# Copyright (c) 2025 Robin Singh
# SPDX-License-Identifier: MIT

set -euo pipefail

DEVICE_UDID="${DEVICE_UDID:-}"

if [[ -z "$DEVICE_UDID" ]]; then
  echo "Set DEVICE_UDID to a simulator UDID. Example:";
  echo "  DEVICE_UDID=<udid> $0"
  echo "Hint: xcrun simctl list devices"
  exit 1
fi

xcrun simctl bootstatus "$DEVICE_UDID" -b

# Best-effort status bar normalization for consistent screenshots.
if xcrun simctl status_bar "$DEVICE_UDID" override \
  --time "09:41" \
  --batteryState charged \
  --batteryLevel 100 \
  --wifiBars 3 \
  --cellularBars 4; then
  true
fi
