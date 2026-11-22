---
name: erp-logistica-protheus-sap
description: Use ao trabalhar com estoque, recebimento, transferências, inventário e relatórios logísticos no Protheus (TOTVS) ou no SAP (MM/EWM), ou ao planejar a migração Protheus → SAP sem perder controles de processo. Traz rotinas, transações e equivalências.
---

# ERP logístico: Protheus e SAP

Nomes de rotinas e transações mudam conforme versão e customização. Sempre indique que o usuário confirme no ambiente dele.

## Equivalências principais
| Processo | Protheus (TOTVS) | SAP MM / EWM |
|---|---|---|
| Pré-nota / documento de entrada | MATA140 / MATA103 | MIGO (101), MIRO (fatura) |
| Saldo em estoque | Consulta de saldos do produto (confirmar rotina no ambiente) | MMBE, MB52 |
| Movimentos de estoque (kardex) | Relatório/consulta kardex (confirmar rotina no ambiente) | MB51 |
| Transferência entre armazéns | MATA260 / MATA261 | MIGO (311), /SCWM/ADHOC (EWM) |
| Movimentação interna (requisição/devolução) | MATA240 / MATA241 | MIGO (201, 261…) |
| Inspeção / CQ | Armazém `MV_CQ` (padrão 98), MATA175 (baixas CQ), SIGAQIE | Lote de controle QM, QA32 / QA11; estoque Q no EWM |
| Endereçamento | MATA265 (saldos a distribuir) | Tarefas de depósito (/SCWM/TO_CONF) |
| Inventário | MATA270 (digitação), MATA340 (acerto) | MI01/MI04/MI07; /SCWM/PI_PROCESS (EWM) |
| Monitor do depósito | — | /SCWM/MON |
| Consignação / estoque especial | Poder de terceiros | MB58 |

## Boas práticas de análise
- Extraia os dados para planilha e calcule em código ou fórmula; não estime saldos "de cabeça".
- Concilie sempre sistêmico × físico antes de concluir qualquer coisa sobre estoque.
- Em kardex, filtre por tipo de movimento para separar entrada de compra, transferência, ajuste de inventário e consumo.
- Ajustes de inventário recorrentes no mesmo item/endereço indicam falha de processo, não de contagem.

## Migração Protheus → SAP
1. Liste os **controles de processo** atuais (pontos de controle, bloqueios, aprovações), escritos sem nome de rotina.
2. Mapeie cada controle para o recurso SAP equivalente (tipo de estoque, status, workflow, autorização).
3. Identifique o que hoje é controle manual (planilha, e-mail, portal paralelo) e decida: automatizar no SAP ou manter como processo.
4. Defina dados mestres críticos: material, lote, validade, unidade, endereço, criticidade para o CQ.
5. Prepare a carga de saldos com inventário rotativo forte nos 2–3 meses anteriores ao go-live.
6. Treine os usuários-chave com o Standard Work atualizado para o SAP.
