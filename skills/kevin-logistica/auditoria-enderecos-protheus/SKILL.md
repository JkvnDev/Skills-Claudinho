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
9. **Higiene:** ignore movimentos com data posterior à data do plano (data digitada errada) e avise; avise se o SDB não cobre D-1 **em dias úteis** (na segunda-feira, domingo sem movimento não é falta; feriado precisa de calendário).
10. **Prazo por tipo de endereço:** passagem (ex.: A ENDERECAR), trânsito e demais endereços têm prazos próprios e configuráveis. Não reaproveite o prazo de um tipo para outro sem querer.
11. **Frente pela regra, não pelo texto:** defina a frente (chão, operador, produção, rastrear) no mesmo ponto em que define a ação. Deduzir a frente do texto da ação quebra quando alguém muda a redação.

### Comparar com o dia anterior (backlog)
- Anexe, de forma opcional, o CSV do plano anterior, que a própria ferramenta baixa. Chave = endereço + produto + lote, **tolerante ao Excel** (sem zeros à esquerda, em maiúsculas), porque alguém sempre abre e salva o CSV.
- Cada linha sai como **NOVO** ou **CONTINUA desde dd/mm**. O que estava no plano anterior e sumiu vai para **Resolvidos**: conferir se a baixa foi física.
- Novos × resolvidos por dia = **KPI de backlog**. É o indicador que leva o tema à gerência.
- **Visão de gestão separada da folha da operação:** situação, comparativo e resolvidos aparecem na tela e no CSV. Na impressão, só saem se forem marcados. A folha da operação continua enxuta.

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

   - **As regras de fluxo valem só para pares com TM de transferência** (ex.: 999/499). Um par com TM de exceção é **ajuste manual**. Um par com qualquer outro TM é **sem regra**, com o TM na descrição.
   - **As regras ficam num bloco de configuração** no topo da ferramenta, separado da lógica. Assim, incluir um fluxo novo não mexe no motor.
4. Requisições de consumo de OP sem par (RE1/RE2/RE5) = consumo, devido. **Exceção:** consumo saindo de um armazém de **não conforme** ou de **divergência** vira "validar com evidência". Material bloqueado não pode virar consumo sem rastro. Antes de ligar essa trava, levante o histórico: se for raro, ela não gera ruído e só pega o caso real.
5. Mostre o **usuário**, o custo e o documento em cada linha; resuma os principais usuários e o custo a validar.
6. **Frequência:** uma vez por dia, no início do expediente, olhando 24 h (D-1). Duas vezes por dia só em inventário ou congelamento. Avise quando a SD3 não cobre o último dia útil.
7. **Pendências que voltam:** anexe, de forma opcional, o CSV do monitor anterior com a coluna "Validado?" preenchida (S, X ou OK).
   - O que não foi validado volta como **PENDENTE**, trazendo a evidência que já foi anotada, e fica no topo do grupo.
   - O que já foi validado e reaparece num arquivo de vários dias sai da lista.
   - Chave: data + de + para + TM + produto + lote + documento, tolerante ao Excel.

## Validar o método antes de confiar
- **Reconstrução regressiva:** SBF de hoje menos os movimentos SDB posteriores deve reproduzir uma foto anterior conhecida. Meta: praticamente 100% das chaves batendo.
- **Backtest:** gere o plano numa data passada e veja o que se resolveu sozinho depois. Linhas antigas (> 7 dias) quase nunca se resolvem sem ação, e é isso que justifica o corte de prioridade.
- **Regressão a cada versão:** rode a ferramenta antiga e a nova com os mesmos arquivos de referência. As linhas precisam sair idênticas, a menos que a mudança seja intencional; nesse caso, explique cada diferença. Funções novas se testam com um arquivo sintético que tenha um caso por regra.
  - Sem Node nem Python, o Edge headless resolve: `msedge --headless=new --allow-file-access-from-files --virtual-time-budget=120000 --dump-dom pagina.html`. Use um script injetado que lê os arquivos por XHR e grava o resultado num atributo do body. A leitura às vezes termina antes do processamento; nesse caso, repita.
  - Arquivo grande demais para o navegador: leia em fluxo fora dele (XmlReader em C# via `Add-Type` lê 1 GB de XML de planilha em poucos minutos).
- Durante congelamentos, procure jobs automáticos de integração que movimentam saldo sozinhos (muitos TMs idênticos, mesmo prefixo de documento). Peça à TI para pausá-los no inventário.

## Entrega para a operação
- **Uma folha só, uma linha por item:** prioridade · está aqui · veio daqui · o que fazer · Feito?. Nada de abas de bastidores, legendas longas ou cruzamentos extras: a análise fica com quem montou.
- A4 paisagem, cabeçalho com a data e as fontes, linha de assinatura, uma frente por página se ajudar a distribuir.
- **Responsável no cabeçalho** de cada frente ou grupo (campo salvo no navegador, com espaço em branco quando vazio). Folha sem dono não tem quem cobrar.
- Plano sem linhas imprime uma folha **"Nada a fazer"** com a contagem do que está no prazo. Nunca deixe a página em branco.
- Ferramenta preferida: **HTML local** que lê os .xlsx no próprio navegador (ZIP + `DecompressionStream('deflate-raw')`), com botões Gerar · Imprimir · Baixar CSV. Os dados não saem do computador. Cada HTML é autossuficiente (leitor e logo embutidos), porque é enviado sozinho por e-mail.
- **Robustez de arquivo:**
  - Identifique o formato pelos bytes, não pela extensão. `D0 CF 11 E0` = .xls antigo; um .xls que começa com `<` é HTML. Nos dois casos, oriente a salvar como .xlsx.
  - Um .xlsx de mais de ~80 MB descompacta para mais de 1 GB de XML e derruba o navegador. Recuse com uma mensagem e peça CSV ou um período menor.
  - Em CSV pt-BR, "1.500" sem vírgula é milhar (1500), não 1,5.

## Regras
- Dados de estoque, clientes e NF são da empresa: **não publicar** em serviços externos, repositórios ou páginas públicas.
- Divergência entre sistema e físico é erro até prova em contrário.
- Cálculo sempre em código/fórmula, nunca estimado.
- Antes de mudar uma regra, confira o caso real que motivou a mudança e revise **todas** as linhas afetadas, não só o caso citado.
