---
name: indicadores-logisticos
description: Use ao definir, calcular ou revisar indicadores (KPIs) de armazém e logística — acuracidade de estoque, OTIF, lead time de recebimento, dock-to-stock, produtividade, custo logístico — e ao montar painéis em Excel/Power BI/Sheets que reflitam a realidade física da operação.
---

# Indicadores logísticos

## Princípio
O indicador precisa refletir a realidade física. Antes de mostrar um número, confirme que sistêmico e físico batem; um KPI bonito sobre dados errados é pior que nenhum.

## Ficha de cada indicador (preencher sempre)
Nome | Fórmula | Fonte do dado | Frequência | Meta | Dono | Ação quando fora da meta.

## Catálogo
| Indicador | Fórmula | Observação |
|---|---|---|
| Acuracidade de estoque (por item) | itens sem divergência ÷ itens contados | Mais exigente que acuracidade por valor; use as duas |
| Acuracidade por endereço | endereços corretos ÷ endereços contados | Pega erro de endereçamento que o saldo total esconde |
| Dock-to-stock / lead time de recebimento | hora endereçado − hora de chegada | Abra por etapa (doca, entrada, CQ, endereço) |
| % liberação CQ no SLA | lotes liberados no prazo ÷ lotes inspecionados | Por classe de criticidade |
| OTIF | pedidos no prazo e completos ÷ pedidos | Defina "prazo" (data prometida ou solicitada) e não mude |
| Fill rate | linhas atendidas completas ÷ linhas | |
| Produtividade de separação | linhas separadas ÷ hora-homem | |
| Custo logístico / faturamento | custo (frete + armazém + pessoal) ÷ receita | |
| Ruptura que afetou produção | ocorrências e horas paradas por falta de material | Indicador de impacto, apresentar à gestão |
| Backlog de pendências | itens pendentes por idade (0–2, 3–7, > 7 dias) | Bom para rotina diária |

## Painel
- Topo: 3–5 indicadores-chave com tendência (últimas 8–12 semanas), não só o mês.
- Meio: abertura por área, turno, fornecedor ou transportadora.
- Base: lista de exceções com dono e prazo (é o que gera ação).
- Sempre data de atualização e fonte visíveis.

## Rotina
- Diária (10–15 min, em pé): backlog, exceções do dia, riscos para a produção.
- Semanal: tendência dos KPIs e status das ações.
- Mensal: apresentação executiva com problema, causa, ação e ganho.
