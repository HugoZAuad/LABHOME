# Guia do projeto

## Por que o projeto existe

O OpenSOC Lab começou como um laboratório para estudar Wazuh e evoluiu para uma plataforma pessoal de Detection Engineering, Threat Hunting, DFIR, Network Security Monitoring e Threat Intelligence. Esse crescimento é intencional, mas precisa ser controlado por releases e critérios de aceite.

## Escopo atual

O foco imediato é o caminho completo de telemetria Windows:

```text
Atividade no endpoint
→ Sysmon / Windows Event Log
→ Wazuh agent
→ Wazuh server
→ Indexer
→ Dashboard
→ Regra, hunt ou investigação
```

Ferramentas futuras não devem ser adicionadas apenas por popularidade. Cada componente precisa responder a uma necessidade que o ambiente atual não cobre adequadamente.

## Públicos

- O mantenedor, como diário e trilha de aprendizado.
- Outros estudantes, como guia reproduzível.
- Profissionais técnicos, como portfólio baseado em evidências.
- Colaboradores, como especificação de arquitetura e padrões.

## O que já existe

- Host Windows 11 executando Oracle VirtualBox.
- Rede NAT `SOC-LAB-NAT`.
- VM Wazuh all-in-one baseada em Ubuntu Server 24.04.5 LTS.
- Wazuh 4.14.8 com manager, indexer, dashboard e Filebeat.
- VM Windows 11 Enterprise Evaluation chamada `WIN-ENDPOINT-01`.
- Agente Wazuh ativo no endpoint.
- Estrutura documental, ADRs, laboratórios e scripts de análise.

## O que ainda não está concluído

- Inventário automatizado completo das VMs.
- Evidência versionada do primeiro evento ponta a ponta.
- `sysmonconfig.xml` real no repositório, com origem e licença.
- Baseline de volume e desempenho do Sysmon.
- Primeira regra Sigma validada com campos reais.
- Telemetria Linux, sensores de rede, CTI, DFIR e deception.

## Como as informações são classificadas

| Classificação | Significado |
| --- | --- |
| Planejado | Ideia aceita no roadmap, ainda não executada |
| Informado | Relato do mantenedor sem artefato suficiente no repositório |
| Observado | Visível em captura, comando ou arquivo |
| Validado | Teste reproduzível com critério de aceite atendido |
| Bloqueado | Depende de pré-condição explicitamente registrada |

## Estratégia para controlar o crescimento

1. Trabalhar em uma release principal por vez.
2. Limitar cada laboratório a uma hipótese.
3. Não introduzir uma ferramenta sem ADR ou justificativa equivalente.
4. Manter README curto e concentrar detalhes na wiki.
5. Separar estado atual de arquitetura futura.
6. Registrar erros e resultados negativos no diário.
7. Automatizar inventários repetitivos para reduzir documentação manual.

## Próximo marco

Fechar a 0.2.0 com inventário exportado e LAB-0001; depois avançar a 0.3.0 validando Process Create no Sysmon e no Wazuh.
