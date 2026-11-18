# Validação do pipeline Wazuh

## Objetivo

Demonstrar que um evento controlado percorre endpoint, server, indexer e dashboard sem confundir conectividade com detecção.

## Testes

1. **Conectividade:** execute o preflight e confirme as portas necessárias.
2. **Estado:** confirme o agente `Active` pelo dashboard e pelo server.
3. **Telemetria:** produza um evento benigno e identificável no endpoint.
4. **Pesquisa:** localize o evento por hostname, origem e janela de tempo.
5. **Latência:** registre horários de geração e disponibilidade para consulta.
6. **Reinício controlado:** depois de snapshot, valide recuperação dos serviços.

## Resultado esperado

O evento contém origem e timestamp corretos, pode ser recuperado no dashboard e não apresenta lacuna inexplicada no caminho. Falhas devem entrar no diário com sintoma, evidência, hipótese, correção e reteste.
