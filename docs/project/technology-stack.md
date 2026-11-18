# Stack tecnológico

| Ferramenta | Categoria | Papel planejado | Alternativas consideradas |
|---|---|---|---|
| Wazuh | SIEM/XDR | Coleta, correlação e monitoramento | Elastic Security, Security Onion |
| Sysmon | Telemetria Windows | Eventos detalhados de processos, rede e arquivos | ETW e logs nativos |
| auditd | Telemetria Linux | Auditoria de ações relevantes no kernel | eBPF, journald |
| Zeek | NSM | Metadados e protocolos de rede | Arkime |
| Suricata | IDS/IPS | Detecção por assinaturas e protocolo | Snort |
| Velociraptor | DFIR | Coleta e investigação remotas | GRR |
| MISP | Threat Intelligence | Gestão e compartilhamento de indicadores | OpenCTI |
| Sigma | Detecção | Regras portáveis baseadas em logs | Regras nativas |
| YARA | Detecção de artefatos | Classificação de arquivos e memória | Regras específicas de produto |
| MkDocs Material | Documentação | Publicação do conteúdo como site | Docusaurus, Sphinx |

As escolhas são hipóteses arquiteturais, não dogmas. Mudanças relevantes exigem ADR.
