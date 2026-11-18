# ADR-0004: Estratégia de implantação inicial do Wazuh

- **Estado:** Aceito e implementado
- **Data:** 2026-11-17

## Contexto

O laboratório precisava de uma implantação simples e reproduzível. A estação avaliada possui aproximadamente 16 GiB de RAM, armazenamento adequado e virtualização habilitada. Capturas e histórico posteriores confirmaram que Oracle VirtualBox já era o hipervisor utilizado.

## Direcionadores

- Isolar o núcleo Wazuh do endpoint de uso diário.
- Seguir uma rota compatível com a documentação oficial.
- Permitir snapshot, backup e restauração.
- Evitar consumo excessivo na estação Windows.

## Alternativas

1. **VM Linux all-in-one no VirtualBox:** maior isolamento e alinhamento com o Quickstart; compartilha recursos limitados com o endpoint Windows.
2. **Docker Desktop:** facilita descarte, mas o engine está parado e a topologia adiciona camadas de rede e volumes.
3. **WSL 2:** não está instalado e exigiria mudança no Windows; isolamento e operação diferem de uma VM dedicada.
4. **Host separado:** melhor isolamento e capacidade, porém nenhum equipamento foi informado.

## Decisão proposta

Usar uma VM Ubuntu Server 24.04.5 LTS all-in-one no Oracle VirtualBox. A implantação observada utiliza 2 vCPU, 4096 MB de RAM e VDI dinâmico de 60 GB na rede `SOC-LAB-NAT`.

## Consequências

Snapshots e rede ficam explícitos, mas há pressão de memória no host e o núcleo possui menos RAM que o planejamento inicial. O crescimento depende de métricas de capacidade e retenção.
