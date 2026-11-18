# Primeiro agente Wazuh

## Pré-condições

- Endpoint autorizado e registrado no inventário.
- Resolução de nome e horário corretos.
- `1514/TCP` e `1515/TCP` alcançáveis do endpoint para o manager.
- Credenciais de enrollment protegidas.

## Enrollment

No dashboard, abra **Agents management → Summary → Deploy new agent** e gere as instruções correspondentes ao sistema operacional. Registre a versão do pacote e os parâmetros usados, mas remova tokens, senhas e chaves.

## Verificação

- O agente aparece como `Active` no dashboard.
- A conexão TCP para `1514` está estabelecida.
- O log do agente não apresenta repetição de erros de enrollment ou conexão.
- Hostname, IP, sistema e timestamp correspondem ao endpoint real.

## Evidência mínima

Preserve, de forma sanitizada, horário do enrollment, ID/nome do agente, versão, status e consulta que localizou o primeiro evento. Uma captura de tela isolada não substitui o registro textual.
