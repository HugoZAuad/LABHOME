# Inventário do VirtualBox

Inventário consolidado em 17 de novembro de 2026 a partir das capturas fornecidas e do histórico compartilhado. Endereços MAC e caminhos pessoais foram omitidos porque não são necessários para compreender a arquitetura pública.

## Visão geral

| VM | Papel | Estado observado nas capturas |
| --- | --- | --- |
| `Wazuh` | Núcleo Wazuh all-in-one | Desligada no momento da captura |
| `WIN-ENDPOINT-01` | Endpoint Windows monitorado | Desligada no momento da captura |

O histórico informa uma rede `SOC-LAB-NAT` no segmento `10.10.10.0/24`, Wazuh em `10.10.10.4` e comunicação previamente validada. Esses endereços ainda devem ser confirmados por exportação ou comando atual.

## VM Wazuh

| Categoria | Configuração observada |
| --- | --- |
| Memória | 4096 MB |
| Processadores | 2 vCPU; limite de execução 100% |
| Chipset | PIIX3 |
| TPM | Nenhum |
| Dispositivo apontador | USB Tablet |
| I/O APIC | Habilitado |
| Relógio de hardware em UTC | Habilitado |
| PAE/NX | Não habilitado na captura |
| Nested VT-x/AMD-V | Não habilitado na captura |
| Controlador gráfico | VMSVGA |
| Memória de vídeo | 16 MB |
| Monitores | 1 |
| Aceleração 3D | Não habilitada |
| Disco | `Wazuh.vdi`, VDI normal, 60 GB virtuais |
| Uso físico observado | 36,65 GB |
| Alocação | Dinâmica |
| Controladora | SATA, porta 0 |
| Criptografia do disco | Não configurada |
| Rede | Rede NAT `SOC-LAB-NAT` |
| Adaptador | Intel PRO/1000 MT Desktop (82540EM) |
| Modo promíscuo | Recusar |
| Cabo virtual | Conectado |

### Software informado

- Ubuntu Server 24.04.5 LTS.
- Wazuh 4.14.8.
- Wazuh Manager, Indexer, Dashboard e Filebeat.
- Snapshot/base de recuperação chamado `WAZUH-BASELINE` informado no histórico.

### Observação sobre capacidade

A VM utiliza menos recursos que a recomendação inicial documentada para o Quickstart. Isso não prova inadequação, mas torna obrigatórias as medições de memória, heap, disco, latência e crescimento do índice antes de ampliar agentes ou habilitar telemetria volumosa.

## VM `WIN-ENDPOINT-01`

| Categoria | Configuração observada |
| --- | --- |
| Tipo de sistema | Microsoft Windows |
| Versão configurada | Windows 11 64-bit |
| Memória | 4096 MB |
| Processadores | 2 vCPU; limite de execução 100% |
| PAE/NX | Não habilitado na captura |
| Nested VT-x/AMD-V | Não habilitado na captura |
| Disco | `WIN-ENDPOINT-01.vdi`, VDI normal, 64 GB virtuais |
| Uso físico observado | 40,98 GB |
| Alocação | Dinâmica |
| Controladora | SATA, porta 0 |
| Mídia óptica | ISO do Windows ainda montada na captura |
| Rede | Rede NAT `SOC-LAB-NAT` |
| Adaptador | Intel PRO/1000 MT Desktop (82540EM) |
| Modo promíscuo | Recusar |
| Cabo virtual | Conectado |

### Software informado

- Windows 11 Enterprise Evaluation.
- Wazuh agent instalado e estado `Active` previamente observado.
- Sysmon do Sysinternals em fase de estudo/configuração.

## Lacunas do inventário

- Versão do Oracle VirtualBox e Extension Pack.
- UUIDs, diretórios de snapshots e tamanho total de snapshots.
- Configuração completa de firmware/UEFI e Secure Boot.
- Endereços IP, gateway, DNS e DHCP atuais exportados.
- Demais adaptadores e portas encaminhadas, se existirem.
- Estado atual dos serviços e versões obtidas por comando.
- Versão e schema do Sysmon.

## Próxima coleta recomendada

Quando o `VBoxManage` estiver disponível no PATH, exportar informações somente leitura:

```powershell
VBoxManage list vms
VBoxManage showvminfo "Wazuh" --machinereadable
VBoxManage showvminfo "WIN-ENDPOINT-01" --machinereadable
VBoxManage list natnetworks
VBoxManage snapshot "Wazuh" list --details
VBoxManage snapshot "WIN-ENDPOINT-01" list --details
```

Antes de publicar a saída, remova UUIDs, MACs, caminhos pessoais e qualquer dado que não contribua para a reprodução.
