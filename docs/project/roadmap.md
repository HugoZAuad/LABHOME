# Roadmap

Cada fase termina apenas quando sua documentação, evidências e critérios de conclusão forem atendidos.

## 0.1.0 — Foundation

**Objetivo:** estabelecer governança, arquitetura inicial, documentação e templates.

**Competências:** documentação técnica, Git, ADR, modelagem de laboratório e MkDocs.

**Critério de conclusão:** site compilável, estrutura navegável, ADRs iniciais e templates versionados.

## 0.2.0 — Infraestrutura e Wazuh

**Objetivo:** implantar o núcleo do SIEM/XDR e incorporar o primeiro agente.

**Estado:** em validação; instalação informada pelo mantenedor, documentação do ambiente e evento ponta a ponta pendentes.

**Resultados:** inventário, logs básicos, dashboards, retenção documentada e teste de conectividade.

**Critério de conclusão:** evento controlado percorre endpoint, manager e dashboard sem perda observada.

## 0.3.0 — Windows e Sysmon

**Objetivo:** obter telemetria Windows de alta qualidade.

**Estado:** em andamento; estudo do `sysmonconfig.xml` iniciado e estrutura documental criada.

**Resultados:** configuração Sysmon versionada, mapeamento de Event IDs e primeiras regras Sigma.

**Critério de conclusão:** cenário benigno e cenário de teste geram eventos explicáveis e detecção validada.

## 0.4.0 — Linux

**Objetivo:** integrar auditd e logs do sistema.

**Resultados:** regras de auditoria, inventário de fontes e hunts iniciais.

## 0.5.0 — Network Security Monitoring

**Objetivo:** implantar Zeek e Suricata em ponto de observação definido.

**Resultados:** metadados de rede, alertas IDS e procedimento de tuning.

## 0.6.0 — Detection Engineering

**Objetivo:** criar ciclo de vida para detecções.

**Resultados:** regras versionadas, testes positivos/negativos, métricas e cobertura ATT&CK.

## 0.7.0 — Threat Intelligence

**Objetivo:** integrar MISP sem transformar IOC em detecção sem contexto.

## 0.8.0 — Threat Hunting e DFIR

**Objetivo:** executar hunts orientados por hipótese e coletas remotas com Velociraptor.

## 0.9.0 — Deception e Purple Team

**Objetivo:** adicionar honeypot controlado e validar a cadeia defensiva com emulação autorizada.

## 1.0.0 — Laboratório reproduzível

**Objetivo:** reconstrução completa a partir de documentação e automação versionadas.

**Critério de conclusão:** uma segunda pessoa reproduz o ambiente e os testes sem conhecimento implícito.
