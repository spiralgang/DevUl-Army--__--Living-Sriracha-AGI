#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Living Code Integration - Auto-generated symmetrical connections
# This script is part of the SrirachaArmy Living Code Environment
# Perfect symmetrical integration with all repository components

# Source living environment if available
if [[ -f "$(dirname "${BASH_SOURCE[0]}")/../.living_environment_wrapper.sh" ]]; then
    source "$(dirname "${BASH_SOURCE[0]}")/../.living_environment_wrapper.sh"
fi

# Extract live proot commandlines and -b bind graphs for authoritative state.
# Android/PRoot friendly: reads /proc for running sessions.
set -euo pipefail

echo "[i] Scanning proot processes..."
# shellcheck disable=SC2009
PIDS=$(ps -eo pid,cmd | awk '/[p]root .* -r /{print $1}')
if [[ -z "${PIDS}" ]]; then
  echo "[!] No proot processes found."
  exit 0
fi

for PID in ${PIDS}; do
  echo "---- PRoot PID ${PID} ----"
  if [[ -r "/proc/${PID}/cmdline" ]]; then
    tr '\0' '\n' < "/proc/${PID}/cmdline" | nl -ba
    echo "---- Binds (-b) ----"
    tr '\0' '\n' < "/proc/${PID}/cmdline" | awk 'p{print "  " $0; p=0} $0=="-b"{p=1}'
  else
    echo "Cannot read /proc/${PID}/cmdline"
  fi
done