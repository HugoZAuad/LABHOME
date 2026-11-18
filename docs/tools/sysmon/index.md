# Sysmon

## Objetivo

O Sysmon fornece telemetria estruturada de baixo nível sobre atividades do Windows. Seus eventos são observações, não veredictos: um processo criado, uma consulta DNS ou uma alteração de Registro só ganha significado quando combinado com contexto e outros eventos.

## Variantes

Em 2026 existem duas rotas que devem ser distinguidas no laboratório:

- **Sysmon do Sysinternals:** serviço e driver distribuídos pela Microsoft Sysinternals.
- **Sysmon integrado ao Windows:** recurso opcional disponível em versões atuais do Windows 11.

Antes de versionar ou aplicar uma configuração, registre variante, versão do binário ou recurso, versão do schema e sistema operacional. Este projeto não assume que os dois métodos possuem ciclo de vida operacional idêntico.

## Canal de eventos

Os eventos ficam em **Applications and Services Logs → Microsoft → Windows → Sysmon → Operational**. Timestamps do evento são registrados em UTC.

## Princípio central

O `sysmonconfig.xml` determina quais evidências serão coletadas ou descartadas. Ele não é uma coleção de detecções e não substitui regras no Wazuh. Uma exclusão excessiva remove evidência que não poderá ser recuperada retroativamente.

## Trilha de estudo

1. [Anatomia do XML](configuration.md)
2. [Catálogo de eventos](events.md)
3. [Tuning e controle de volume](tuning.md)
4. [Integração com Wazuh](wazuh-integration.md)
5. [Workflow de estudo da configuração](study-workflow.md)
