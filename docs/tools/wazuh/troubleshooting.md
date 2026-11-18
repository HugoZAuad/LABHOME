# Troubleshooting do Wazuh

## Ordem de investigação

1. Confirme horário, IP e DNS.
2. Teste alcance TCP a partir da origem correta.
3. Confira estado do agente e dos componentes centrais.
4. Leia logs antes de reiniciar serviços.
5. Verifique certificados, credenciais e permissões.
6. Compare a versão instalada com a documentação usada.

## Sintomas comuns

| Sintoma | Hipóteses iniciais | Evidência |
| --- | --- | --- |
| Agente nunca conecta | Porta, endereço ou enrollment incorreto | Teste 1514/1515 e log do agente |
| Dashboard indisponível | Serviço, firewall, certificado ou recurso | Estado do serviço e logs |
| Agente ativo sem evento esperado | Fonte não coletada, filtro ou janela de tempo | Evento original e configuração |
| Busca lenta/índice indisponível | Disco, memória ou saúde do indexer | Métricas, espaço e estado do cluster |
| Horários divergentes | NTP, timezone ou parsing | Relógios e timestamp original |

Nunca apague índices, certificados ou configurações como primeira tentativa. Preserve evidência e use snapshot/backup para mudanças de alto impacto.
