#!/bin/bash
if command -v pigz >/dev/null 2>&1; then zipper="pigz"; else zipper="gzip"; fi

moda=$(cat version)

wiki="ru-extract.jsonl.gz"

if [[ -s $wiki ]]; then
  zgrep -E "^\{\"word\": \"[^\"]+\", \"pos\": \"[^\"]+\", \"lang_code\": \"ru\"," $wiki | $zipper > ru$moda.gz
else
  printf "%s %s\n" $wiki "не найден!"
fi
