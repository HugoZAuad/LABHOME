# Fluxo de dados

## Etapas

| Etapa | Pergunta de controle |
|---|---|
| Geração | O evento representa o comportamento necessário? |
| Coleta | O sensor está ativo e sua configuração é conhecida? |
| Transporte | Há autenticação, criptografia e tolerância a falhas? |
| Normalização | Campos e timestamps preservam o significado original? |
| Armazenamento | Retenção e acesso são adequados ao caso de uso? |
| Detecção | A regra é testável e possui contexto suficiente? |
| Resposta | O analista consegue chegar ao evento original? |

## Convenções

Todos os sistemas devem sincronizar horário. Eventos preservam timestamp original, hostname estável, origem e identificadores úteis. Transformações precisam ser documentadas para evitar que uma consulta dependa de comportamento implícito.
