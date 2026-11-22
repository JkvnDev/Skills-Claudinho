---
name: analise-frete
description: Use ao analisar custos de frete rodoviário no Brasil — auditoria de CT-e, composição do frete (peso, ad valorem, GRIS, pedágio, TDE, ICMS), comparação de transportadoras, custo por kg e % sobre faturamento, OTIF e portal de solicitação de frete para clientes internos.
---

# Análise de frete (Brasil, rodoviário)

## Quando usar
- Comparar cotações ou tabelas de transportadoras.
- Auditar faturas/CT-e contra a tabela negociada.
- Montar indicadores ou painel de frete.
- Evoluir o portal de solicitação de frete dedicado (clientes internos).

## Composição típica do frete fracionado
| Componente | Base de cálculo |
|---|---|
| Frete peso | Faixa de peso ou R$/kg; usa o maior entre peso real e peso cubado |
| Frete valor (ad valorem) | % sobre o valor da NF-e |
| GRIS | % sobre o valor da NF-e (gerenciamento de risco) |
| Pedágio | Por fração de 100 kg ou por eixo (lotação) |
| Taxa de despacho / CT-e | Valor fixo por documento |
| TDE / TDA / TRT | Taxas de dificuldade de entrega, área de difícil acesso, restrição de trânsito |
| Frete mínimo | Piso por CT-e |
| ICMS | Conforme operação e UFs; verificar se a tabela é "com" ou "sem" ICMS |

**Peso cubado** = m³ × fator de cubagem do contrato (rodoviário costuma ser 300 kg/m³; confirme no contrato).
Para produtos químicos/perigosos, confira adicionais de carga perigosa e exigências de documentação (ONU, ficha de emergência).

## Auditoria de CT-e (passo a passo)
1. Cruzar CT-e × NF-e (peso, valor, volumes, origem/destino).
2. Recalcular o frete pela tabela vigente na data de emissão.
3. Sinalizar diferenças acima da tolerância (ex.: > 2% ou > R$ 10).
4. Agrupar divergências por transportadora e por componente (a taxa extra mais cobrada indevidamente costuma se repetir).

## Indicadores
- Custo de frete / faturamento (%), por cliente, rota e transportadora.
- Custo por kg e por entrega.
- OTIF (no prazo e completo) por transportadora.
- % de fretes emergenciais/dedicados e o motivo (planejamento, falha de estoque, cliente).
- Divergência de auditoria recuperada (R$/mês).

## Portal de frete dedicado — boas práticas
- Formulário com campos obrigatórios que permitam cotar sem ida e volta: origem, destino, peso, cubagem, valor da NF, tipo de veículo, janela, produto perigoso (S/N), centro de custo e justificativa.
- Status visível ao solicitante (solicitado → cotado → aprovado → coletado → entregue).
- Registrar o motivo de cada frete dedicado: é o dado que permite reduzi-los depois.
- Evoluções por fase, com entrega para a gerência ao fim de cada fase.

## Entregáveis
- Planilha comparativa de transportadoras (simulação com notas reais dos últimos 3 meses).
- Relatório de auditoria com divergências e valor a recuperar.
- Painel com os indicadores acima.
