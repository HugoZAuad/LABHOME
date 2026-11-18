# Avaliação do host local

Avaliação executada em 2026-11-17 para verificar se a estação atual pode hospedar o laboratório. Estes dados descrevem capacidade disponível, não autorizam instalação nem definem o host final.

## Resultado observado

| Item | Resultado |
| --- | --- |
| Sistema | Windows 11 Pro 64 bits, build 26200 |
| Processador | AMD Ryzen 5 3500X, 6 núcleos/6 processadores lógicos |
| Memória física | 15,9 GiB |
| Disco `D:` | 931,5 GiB totais; 423,5 GiB livres |
| Disco `C:` | 446,1 GiB totais; 121,6 GiB livres |
| Virtualização no firmware | Habilitada |
| SLAT e extensões de monitor | Disponíveis |
| Hipervisor ativo detectado | Não |
| WSL | Executável presente, recurso não instalado |
| Docker Desktop | Cliente 29.8.0 presente; engine Linux indisponível/parado |
| Vagrant/VirtualBox/Multipass | CLI não encontrada no PATH durante a coleta inicial |

## Análise

O host atende tecnicamente ao mínimo de CPU, memória e armazenamento do Quickstart para 1–25 agentes. Contudo, reservar 8 GiB para uma VM all-in-one deixaria aproximadamente metade da RAM para Windows, IDE e demais processos. Isso é viável para testes curtos, mas com pouca margem para picos do indexer.

Capturas posteriores confirmaram que o Oracle VirtualBox está instalado e que as VMs já existem. A ausência inicial dizia respeito somente ao comando `VBoxManage` no PATH, não à ausência do aplicativo.

O armazenamento em `D:` é suficiente para uma VM inicial, desde que snapshots e retenção sejam monitorados. A virtualização está habilitada no firmware. O estado dos recursos Hyper-V, Virtual Machine Platform e WSL não pôde ser consultado sem elevação administrativa.

## Recomendação

1. Preferir uma VM Ubuntu 24.04 LTS dedicada, inicialmente com 4 vCPU, 8 GiB de RAM e 80 GiB de disco expansível em `D:`.
2. Manter apenas um endpoint ativo durante as primeiras medições.
3. Reduzir outros workloads enquanto o indexer estiver ativo.
4. Não prometer retenção de 90 dias antes de medir alertas por segundo e crescimento do índice.
5. Usar Docker Desktop apenas após confirmar o backend Linux e comparar a rota com o suporte oficial pretendido.

## Bloqueios

- Escolha do hipervisor.
- Confirmação de que a estação será o host definitivo.
- Definição do segmento e IP da VM.
- Autorização separada para habilitar recursos do Windows ou instalar software.
