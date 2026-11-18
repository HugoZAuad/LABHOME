# ADR-0002: Sysmon para telemetria Windows

- **Estado:** Aceito
- **Data:** 2026-11-17

## Contexto

Logs padrão do Windows não cobrem, por si só, todos os eventos necessários aos casos de uso planejados.

## Decisão

Usar Sysmon como fonte complementar, com configuração versionada, documentada e validada em ambiente controlado.

## Consequências

O aumento de volume exige tuning e medição. Event IDs não equivalem automaticamente a comportamento malicioso; filtros e regras precisarão de contexto e testes de falsos positivos.
