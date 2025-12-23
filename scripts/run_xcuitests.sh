#!/usr/bin/env bash
# Copyright (c) 2025 Robin Singh
# SPDX-License-Identifier: MIT

set -euo pipefail

SCHEME=""
TESTPLAN=""
WORKSPACE=""
PROJECT=""
DESTINATION="platform=iOS Simulator,name=iPhone 15,OS=latest"
RESULTS_PATH="build/xcuitest-results"

while [[ $# -gt 0 ]]; do
  case "$1" in
    -scheme)
      SCHEME="$2"; shift 2 ;;
    -testplan)
      TESTPLAN="$2"; shift 2 ;;
    -workspace)
      WORKSPACE="$2"; shift 2 ;;
    -project)
      PROJECT="$2"; shift 2 ;;
    -destination)
      DESTINATION="$2"; shift 2 ;;
    -results)
      RESULTS_PATH="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 -scheme <Scheme> [-testplan <Plan>] [-workspace <Path>|-project <Path>]"
      echo "           [-destination <Destination>] [-results <Path>]"
      exit 0 ;;
    *)
      echo "Unknown arg: $1"; exit 1 ;;
  esac
done

if [[ -z "$SCHEME" ]]; then
  echo "Missing -scheme. Run with -h for help.";
  exit 1
fi

mkdir -p "$(dirname "$RESULTS_PATH")"

build_args=()
if [[ -n "$WORKSPACE" ]]; then
  build_args+=( -workspace "$WORKSPACE" )
elif [[ -n "$PROJECT" ]]; then
  build_args+=( -project "$PROJECT" )
fi

build_args+=( -scheme "$SCHEME" )

if [[ -n "$TESTPLAN" ]]; then
  build_args+=( -testPlan "$TESTPLAN" )
fi

xcodebuild \
  "${build_args[@]}" \
  -destination "$DESTINATION" \
  -resultBundlePath "$RESULTS_PATH" \
  test
