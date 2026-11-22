---
name: mapeamento-lean-processos
description: Use ao mapear processos logísticos ou industriais com método Lean — AS-IS/TO-BE, SIPOC, fluxograma por raias, VSM, DEIP (diagrama de entradas, interfaces e processos), pontos de controle, matriz RACI e Standard Work. Entrega documentos prontos para gestão e auditoria, em PT-BR.
---

# Mapeamento Lean de processos

## Quando usar
- "Mapear o processo X", "fazer o AS-IS / TO-BE", "montar um DEIP", "criar Standard Work".
- Achar gargalos, desperdícios e onde colocar pontos de controle.
- Transformar a operação em documento formal (gestão, auditoria, treinamento).

## Sequência de trabalho
1. **Escopo**: início e fim do processo, cliente do processo, problema que motivou o mapeamento (com um caso real e o impacto, ex.: horas de produção parada).
2. **SIPOC**: Fornecedores, Entradas, Processo (5–7 macroetapas), Saídas, Clientes.
3. **AS-IS por raias** (uma raia por área/função): registre o que *de fato* acontece, inclusive retrabalho, esperas e "jeitinhos". Valide no gemba, não só em reunião.
4. **Dados por etapa**: tempo de ciclo, tempo de espera, % de erro/retrabalho, sistema usado, documento gerado.
5. **Desperdícios (8)**: espera, transporte, movimentação, superprocessamento, estoque, defeitos, superprodução, talento não aproveitado. Marque cada um no AS-IS.
6. **TO-BE**: elimine etapas sem valor, defina donos únicos para cada passagem entre áreas, coloque pontos de controle e SLAs.
7. **Pontos de controle**: para cada passagem crítica, defina *o que* é verificado, *quem* verifica, *evidência* e *o que fazer se falhar*.
8. **RACI** das etapas do TO-BE.
9. **Standard Work** das etapas operacionais.
10. **Plano de implantação**: ações, dono, prazo; trabalhe em lotes pequenos (2 ações por vez).

## DEIP único
Um diagrama que junta, em uma folha, todos os processos do escopo e as interfaces entre eles:
- Colunas: Entradas → Processo → Interfaces (áreas/sistemas) → Saídas → Controles.
- Uma linha por processo (ex.: recebimento de MP, inspeção CQ, liberação, endereçamento, saída da produção, conferência de PA).
- Cada interface entre áreas recebe um ID de ponto de controle (PC-01, PC-02…) que se repete no fluxograma e no checklist.

## Standard Work (modelo)
Cabeçalho: código (ex.: SW-ALM-001), processo, versão, data, elaborado/aprovado.
Corpo em tabela: Passo | O que fazer | Como (pontos-chave) | Por quê | Sistema/tela | Foto/evidência.
Rodapé: indicadores do processo, desvios comuns e como tratar, histórico de revisões.

## Regras de qualidade
- Um verbo por etapa ("Conferir NF-e × pedido"), nunca "Gerenciar recebimento".
- Toda seta entre raias precisa de dono e gatilho.
- Diferencie claramente o que é sistema (ERP/portal) e o que é físico.
- Registre a fonte dos tempos (cronometrado, sistema, estimativa).
- Versão para gestão: 1 página com problema, causa, TO-BE e ganho. Versão para auditoria: responsabilidades, evidências e referências de sistema.

## Entregáveis
- Fluxograma AS-IS e TO-BE (Mermaid, BPMN ou Whiteboard).
- DEIP em planilha.
- Matriz de pontos de controle e RACI.
- Standard Work por etapa operacional.
- One-pager executivo.
