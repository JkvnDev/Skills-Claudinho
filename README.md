# Skills-Claudinho

Biblioteca pessoal de skills do Kevin para Claude (Claude.ai, Claude Code) e agentes compatíveis com o padrão [Agent Skills](https://agentskills.io) (ex.: OpenJarvis).

- **6 skills próprias** em PT-BR, focadas na logística da operação.
- **50 skills selecionadas** dos 10 pacotes originais, organizadas por categoria.
- **Catálogo completo** de ~1.000 skills dos pacotes: [CATALOGO-COMPLETO.md](CATALOGO-COMPLETO.md).
- Os zips originais estão preservados em `arquivo/zips/`.

## Estrutura

```
skills/
  kevin-logistica/        # próprias, PT-BR
  logistica/
  metodo-e-produtividade/
  escrita-e-comunicacao/
  apresentacoes-e-design/
  desenvolvimento/
  organizacao/
arquivo/zips/             # pacotes originais
scripts/instalar.sh       # copia as skills para ~/.claude/skills
```

## Como usar

**Claude Code / OpenJarvis (no computador):**

```bash
git clone https://github.com/JkvnDev/Skills-Claudinho.git
cd Skills-Claudinho
./scripts/instalar.sh                 # todas
./scripts/instalar.sh kevin-logistica # só uma categoria
```

**Claude.ai:** compacte a pasta de uma skill (ex.: `skills/kevin-logistica/recebimento-mp-cq`) em .zip e envie em *Configurações → Capabilities → Skills*.

**OpenJarvis:** `jarvis skill install` apontando para este repositório, ou copie as pastas para o diretório de skills configurado.

## Catálogo

### Logística do Kevin (próprias, PT-BR)

| Skill | Quando usar |
|---|---|
| [`analise-frete`](skills/kevin-logistica/analise-frete/SKILL.md) | Use ao analisar custos de frete rodoviário no Brasil — auditoria de CT-e, composição do frete (peso, ad valorem, GRIS, pedágio, TDE, ICMS), comparação de transportadoras, custo por kg e % sobre faturamento, OTIF e portal de solicitação de frete para clientes internos. |
| [`email-corporativo-ptbr`](skills/kevin-logistica/email-corporativo-ptbr/SKILL.md) | Use ao redigir e-mails e mensagens corporativas em português do Brasil para gestores, áreas parceiras, fornecedores e transportadoras — status de projeto, escalonamento, alinhamento entre setores, cobrança de pendências e comunicação de resultados. Estilo direto, objetivo e profissional. |
| [`erp-logistica-protheus-sap`](skills/kevin-logistica/erp-logistica-protheus-sap/SKILL.md) | Use ao trabalhar com estoque, recebimento, transferências, inventário e relatórios logísticos no Protheus (TOTVS) ou no SAP (MM/EWM), ou ao planejar a migração Protheus → SAP sem perder controles de processo. Traz rotinas, transações e equivalências. |
| [`indicadores-logisticos`](skills/kevin-logistica/indicadores-logisticos/SKILL.md) | Use ao definir, calcular ou revisar indicadores (KPIs) de armazém e logística — acuracidade de estoque, OTIF, lead time de recebimento, dock-to-stock, produtividade, custo logístico — e ao montar painéis em Excel/Power BI/Sheets que reflitam a realidade física da operação. |
| [`mapeamento-lean-processos`](skills/kevin-logistica/mapeamento-lean-processos/SKILL.md) | Use ao mapear processos logísticos ou industriais com método Lean — AS-IS/TO-BE, SIPOC, fluxograma por raias, VSM, DEIP (diagrama de entradas, interfaces e processos), pontos de controle, matriz RACI e Standard Work. Entrega documentos prontos para gestão e auditoria, em PT-BR. |
| [`recebimento-mp-cq`](skills/kevin-logistica/recebimento-mp-cq/SKILL.md) | Use ao analisar, desenhar ou corrigir o fluxo de recebimento de matéria-prima (MP) com inspeção de Qualidade (CQ) e quarentena — doca, conferência, NF-e, lote, liberação/rejeição do CQ, endereçamento e pontos de controle para evitar MP retida parando a produção. Foco em indústria química/lubrificantes com ERP Protheus (TOTVS) hoje e migração futura para SAP. |

### Logística e supply chain

| Skill | Origem | Quando usar |
|---|---|---|
| [`carrier-relationship-management`](skills/logistica/carrier-relationship-management/SKILL.md) | everything-claude-code | Codified expertise for managing carrier portfolios, negotiating freight rates, tracking carrier performance, allocating freight, and maintaining strategic carri… |
| [`customs-trade-compliance`](skills/logistica/customs-trade-compliance/SKILL.md) | everything-claude-code | Codified expertise for customs documentation, tariff classification, duty optimization, restricted party screening, and regulatory compliance across multiple ju… |
| [`inventory-demand-planning`](skills/logistica/inventory-demand-planning/SKILL.md) | everything-claude-code | Codified expertise for demand forecasting, safety stock optimization, replenishment planning, and promotional lift estimation at multi-location retailers. Infor… |
| [`logistics-exception-management`](skills/logistica/logistics-exception-management/SKILL.md) | everything-claude-code | Codified expertise for handling freight exceptions, shipment delays, damages, losses, and carrier disputes. Informed by logistics professionals with 15+ years o… |
| [`production-scheduling`](skills/logistica/production-scheduling/SKILL.md) | everything-claude-code | Codified expertise for production scheduling, job sequencing, line balancing, changeover optimization, and bottleneck resolution in discrete and batch manufactu… |
| [`quality-nonconformance`](skills/logistica/quality-nonconformance/SKILL.md) | everything-claude-code | Codified expertise for quality control, non-conformance investigation, root cause analysis, corrective action, and supplier quality management in regulated manu… |
| [`returns-reverse-logistics`](skills/logistica/returns-reverse-logistics/SKILL.md) | everything-claude-code | Codified expertise for returns authorization, receipt and inspection, disposition decisions, refund processing, fraud detection, and warranty claims management.… |

### Método e produtividade

| Skill | Origem | Quando usar |
|---|---|---|
| [`brainstorming`](skills/metodo-e-produtividade/brainstorming/SKILL.md) | superpowers | You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirem… |
| [`writing-plans`](skills/metodo-e-produtividade/writing-plans/SKILL.md) | superpowers | Use when you have a spec or requirements for a multi-step task, before touching code |
| [`executing-plans`](skills/metodo-e-produtividade/executing-plans/SKILL.md) | superpowers | Use when you have a written implementation plan to execute in a separate session with review checkpoints |
| [`verification-before-completion`](skills/metodo-e-produtividade/verification-before-completion/SKILL.md) | superpowers | Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output be… |
| [`systematic-debugging`](skills/metodo-e-produtividade/systematic-debugging/SKILL.md) | superpowers | Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes |
| [`dispatching-parallel-agents`](skills/metodo-e-produtividade/dispatching-parallel-agents/SKILL.md) | superpowers | Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies |
| [`writing-skills`](skills/metodo-e-produtividade/writing-skills/SKILL.md) | superpowers | Use when creating new skills, editing existing skills, or verifying skills work before deployment |
| [`deep-research`](skills/metodo-e-produtividade/deep-research/SKILL.md) | everything-claude-code | Multi-source deep research using firecrawl and exa MCPs. Searches the web, synthesizes findings, and delivers cited reports with source attribution. Use when th… |
| [`market-research`](skills/metodo-e-produtividade/market-research/SKILL.md) | everything-claude-code | Conduct market research, competitive analysis, investor due diligence, and industry intelligence with source attribution and decision-oriented summaries. Use wh… |
| [`search-first`](skills/metodo-e-produtividade/search-first/SKILL.md) | everything-claude-code | Research-before-coding workflow. Search for existing tools, libraries, and patterns before writing custom code. Invokes the researcher agent. |

### Escrita e comunicação

| Skill | Origem | Quando usar |
|---|---|---|
| [`humanizer`](skills/escrita-e-comunicacao/humanizer/SKILL.md) | humanizer | Remove signs of AI-generated writing from text. Use when editing or reviewing text to make it sound more natural and human-written. Based on Wikipedia's compreh… |
| [`article-writing`](skills/escrita-e-comunicacao/article-writing/SKILL.md) | everything-claude-code | Write articles, guides, blog posts, tutorials, newsletter issues, and other long-form content in a distinctive voice derived from supplied examples or brand gui… |
| [`content-research-writer`](skills/escrita-e-comunicacao/content-research-writer/SKILL.md) | awesome-claude-skills | Assists in writing high-quality content by conducting research, adding citations, improving hooks, iterating on outlines, and providing real-time feedback on ea… |
| [`internal-comms`](skills/escrita-e-comunicacao/internal-comms/SKILL.md) | awesome-claude-skills | A set of resources to help me write all kinds of internal communications, using the formats that my company likes to use. Claude should use this skill whenever … |
| [`meeting-insights-analyzer`](skills/escrita-e-comunicacao/meeting-insights-analyzer/SKILL.md) | awesome-claude-skills | Analyzes meeting transcripts and recordings to uncover behavioral patterns, communication insights, and actionable feedback. Identifies when you avoid conflict,… |
| [`tailored-resume-generator`](skills/escrita-e-comunicacao/tailored-resume-generator/SKILL.md) | awesome-claude-skills | Analyzes job descriptions and generates tailored resumes that highlight relevant experience, skills, and achievements to maximize interview chances |

### Apresentações e design

| Skill | Origem | Quando usar |
|---|---|---|
| [`frontend-slides`](skills/apresentacoes-e-design/frontend-slides/SKILL.md) | frontend-slides | Create stunning, animation-rich HTML presentations from scratch or by converting PowerPoint files. Use when the user wants to build a presentation, convert a PP… |
| [`emil-design-eng`](skills/apresentacoes-e-design/emil-design-eng/SKILL.md) | emil-kowalski/skills | This skill encodes Emil Kowalski's philosophy on UI polish, component design, animation decisions, and the invisible details that make software feel great. |
| [`apple-design`](skills/apresentacoes-e-design/apple-design/SKILL.md) | emil-kowalski/skills | Apple's approach to interface design and fluid, physical motion, translated for the web. Use when building or reviewing gesture-driven UI, spring animations, dr… |
| [`design-taste-frontend`](skills/apresentacoes-e-design/design-taste-frontend/SKILL.md) | taste-skill | Anti-slop frontend skill for landing pages, portfolios, and redesigns. The agent reads the brief, infers the right design direction, and ships interfaces that d… |
| [`minimalist-ui`](skills/apresentacoes-e-design/minimalist-ui/SKILL.md) | taste-skill | Clean editorial-style interfaces. Warm monochrome palette, typographic contrast, flat bento grids, muted pastels. No gradients, no heavy shadows. |
| [`high-end-visual-design`](skills/apresentacoes-e-design/high-end-visual-design/SKILL.md) | taste-skill | Teaches the AI to design like a high-end agency. Defines the exact fonts, spacing, shadows, card structures, and animations that make a website feel expensive. … |
| [`redesign-existing-projects`](skills/apresentacoes-e-design/redesign-existing-projects/SKILL.md) | taste-skill | Upgrades existing websites and apps to premium quality. Audits current design, identifies generic AI patterns, and applies high-end design standards without bre… |
| [`ui-ux-pro-max`](skills/apresentacoes-e-design/ui-ux-pro-max/SKILL.md) | ui-ux-pro-max-skill | UI/UX design intelligence for web and mobile. Includes 50+ styles, 161 color palettes, 57 font pairings, 161 product types, 99 UX guidelines, and 25 chart types… |
| [`ckm:design-system`](skills/apresentacoes-e-design/ckm:design-system/SKILL.md) | ui-ux-pro-max-skill | Token architecture, component specifications, and slide generation. Three-layer tokens (primitive→semantic→component), CSS variables, spacing/typography scales,… |
| [`ckm:slides`](skills/apresentacoes-e-design/ckm:slides/SKILL.md) | ui-ux-pro-max-skill | Create strategic HTML presentations with Chart.js, design tokens, responsive layouts, copywriting formulas, and contextual slide strategies. |
| [`ckm:brand`](skills/apresentacoes-e-design/ckm:brand/SKILL.md) | ui-ux-pro-max-skill | Brand voice, visual identity, messaging frameworks, asset management, brand consistency. Activate for branded content, tone of voice, marketing assets, brand co… |

### Desenvolvimento

| Skill | Origem | Quando usar |
|---|---|---|
| [`test-driven-development`](skills/desenvolvimento/test-driven-development/SKILL.md) | superpowers | Use when implementing any feature or bugfix, before writing implementation code |
| [`subagent-driven-development`](skills/desenvolvimento/subagent-driven-development/SKILL.md) | superpowers | Use when executing implementation plans with independent tasks in the current session |
| [`using-git-worktrees`](skills/desenvolvimento/using-git-worktrees/SKILL.md) | superpowers | Use when starting feature work that needs isolation from current workspace or before executing implementation plans - creates isolated git worktrees with smart … |
| [`requesting-code-review`](skills/desenvolvimento/requesting-code-review/SKILL.md) | superpowers | Use when completing tasks, implementing major features, or before merging to verify work meets requirements |
| [`receiving-code-review`](skills/desenvolvimento/receiving-code-review/SKILL.md) | superpowers | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical … |
| [`finishing-a-development-branch`](skills/desenvolvimento/finishing-a-development-branch/SKILL.md) | superpowers | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting stru… |
| [`mcp-builder`](skills/desenvolvimento/mcp-builder/SKILL.md) | awesome-claude-skills | Guide for creating high-quality MCP (Model Context Protocol) servers that enable LLMs to interact with external services through well-designed tools. Use when b… |
| [`skill-creator`](skills/desenvolvimento/skill-creator/SKILL.md) | awesome-claude-skills | Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Claude's capabil… |
| [`python-patterns`](skills/desenvolvimento/python-patterns/SKILL.md) | everything-claude-code | Pythonic idioms, PEP 8 standards, type hints, and best practices for building robust, efficient, and maintainable Python applications. |
| [`frontend-patterns`](skills/desenvolvimento/frontend-patterns/SKILL.md) | everything-claude-code | Frontend development patterns for React, Next.js, state management, performance optimization, and UI best practices. |
| [`api-design`](skills/desenvolvimento/api-design/SKILL.md) | everything-claude-code | REST API design patterns including resource naming, status codes, pagination, filtering, error responses, versioning, and rate limiting for production APIs. |
| [`postgres-patterns`](skills/desenvolvimento/postgres-patterns/SKILL.md) | everything-claude-code | PostgreSQL database patterns for query optimization, schema design, indexing, and security. Based on Supabase best practices. |
| [`docker-patterns`](skills/desenvolvimento/docker-patterns/SKILL.md) | everything-claude-code | Docker and Docker Compose patterns for local development, container security, networking, volume strategies, and multi-service orchestration. |
| [`security-review`](skills/desenvolvimento/security-review/SKILL.md) | everything-claude-code | Use this skill when adding authentication, handling user input, working with secrets, creating API endpoints, or implementing payment/sensitive features. Provid… |

### Organização

| Skill | Origem | Quando usar |
|---|---|---|
| [`file-organizer`](skills/organizacao/file-organizer/SKILL.md) | awesome-claude-skills | Intelligently organizes your files and folders across your computer by understanding context, finding duplicates, suggesting better structures, and automating c… |
| [`invoice-organizer`](skills/organizacao/invoice-organizer/SKILL.md) | awesome-claude-skills | Automatically organizes invoices and receipts for tax preparation by reading messy files, extracting key information, renaming them consistently, and sorting th… |

## Licenças

As skills de terceiros mantêm a licença original (ver `LICENSE` dentro de cada pasta e [CREDITOS.md](CREDITOS.md)). As skills de `kevin-logistica/` são de uso pessoal do autor.

Não foram incluídas: as skills de documentos da Anthropic (docx/xlsx/pptx/pdf, licença proprietária, já disponíveis no Claude) e o conteúdo do awesome-claude-code (CC BY-NC-ND).
