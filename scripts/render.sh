#!/usr/bin/env bash
set -euo pipefail

title=$(grep '^title:' config/app.yaml | cut -d: -f2- | tr -d ' "')
message=$(grep '^message:' config/app.yaml | cut -d: -f2- | tr -d ' "')
color=$(grep '^color:' config/app.yaml | cut -d: -f2- | tr -d ' "')

sed -e "s|{{TITLE}}|${title}|g" \
    -e "s|{{MESSAGE}}|${message}|g" \
    -e "s|{{COLOR}}|${color}|g" \
    site/index.html > live/index.html

echo "Rendered live/index.html"
