# Radar GitHub — nov/2026

Avaliação dos 3 repositórios em alta na semana (vídeo "GitHub da semana", @thehuttbr) para a Central do Kevin.

| Repositório | O que é | Decisão | O que entrou aqui |
|---|---|---|---|
| [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Servidor MCP + CLI do time do Chrome: o agente abre um Chrome de verdade, navega, clica, lê console e rede, tira screenshot e mede performance | **Adotar** | 5 skills em `skills/navegador-e-qa/` + configs em `config/mcp/` |
| [alibaba/open-code-review](https://github.com/alibaba/open-code-review) | CLI de code review com IA (`ocr`): comentários linha a linha, segurança (XSS, SQL injection), roda em GitHub Actions | **Adotar (modo delegate)** | `skills/desenvolvimento/open-code-review-delegate` |
| [dream-num/univer](https://github.com/dream-num/univer) | SDK para embutir planilha/documento/slides dentro de um app web, controlável por agentes | **Observar** | Nada por enquanto |

## 1. Chrome DevTools MCP — adotar

**Para que serve na nossa realidade**

- **Portal de frete (Klüber):** o agente testa o fluxo de solicitação como um usuário — abre a página, preenche, envia, lê erros do console e das requisições. Útil a cada mudança antes de liberar para os clientes internos.
- **Sistema da Alvarez Barbershop:** testar agenda/caixa no celular e no desktop, achar o que deixa a página lenta (LCP) e problemas de login/sessão (cookies).
- **Formulários (Way-V, Apps Script):** conferir se o formulário publicado funciona de ponta a ponta.

**Skills adicionadas** (`skills/navegador-e-qa/`)

| Skill | Quando usar |
|---|---|
| `chrome-devtools` | Base: navegar, clicar, preencher, ler console/rede, screenshot, performance |
| `chrome-devtools-troubleshooting` | Quando o MCP não sobe ou `list_pages`/`navigate_page` falham (renomeada de `troubleshooting` para não colidir) |
| `cookie-debugging` | Erros 401/403, login que cai, sessão expirando |
| `debug-optimize-lcp` | Página demorando para carregar |
| `a11y-debugging` | Contraste, foco, teclado, tamanho de toque (bom para uso no celular/coletor) |

Ficaram de fora: `chrome-devtools-cli`, `memory-leak-debugging`, `inspect-in-devtools` (não fazem falta hoje; estão no repositório original).

**Instalação**

- Requisitos: Node.js LTS + Google Chrome estável.
- **Claude Code:** `./config/mcp/claude-code.sh`
- **VS Code:** copie `config/mcp/vscode-mcp.json` para `.vscode/mcp.json` do projeto (ou para a config de usuário).
- Depois: `./scripts/instalar.sh navegador-e-qa`

**Cuidados (computador da Klüber)**

- O agente vê e pode alterar tudo que está aberto no navegador que ele controla. Por isso a config usa `--isolated` (perfil temporário, sem seus logins de SAP/Protheus/e-mail).
- `--no-performance-crux` evita mandar URLs internas para a API do Google; `--no-usage-statistics` desliga a telemetria.
- Verifique com a TI se é permitido instalar pacotes npm na máquina corporativa.

## 2. Open Code Review — adotar no modo delegate

**Para que serve:** revisão automática do código dos nossos projetos (portal de frete, sistema da barbearia, Apps Script) antes de publicar — pega bug e falha de segurança linha a linha.

**Por que o modo delegate:** o `ocr` só escolhe os arquivos e as regras; quem revisa é o próprio Claude que você já usa. Não precisa de chave de API extra nem de custo adicional.

**Instalação**

```bash
npm install -g @alibaba-group/open-code-review   # exige Git 2.41+
./scripts/instalar.sh desenvolvimento
```

Uso: peça ao agente "revise minhas alterações com o open code review" ou "revise a branch X contra a main".

Complementa (não substitui) `requesting-code-review` e `security-review`, que já estavam na biblioteca.

## 3. Univer — observar

- Open source (Apache-2.0): editor de planilhas/docs/slides com fórmulas, filtros, validação; tem MCP (`univer-mcp`).
- **Por que não agora:** importar/exportar Excel, gráficos, tabela dinâmica, colaboração em tempo real e impressão são da versão **Pro (paga)**. Nossas bases vivem em Google Sheets/Excel, e sem import/export ele não conversa com elas.
- **Quando reavaliar:** se o portal de frete ou o sistema da barbearia precisarem de uma planilha embutida dentro do próprio sistema (ex.: tabela de frete editável pelo usuário sem sair do portal).
