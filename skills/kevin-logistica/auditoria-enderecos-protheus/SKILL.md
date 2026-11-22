---
name: auditoria-enderecos-protheus
description: Use ao montar a auditoria diária de endereços no Protheus (TOTVS) — "plano de voo" para a operação reendereçar o que está parado (SBF = onde está hoje, SDB = de onde veio) e monitor de resíduos de saldo jogados em armazéns sensíveis (SD3, por tipo de movimento e fluxo de → para). Cobre método foto do dia + D-1, idade por camada FIFO, cadeia de origem, regras devido/validar, validação por backtest e entrega em uma folha A4.
---

# Auditoria diária de endereços no Protheus

## Quando usar
- O saldo "se perde" de endereço após transferências entre armazéns (ex.: saída do CQ para o estoque e daí para um armazém de trânsito).
- A operação não sabe para onde ir: precisa de uma lista "está aqui / veio daqui / o que fazer".
- Desconfiança de que alguém está "jogando" resíduo de saldo em armazéns de avaria, não conforme, retrabalho ou matéria-prima.
- Preparar inventário, ou conferir o que mudou durante um congelamento de operação.

## Relatórios (extrair em Excel, todas as colunas)
| Tabela | O que é | Papel no método |
|---|---|---|
| **SBF** | Saldo por endereço (foto) | **Está aqui**: produto, armazém, endereço, lote, quantidade |
| **SDB** | Movimentos por endereço | **Veio daqui**: cada entrada/saída com endereço, documento, sequencial, TM, origem (SD1/SD3/SC6/SC2), tipo de NF, data e hora |
| **SD3** | Movimentos internos | Monitor de resíduos: TM, RE/DE, armazém, documento, sequencial, usuário, custo, lote |
| SDA | Saldos a distribuir | Só o que ainda não foi endereçado. Endereços "de passagem" (ex.: A ENDERECAR) costumam ser endereços cadastrados e **não** aparecem aqui |

Peça à TI para incluir a descrição do produto (B1_DESC) na extração do SBF. Leia as colunas **pelo nome do cabeçalho**, não pela posição, porque o layout muda entre extrações. Nomes de tabela, TM e armazém variam por empresa e customização: **confirme com a TI**.

**Período:** SBF do dia + SDB/SD3 do dia anterior (D-1). Para descobrir a origem de saldos antigos, uma carga histórica de SDB (dividida em vários arquivos se passar do limite de linhas do Excel) anexada uma vez.

## Parte 1: plano de voo (SBF + SDB)
1. **Escopo:** um armazém por responsável (o que é seu). Separe o que é de outras áreas (produção, sobra de produção, operador logístico confiável) para não misturar responsabilidades.
2. **Idade por camada FIFO:** para cada chave produto+lote+endereço, empilhe as entradas e consuma pelas saídas. "Desde" = camada mais antiga que ainda tem saldo. Se o SDB não cobre todo o saldo, mostre "antes de {primeira data}" e marque a idade como "≥".
3. **Cadeia de origem:** a partir da entrada no endereço, volte pelo par saída/entrada (mesmo sequencial + documento; TM ≤ 500 entrada, > 500 saída). **Pule** movimentos dentro do mesmo armazém e endereços de passagem, porque eles apagam o endereço físico verdadeiro.
4. **Mesma liberação:** numa liberação, vários paletes saem de posições diferentes no mesmo minuto. Liste **todas** as posições do mesmo documento em ± 5 min, não só uma.
5. **Entrada por NF:** use o tipo de NF (N compra, D devolução de cliente…) e o armazém onde foi recebida. **Não presuma** "retorno simbólico" ou "devolução": confira o tipo.
6. **Ação pela origem (nunca pelo endereço atual):**
   - origem física no próprio armazém → "ir à origem e trazer/reendereçar";
   - origem na produção → "produção confirma onde está";
   - origem em operador externo → "confirmar com o operador e baixar o trânsito";
   - origem por NF → "confirmar onde a NF foi recebida fisicamente";
   - sem origem no período → "rastrear" (resolve com a carga histórica de SDB).
7. **Atenção:** sinalize quando lote ou código do produto mudou na transferência.
8. **Prioridade:** idade acima de 7 dias = **AGIR HOJE**; o resto = conferir. Agrupe por frente (chão, operador, produção, rastrear).
9. **Higiene:** ignore movimentos com data posterior à data do plano (data digitada errada) e avise; avise se o SDB não cobre D-1.

## Parte 2: monitor de resíduos (SD3)
1. Pegue todo movimento que **entra ou sai** dos armazéns monitorados (e toda saída do armazém de sobra de produção).
2. **Pareie RE/DE por sequencial + documento**, não por produto: em transferências que trocam o código (RE7/DE7) o produto muda. Descarte pares dentro do mesmo armazém.
3. Classifique pelo fluxo **de → para** numa tabela de regras escrita pelo dono do processo:

| Status | Significa |
|---|---|
| Devido | Fluxo esperado; só registra |
| Validar | Confirmar o motivo com quem fez (usuário do movimento) |
| Validar com evidência | Exigir evidência (foto, laudo, apontamento) |
| Ajuste manual | TMs de acerto de inventário/ajuste: sempre revisar |
| **Sem regra** | Nenhuma regra cobre: separar para o dono decidir. Caminho novo aparece aqui no primeiro dia |

4. Requisições de consumo de OP sem par (RE1/RE2/RE5) = consumo, devido.
5. Mostre o **usuário**, o custo e o documento em cada linha; resuma os principais usuários e o custo a validar.
6. **Frequência:** uma vez por dia, no início do expediente, olhando 24 h (D-1). Duas vezes por dia só em inventário ou congelamento.

## Validar o método antes de confiar
- **Reconstrução regressiva:** SBF de hoje menos os movimentos SDB posteriores deve reproduzir uma foto anterior conhecida. Meta: praticamente 100% das chaves batendo.
- **Backtest:** gere o plano numa data passada e veja o que se resolveu sozinho depois. Linhas antigas (> 7 dias) quase nunca se resolvem sem ação, e é isso que justifica o corte de prioridade.
- Durante congelamentos, procure jobs automáticos de integração que movimentam saldo sozinhos (muitos TMs idênticos, mesmo prefixo de documento). Peça à TI para pausá-los no inventário.

## Entrega para a operação
- **Uma folha só, uma linha por item:** prioridade · está aqui · veio daqui · o que fazer · Feito?. Nada de abas de bastidores, legendas longas ou cruzamentos extras: a análise fica com quem montou.
- A4 paisagem, cabeçalho com a data e as fontes, linha de assinatura, uma frente por página se ajudar a distribuir.
- Ferramenta preferida: **HTML local** que lê os .xlsx no próprio navegador (ZIP + `DecompressionStream('deflate-raw')`), com botões Gerar · Imprimir · Baixar CSV. Os dados não saem do computador.

## Regras
- Dados de estoque, clientes e NF são da empresa: **não publicar** em serviços externos, repositórios ou páginas públicas.
- Divergência entre sistema e físico é erro até prova em contrário.
- Cálculo sempre em código/fórmula, nunca estimado.
- Antes de mudar uma regra, confira o caso real que motivou a mudança e revise **todas** as linhas afetadas, não só o caso citado.
