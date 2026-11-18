# Topologia atual

## Visão lógica

```mermaid
flowchart TB
  Internet((Internet)) --> Host[Host Windows 11]
  Host --> VBox[Oracle VirtualBox]
  VBox --> NAT[SOC-LAB-NAT<br/>10.10.10.0/24 informado]
  NAT --> WS[Wazuh VM<br/>10.10.10.4 informado<br/>Ubuntu 24.04.5<br/>Wazuh 4.14.8]
  NAT --> WE[WIN-ENDPOINT-01<br/>Windows 11 Enterprise<br/>Wazuh agent]
  WE -->|1514/TCP eventos| WS
  WE -->|1515/TCP enrollment| WS
  Host -->|443/TCP dashboard| WS
```

## Limites de confiança

- Nomes, recursos e tipo de rede foram observados nas capturas.
- Versões, IPs e estado do agente vêm do histórico compartilhado.
- Conectividade atual não foi retestada nesta sessão.
- A arquitetura futura com Linux endpoint, Zeek, Suricata, MISP e Velociraptor não faz parte desta topologia atual.

## Riscos conhecidos

- As duas VMs competem por recursos com o host de aproximadamente 16 GiB de RAM.
- O núcleo Wazuh possui 4 GiB, abaixo da referência inicial usada no planejamento.
- O disco Wazuh já ocupava 36,65 GB físicos no momento da captura.
- A ISO do Windows permanecia montada no endpoint.
- Ambos os discos virtuais estavam sem criptografia no VirtualBox.

Esses itens devem ser avaliados, não corrigidos automaticamente: laboratório, desempenho, recuperação e exposição pública têm requisitos diferentes.
