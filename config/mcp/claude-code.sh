#!/usr/bin/env bash
# Registra o Chrome DevTools MCP no Claude Code (escopo do usuário).
# --isolated: perfil temporário, sem os logins do seu Chrome do dia a dia.
# --no-usage-statistics / --no-performance-crux: não envia estatísticas nem URLs para o Google.
set -euo pipefail
claude mcp add chrome-devtools --scope user -- \
  npx -y chrome-devtools-mcp@latest --isolated --no-usage-statistics --no-performance-crux
echo "OK. Reinicie o Claude Code e rode /mcp para conferir."
