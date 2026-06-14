#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "${ROOT}/docs"
for file in "${ROOT}"/wiki/*.md; do
  base="$(basename "${file}" .md)"
  awk 'BEGIN{fm=0} /^---$/ {fm++; next} fm==1 {next} fm>=2 {print}' "${file}" > "${ROOT}/docs/${base}.md"
done
