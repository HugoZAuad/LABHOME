# Wazuh

## Papel no laboratório

O Wazuh será o núcleo inicial de coleta, análise, pesquisa e visualização. A arquitetura central possui server, indexer e dashboard; agentes enviam telemetria ao server, que analisa os eventos e encaminha alertas ao indexer.

## Estratégia da 0.2.0

Para o primeiro ciclo, propõe-se uma implantação **all-in-one** em Linux, adequada a um laboratório pequeno e mais simples de reconstruir. A decisão só será confirmada após preencher o inventário.

## Critérios de aceite

- Componentes centrais instalados com versão registrada.
- Dashboard acessível apenas pela rede de gerenciamento.
- Primeiro agente com estado `Active`.
- Evento controlado encontrado no dashboard e correlacionado ao endpoint correto.
- Horário, retenção inicial, backup e procedimento de restauração documentados.
- Credenciais iniciais trocadas e armazenadas fora do Git.

## Estado

**Instalação informada pelo mantenedor em 2026-11-17; detalhes e validação pendentes.** A release 0.2.0 só será concluída depois de registrar topologia, versões, primeiro agente e evidência do evento ponta a ponta.
