# LAB-0002: Processo criado do Sysmon ao Wazuh

- **Estado:** Planejado
- **Data de planejamento:** 2026-11-17
- **Ambiente/versões:** PENDENTE

## Hipótese

Uma execução benigna e identificável produzirá um evento Process Create (ID 1) no canal local do Sysmon e o mesmo evento será recuperável no Wazuh com processo, linha de comando, pai, usuário, hash, host e timestamp preservados conforme a configuração ativa.

## Segurança

Use apenas um comando benigno em endpoint autorizado. Não inclua credenciais ou dados pessoais na linha de comando.

## Pré-condições

- Variante, versão e schema do Sysmon registrados.
- XML versionado com proveniência.
- Wazuh agent ativo e canal Sysmon configurado para coleta.
- Horários sincronizados.

## Procedimento

1. Registre horário UTC e hash do XML estudado.
2. Confirme que ProcessCreate está habilitado.
3. Execute um comando benigno exclusivo do laboratório.
4. Localize o evento ID 1 no Event Viewer.
5. Localize o mesmo evento no Wazuh.
6. Compare campos e registre latência.
7. Execute um caso negativo previsto pelo filtro e confirme o comportamento.

## Resultado

PENDENTE — o XML ainda não está no repositório e o teste não foi executado.
