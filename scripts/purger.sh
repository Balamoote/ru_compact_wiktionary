#!/bin/bash

moda="1106"

wiki="ru-extract.jsonl.gz"

if [[ -s $wiki ]]; then
  zgrep -E "^\{\"word\": \"[^\"]+\", \"pos\": \"[^\"]+\", \"lang_code\": \"ru\"," $wiki | gzip > ru$moda.gz
else
  printf "%s %s\n" $wiki "не найден!"
fi
