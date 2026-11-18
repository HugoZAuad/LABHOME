# Inventário resumido

Este documento funciona como índice. Os detalhes observados nas capturas estão no [inventário do VirtualBox](../infrastructure/virtualbox-inventory.md).

## Ambiente confirmado

| Item | Estado |
| --- | --- |
| Hipervisor | Oracle VirtualBox |
| Rede | Rede NAT `SOC-LAB-NAT`; `10.10.10.0/24` informado |
| Núcleo | VM `Wazuh`, Ubuntu Server 24.04.5 LTS, Wazuh 4.14.8 |
| Endpoint | VM `WIN-ENDPOINT-01`, Windows 11 Enterprise Evaluation |
| Coleta | Wazuh agent informado como `Active` |
| Telemetria avançada | Sysmon em estudo |

## Recursos observados

| VM | vCPU | RAM | Disco virtual | Uso físico observado |
| --- | ---: | ---: | ---: | ---: |
| `Wazuh` | 2 | 4096 MB | 60 GB | 36,65 GB |
| `WIN-ENDPOINT-01` | 2 | 4096 MB | 64 GB | 40,98 GB |

## Dados ainda necessários

- Versão do VirtualBox.
- Saída sanitizada do `VBoxManage`.
- IP atual do endpoint, gateway, DNS e NTP.
- Versões dos componentes Wazuh obtidas diretamente dos serviços.
- Versão e schema do Sysmon.
- Baseline de CPU, memória, eventos e crescimento de disco.

## Segurança da publicação

Não versionar endereços MAC, UUIDs, caminhos do perfil do Windows, credenciais, certificados privados ou tokens. IPs privados podem ser documentados quando necessários à reprodução, mas devem ser revisados antes de qualquer publicação.
