# Changelog

O formato segue [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/) e o projeto usa versionamento semântico.

## [Não lançado]

### Adicionado

- Inventário de infraestrutura e plano de rede do Wazuh.
- Runbooks de instalação, enrollment, validação e troubleshooting.
- Script PowerShell de preflight não destrutivo.
- LAB-0001 para validar o primeiro evento ponta a ponta.
- Registro de estado da release 0.2.0.
- Avaliação de capacidade da estação local e ADR-0004 proposto.
- Coleta de CPU, memória, virtualização e discos no script de preflight.
- Capítulo do Sysmon com XML, eventos, tuning e integração com Wazuh.
- Analisador estático PowerShell para `sysmonconfig.xml`.
- LAB-0002 para validar Process Create do endpoint ao Wazuh.
- Página da release 0.3.0.
- Wiki central com guia do projeto e mapa de navegação.
- Inventário detalhado das VMs a partir das capturas do VirtualBox.
- Topologia atual com limites de confiança e riscos conhecidos.
- Relatório web com indicadores, evolução documental e progresso das releases.
- Estilos escuros responsivos e componentes visuais acessíveis.
- Manifesto de hospedagem para publicação privada com Sites.

### Alterado

- Estado do Wazuh atualizado para “instalação informada; validação pendente”.
- Release 0.3.0 marcada como em andamento.
- Documentação técnica da raiz movida para `docs/` e organizada por domínio.
- README reescrito como porta de entrada concisa.
- ADR-0004 atualizado para refletir o VirtualBox já implementado.
- Saída estática do MkDocs alterada para `dist/` para hospedagem web.

### Pendente

- Versão, topologia e método da instalação Wazuh.
- Primeiro endpoint monitorado e LAB-0001 executado ou documentado.
- Origem, licença, variante e versão do `sysmonconfig.xml` estudado.

## [0.1.0] — 2026-11-17

### Adicionado

- Fundação documental, roadmap, arquitetura e princípios.
- MkDocs Material e navegação inicial.
- ADRs para Wazuh, Sysmon e MkDocs.
- Templates de laboratório, detecção, playbook, pesquisa e ADR.
- Workflows de validação e publicação.
