#!/usr/bin/env bash
# Copia as skills para ~/.claude/skills (ou $DESTINO). Uso: ./scripts/instalar.sh [categoria]
set -euo pipefail
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
DESTINO="${DESTINO:-$HOME/.claude/skills}"
CAT="${1:-}"
mkdir -p "$DESTINO"
n=0
for d in "$RAIZ"/skills/${CAT:-*}/*/; do
  [ -f "$d/SKILL.md" ] || continue
  nome="$(basename "$d")"
  rm -rf "$DESTINO/$nome"; cp -R "$d" "$DESTINO/$nome"; n=$((n+1))
done
echo "$n skills instaladas em $DESTINO"
