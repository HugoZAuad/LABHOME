---
hide:
  - toc
---

# Relatório de evolução

<p class="report-lead">Uma visão executiva e verificável do OpenSOC Lab: o que existe, quanto avançou e qual é o próximo experimento.</p>

<div class="report-meta" aria-label="Metadados do relatório">
  <span>Atualizado em <strong>17 nov. 2026</strong></span>
  <span>Release ativa <strong>0.3.0</strong></span>
  <span>Ambiente <strong>Home Lab</strong></span>
</div>

## Visão geral

<div class="metric-grid">
  <article class="metric-card">
    <span class="metric-label">Arquivos do projeto</span>
    <strong class="metric-value">76</strong>
    <span class="metric-detail">estrutura, documentação e automação</span>
  </article>
  <article class="metric-card">
    <span class="metric-label">Documentos Markdown</span>
    <strong class="metric-value">66</strong>
    <span class="metric-detail">wiki, laboratórios e governança</span>
  </article>
  <article class="metric-card">
    <span class="metric-label">Máquinas virtuais</span>
    <strong class="metric-value">2</strong>
    <span class="metric-detail">núcleo Wazuh + endpoint Windows</span>
  </article>
  <article class="metric-card">
    <span class="metric-label">ADRs</span>
    <strong class="metric-value">4</strong>
    <span class="metric-detail">decisões arquiteturais registradas</span>
  </article>
</div>

## Evolução do repositório

<div class="chart-panel">
  <div class="chart-heading">
    <div>
      <h3>Arquivos por marco</h3>
      <p>Crescimento acumulado registrado durante a construção.</p>
    </div>
    <span class="chart-badge">+77%</span>
  </div>
  <div class="chart-scroll" tabindex="0" aria-label="Gráfico de linha: arquivos do projeto cresceram de 43 para 76">
    <svg class="line-chart" viewBox="0 0 760 280" role="img" aria-labelledby="files-chart-title files-chart-desc">
      <title id="files-chart-title">Evolução dos arquivos do projeto</title>
      <desc id="files-chart-desc">43 arquivos na fundação, 55 no planejamento Wazuh, 57 após avaliação do host, 69 no início do Sysmon, 72 após a criação da wiki e 76 no relatório web.</desc>
      <g class="chart-grid">
        <line x1="70" y1="40" x2="720" y2="40" />
        <line x1="70" y1="95" x2="720" y2="95" />
        <line x1="70" y1="150" x2="720" y2="150" />
        <line x1="70" y1="205" x2="720" y2="205" />
      </g>
      <g class="chart-axis-labels">
        <text x="30" y="45">80</text><text x="30" y="100">65</text>
        <text x="30" y="155">50</text><text x="30" y="210">35</text>
      </g>
      <path class="chart-area" d="M90 176 L214 132 L338 125 L462 81 L586 70 L710 55 L710 225 L90 225 Z" />
      <polyline class="chart-line" points="90,176 214,132 338,125 462,81 586,70 710,55" />
      <g class="chart-points">
        <circle cx="90" cy="176" r="6" /><circle cx="214" cy="132" r="6" />
        <circle cx="338" cy="125" r="6" /><circle cx="462" cy="81" r="6" />
        <circle cx="586" cy="70" r="6" /><circle cx="710" cy="55" r="6" />
      </g>
      <g class="chart-values">
        <text x="90" y="158">43</text><text x="214" y="114">55</text>
        <text x="338" y="107">57</text><text x="462" y="63">69</text>
        <text x="586" y="52">72</text><text x="710" y="37">76</text>
      </g>
      <g class="chart-x-labels">
        <text x="90" y="252">Fundação</text><text x="214" y="252">Wazuh</text>
        <text x="338" y="252">Host</text><text x="462" y="252">Sysmon</text>
        <text x="586" y="252">Wiki</text><text x="710" y="252">Site</text>
      </g>
    </svg>
  </div>
</div>

## Progresso por release

<p class="report-note">Percentuais editoriais baseados nos critérios documentados; não são métricas automáticas do ambiente.</p>

<div class="release-grid">
  <article class="release-card">
    <div class="release-title"><strong>0.1.0 · Fundação</strong><span>100%</span></div>
    <div class="progress-track" role="progressbar" aria-label="Release 0.1.0" aria-valuemin="0" aria-valuemax="100" aria-valuenow="100"><span style="width:100%"></span></div>
    <p>Governança, arquitetura, MkDocs, ADRs e templates.</p>
  </article>
  <article class="release-card">
    <div class="release-title"><strong>0.2.0 · Wazuh</strong><span>80%</span></div>
    <div class="progress-track" role="progressbar" aria-label="Release 0.2.0" aria-valuemin="0" aria-valuemax="100" aria-valuenow="80"><span style="width:80%"></span></div>
    <p>Instalação e agente ativos; faltam inventário exportado e LAB-0001.</p>
  </article>
  <article class="release-card">
    <div class="release-title"><strong>0.3.0 · Sysmon</strong><span>35%</span></div>
    <div class="progress-track" role="progressbar" aria-label="Release 0.3.0" aria-valuemin="0" aria-valuemax="100" aria-valuenow="35"><span style="width:35%"></span></div>
    <p>Base teórica pronta; XML real, baseline e LAB-0002 pendentes.</p>
  </article>
</div>

## Estado dos componentes

<div class="status-board" role="list" aria-label="Estado atual dos componentes">
  <div class="status-row" role="listitem"><span class="status-dot status-ok"></span><strong>VirtualBox</strong><span>Operacional</span></div>
  <div class="status-row" role="listitem"><span class="status-dot status-ok"></span><strong>Wazuh 4.14.8</strong><span>Instalado</span></div>
  <div class="status-row" role="listitem"><span class="status-dot status-ok"></span><strong>Wazuh agent</strong><span>Ativo conforme histórico</span></div>
  <div class="status-row" role="listitem"><span class="status-dot status-work"></span><strong>Sysmon</strong><span>Em estudo</span></div>
  <div class="status-row" role="listitem"><span class="status-dot status-wait"></span><strong>Detecções Sigma</strong><span>Aguardando telemetria validada</span></div>
</div>

## Arquitetura em operação

```mermaid
flowchart LR
  H[Host Windows 11] --> V[Oracle VirtualBox]
  V --> N[SOC-LAB-NAT]
  N --> W[Ubuntu 24.04.5<br/>Wazuh 4.14.8]
  N --> E[WIN-ENDPOINT-01<br/>Windows 11 Enterprise]
  E -->|Wazuh agent| W
  E -. próximo: Sysmon .-> W
```

## Próximo marco

<div class="next-step">
  <span class="next-step-kicker">Próxima aula</span>
  <h3>Sysmon 01 · Schema, filtros e Process Create</h3>
  <p>Confirmar a versão instalada, consultar o schema, corrigir a semântica de <code>include</code>/<code>exclude</code> e validar o Event ID 1 localmente e no Wazuh.</p>
  <a class="report-button" href="tools/sysmon/study-workflow/">Abrir trilha do Sysmon</a>
</div>

## Transparência

- Dados “observados” vieram de capturas ou comandos.
- Dados “informados” vieram do histórico compartilhado e aguardam reconfirmação.
- Percentuais representam avanço documental contra critérios definidos.
- Nenhum gráfico representa telemetria de produção ou monitoramento em tempo real.
