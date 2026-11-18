# ADR-0001: Wazuh como plataforma principal

- **Estado:** Aceito
- **Data:** 2026-11-17

## Contexto

O laboratório precisa centralizar telemetria, oferecer pesquisa, regras e visibilidade de endpoints sem exigir licença comercial.

## Decisão

Usar Wazuh como núcleo inicial de coleta e análise. Ele não substituirá sensores especializados nem será tratado como solução suficiente para todos os casos.

## Alternativas

Elastic Security oferece flexibilidade, mas aumenta decisões de composição. Security Onion integra NSM de forma ampla, porém mudaria o foco e os requisitos iniciais. Splunk possui forte ecossistema, mas comprometeria a reprodução aberta do núcleo.

## Consequências

Será necessário aprender seus decoders, regras, indexação e operação. Integrações deverão manter acesso ao evento original e evitar acoplamento desnecessário.
