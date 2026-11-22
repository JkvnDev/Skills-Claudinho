---
name: recebimento-mp-cq
description: Use ao analisar, desenhar ou corrigir o fluxo de recebimento de matéria-prima (MP) com inspeção de Qualidade (CQ) e quarentena — doca, conferência, NF-e, lote, liberação/rejeição do CQ, endereçamento e pontos de controle para evitar MP retida parando a produção. Foco em indústria química/lubrificantes com ERP Protheus (TOTVS) hoje e migração futura para SAP.
---

# Recebimento de MP com CQ e quarentena

## Quando usar
- MP ficou presa em quarentena e atrasou/parou a produção.
- Desenhar ou revisar o fluxo doca → conferência → CQ → liberação → endereçamento.
- Criar pontos de controle, indicadores ou checklist de recebimento.
- Preparar a transição do processo para o SAP sem perder os controles.

## Fluxo de referência (TO-BE mínimo)

| # | Etapa | Dono | Saída / evidência | Ponto de controle |
|---|---|---|---|---|
| 1 | Agendamento da entrega | Compras/Logística | Janela de doca confirmada | Entrega sem agenda = exceção registrada |
| 2 | Chegada e portaria | Portaria | Registro de chegada (hora) | Hora de chegada vira o "relógio zero" do lead time |
| 3 | Conferência física × NF-e × pedido | Recebimento | Divergências registradas (qtd, lote, validade, embalagem) | Divergência bloqueia a entrada até tratativa |
| 4 | Lançamento da entrada no ERP | Fiscal/Recebimento | Documento de entrada; saldo em armazém de CQ | Saldo nunca entra direto em armazém disponível se o item exige inspeção |
| 5 | Amostragem e envio ao laboratório | Recebimento → CQ | Amostra identificada (item, lote, data/hora) | Amostra com SLA de coleta (ex.: até 2 h após entrada) |
| 6 | Análise e laudo | CQ | Laudo / certificado (CoA) conferido | SLA por classe de item (crítico, padrão) |
| 7 | Liberação ou rejeição no ERP | CQ | Baixa do CQ (liberado / rejeitado / liberado com restrição) | Liberação física e sistêmica no mesmo dia |
| 8 | "Plano de voo" de reendereçamento | Estoque | Lista do que sai da área de quarentena e para qual endereço | Nada liberado fica parado na quarentena após X horas |
| 9 | Endereçamento e confirmação | Estoque | Endereço confirmado no sistema | Saldo por endereço = físico |

**Plano de voo:** lista diária, ordenada pela necessidade da produção (data de uso no plano), dos lotes que aguardam CQ ou já foram liberados e precisam ser movidos. É o elo que costuma faltar entre "CQ liberou" e "produção consegue usar".

## Causas comuns de MP retida (investigar nesta ordem)
1. Amostra não coletada ou não chegou ao laboratório (ninguém dono da passagem 5).
2. Laudo do fornecedor (CoA) ausente ou divergente.
3. CQ liberou fisicamente mas não baixou no sistema, ou o inverso.
4. Liberado no sistema, mas não reendereçado: produção não "vê" o material no endereço esperado.
5. Prioridade do CQ não segue o plano de produção (fila por ordem de chegada em vez de data de uso).
6. Item sem classificação de criticidade → tudo tratado igual.

## Indicadores
- **Lead time doca→disponível** (h): chegada até endereço confirmado. Abrir em etapas (doca→entrada, entrada→amostra, amostra→laudo, laudo→baixa, baixa→endereço) para achar o gargalo.
- **% de lotes liberados dentro do SLA**, por classe de item.
- **Lotes em quarentena com uso previsto em ≤ 48 h** (lista de risco diária).
- **Divergências de recebimento** (% das entregas) por fornecedor.
- **Acuracidade da área de quarentena**: saldo sistêmico × físico.
Prefira indicadores que reflitam a realidade física; um KPI "verde" com material parado na quarentena está errado.

## Protheus (TOTVS) — referências
Nomes e parâmetros variam por versão e customização: confirme com a TI antes de citar.
- Pré-nota: MATA140. Documento de entrada: MATA103.
- Armazém de CQ: definido pelo parâmetro `MV_CQ` (padrão "98").
- Baixas do CQ (liberar/rejeitar): MATA175. Inspeção de entradas (se usado): módulo SIGAQIE.
- Endereçamento de saldos a distribuir (controle de localização): MATA265.
- Transferência entre armazéns: MATA260/MATA261.

## Equivalência para o SAP (migração)
- Entrada com inspeção: MIGO (101) gerando lote de controle (QM) e estoque em controle de qualidade.
- Decisão de utilização: QA11 / QA32. Estoque: MMBE, MB52; movimentos: MB51.
- Com EWM: tipo de estoque de qualidade (ex.: Q1/Q2) e monitor /SCWM/MON.
Documente os pontos de controle **agora**, em termos de processo e não de transação, para que sejam reconfigurados no SAP em vez de perdidos.

## Entregáveis típicos
- Fluxo AS-IS/TO-BE da tabela acima, com donos e SLAs.
- Checklist de recebimento (uma página).
- Planilha "plano de voo" diária: item, lote, status CQ, data de uso, endereço de destino, responsável.
- Relatório de lead time por etapa com os 5 piores casos do mês.
