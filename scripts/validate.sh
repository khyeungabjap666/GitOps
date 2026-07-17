#!/usr/bin/env bash
set -euo pipefail

for key in title message color; do
  grep -q "^${key}:" config/app.yaml || { echo "Missing: $key"; exit 1; }
done
./scripts/render.sh
echo "Validation passed"
