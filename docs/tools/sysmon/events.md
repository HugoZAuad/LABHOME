# Catálogo de eventos do Sysmon

Esta tabela é um mapa de estudo, não uma recomendação para habilitar tudo. Confirme IDs e campos no schema da versão instalada.

| ID | Tipo | Utilidade principal | Cuidado inicial |
| --- | --- | --- | --- |
| 1 | ProcessCreate | Linha de comando, pai, hashes e identidade | Alto valor; volume relevante |
| 2 | FileCreateTime | Mudança de timestamp de criação | Atividade legítima também altera timestamps |
| 3 | NetworkConnect | Conexões de rede por processo | Pode gerar grande volume |
| 4 | Sysmon service state | Estado do serviço | Evento operacional |
| 5 | ProcessTerminate | Encerramento de processo | Volume e valor dependem do caso |
| 6 | DriverLoad | Carregamento de drivers | Assinatura não equivale a confiança absoluta |
| 7 | ImageLoad | DLL e módulos carregados | Potencialmente muito volumoso |
| 8 | CreateRemoteThread | Thread criada em outro processo | Necessita contexto para reduzir falsos positivos |
| 9 | RawAccessRead | Acesso bruto a dispositivo | Uso administrativo pode ser legítimo |
| 10 | ProcessAccess | Acesso entre processos | Alto volume em configuração ampla |
| 11 | FileCreate | Criação/sobrescrita de arquivo | Requer escopo de caminhos e extensões |
| 12–14 | RegistryEvent | Criação, alteração e renomeação no Registro | Definir áreas relevantes |
| 15 | FileCreateStreamHash | Alternate Data Stream | Validar suporte e impacto de hash |
| 16 | Config change | Mudança de configuração do Sysmon | Não filtrável; importante para auditoria |
| 17–18 | PipeEvent | Criação e conexão de named pipe | Correlacionar processos e nomes |
| 19–21 | WmiEvent | Filtros, consumidores e bindings WMI | Útil para persistência e administração |
| 22 | DnsQuery | Consultas DNS por processo | Pode ser volumoso; preservar contexto |
| 23 | FileDelete | Exclusão com arquivo arquivado | Impacta disco e proteção dos arquivos |
| 24 | ClipboardChange | Mudança no clipboard | Avaliar privacidade antes de habilitar |
| 25 | ProcessTampering | Alteração de imagem de processo | Investigar em conjunto com processo e memória |
| 26 | FileDeleteDetected | Exclusão registrada sem arquivamento | Definir caminhos e extensões relevantes |
| 27–29 | FileBlock/FileExecutable | Eventos de bloqueio e executáveis | Dependem da versão e configuração suportada |

## Prioridade inicial sugerida

Para aprender o pipeline, comece avaliando IDs 1, 3, 11, 12–14 e 22. A habilitação real depende de baseline e capacidade; eventos 7 e 10 merecem testes isolados de volume antes de expansão.
