# Diário de aprendizado

Este diário registra o trabalho por data, incluindo decisões, validações, erros, correções e pendências. Ele distingue planejamento de execução: um item só é marcado como concluído quando existe evidência verificável.

## 2026-11-17 — Release 0.1.0: fundação

### Contexto inicial

- O diretório `LABHOME` estava vazio e não era um repositório Git.
- A proposta anterior previa muitos arquivos e um ZIP, mas nenhum artefato havia sido produzido.
- Decidimos trabalhar diretamente no repositório e priorizar conteúdo útil em vez de criar arquivos apenas para atingir uma quantidade.

### Trabalho realizado

- Definidos nome, propósito, público, escopo e filosofia do OpenSOC Lab.
- Criados roadmap, arquitetura lógica, princípios de design, stack tecnológico, estrutura, glossário, referências, segurança e contribuição.
- Criados templates de laboratório, detecção, playbook, pesquisa e ADR.
- Registrados os ADRs iniciais: Wazuh como núcleo, Sysmon para Windows e MkDocs Material para publicação.
- Configurados MkDocs, tema Material, Mermaid, GitHub Actions, EditorConfig, Git attributes e regras de Markdown.
- Criada estrutura para documentação, laboratórios, playbooks, detecções, configurações, scripts, diagramas, pesquisas e assets.
- Inicializado Git na branch `main`; nenhum commit foi criado porque autoria e repositório remoto ainda não foram definidos.

### Erros, bugs e correções

1. **Links de navegação fora de `docs/`:** a primeira configuração tentou incluir arquivos da raiz usando `../`. Isso não é válido na navegação normal do MkDocs. A seção foi removida e a documentação publicável permaneceu dentro de `docs/`.
2. **Instalação de dependências demorou além do primeiro retorno:** o `pip` ainda estava trabalhando. O processo não havia falhado e foi acompanhado até terminar.
3. **Markdownlint encontrou 34 ocorrências:** uma regra exigia outro estilo de separadores de tabelas (`MD060`); também havia um espaço residual e um subtítulo em ênfase. Os dois últimos foram corrigidos e `MD060` foi desabilitada para manter o padrão de tabelas escolhido.
4. **Texto anexado com caracteres corrompidos:** o histórico fornecido continha mojibake, inclusive palavras portuguesas com acentos ilegíveis. Os arquivos foram escritos em UTF-8 e a varredura não encontrou esses padrões no repositório. Parte da saída do terminal mostrou o caminho acentuado de forma incorreta, sem corromper os arquivos.
5. **URL de publicação desconhecida:** `site_url` permanece como exemplo porque o endereço do GitHub ainda não foi informado.
6. **Dependências no Python corrente:** a primeira validação instalou os pacotes no Python disponível, embora o guia recomende `.venv`. Criar o ambiente virtual permanece recomendado.

### Validações

- `mkdocs build --strict`: aprovado.
- Markdownlint: 41 arquivos analisados, zero problemas após correções.
- Varredura de padrões comuns de codificação quebrada: aprovada.
- Fundação entregue com 43 arquivos de projeto, sendo 40 Markdown naquele momento.

### Pendências

- Definir autoria Git e URL do repositório remoto.
- Atualizar `site_url` e `repo_name`.
- Criar o primeiro commit quando a autoria estiver definida.

## 2026-11-17 — Release 0.2.0: infraestrutura e Wazuh

### Decisão de execução

- A etapa exige infraestrutura real, mas não havia registro de CPU, RAM, hipervisor, sistema operacional, IPs, DNS, NTP ou host-alvo.
- Para não declarar uma implantação inexistente, a release foi marcada como **em andamento**.
- Foi proposta uma topologia all-in-one para laboratório pequeno, sujeita à confirmação após o inventário.
- A documentação oficial atual do Wazuh foi consultada para arquitetura, capacidade, portas e enrollment.

### Trabalho realizado

- Criado inventário de infraestrutura com bloqueios explícitos.
- Documentado plano de rede e fluxos entre agente, server, indexer e dashboard.
- Criados capítulos de instalação, primeiro agente, validação e troubleshooting.
- Criado exemplo YAML de inventário, sem credenciais.
- Criado `Test-LabReadiness.ps1`, que coleta dados locais e testa portas TCP sem alterar o sistema.
- Planejado o LAB-0001 para validar um evento benigno ponta a ponta.
- Atualizados MkDocs, roadmap, changelog e referências.

### Problemas e riscos atuais

1. **Infraestrutura indefinida:** impede instalar e medir o Wazuh com segurança.
2. **Credenciais e certificados:** deverão permanecer fora do Git; artefatos do instalador exigem armazenamento protegido.
3. **Capacidade ainda teórica:** CPU, RAM e disco documentados são referências oficiais, não medições do laboratório.
4. **Retenção não definida:** só poderá ser ajustada depois de observar volume e espaço reais.
5. **LAB-0001 bloqueado:** depende do núcleo instalado e de um agente `Active`.

### Próximos passos verificáveis

1. Preencher `docs/getting-started/inventory.md`.
2. Escolher o host Linux e confirmar snapshot, DNS, NTP e segmentação.
3. Executar o preflight contra o endereço definido.
4. Instalar o núcleo pela documentação oficial vigente e registrar versões.
5. Incorporar o primeiro agente e executar o LAB-0001.

### Avaliação adicional do host local

- A estação foi inspecionada de forma somente leitura para reduzir as pendências do inventário.
- Identificados Windows 11 Pro 64 bits, AMD Ryzen 5 3500X, seis núcleos lógicos e 15,9 GiB de RAM.
- Identificados 423,5 GiB livres em `D:` e 121,6 GiB livres em `C:`.
- A virtualização está habilitada no firmware; extensões de monitor de VM e SLAT estão disponíveis.
- O executável do Docker Desktop existe, mas o engine Linux não está ativo.
- O executável `wsl.exe` existe, mas o recurso WSL não está instalado.
- Vagrant, VirtualBox, Multipass e `virsh` não foram encontrados no PATH.
- O estado dos recursos opcionais Hyper-V, Virtual Machine Platform e WSL exige elevação e, portanto, não foi obtido.
- Criada uma avaliação formal do host e proposto o ADR-0004 para usar uma VM Ubuntu 24.04 LTS all-in-one.

### Erros encontrados durante o inventário

1. **Pipeline inválido no primeiro comando:** um bloco `foreach` foi ligado diretamente a `Format-Table`, causando `EmptyPipeElement`. O comando falhou antes de coletar dados e foi reescrito usando uma coleção intermediária.
2. **Consulta incorreta de recursos opcionais:** uma lista foi passada a `Get-WindowsOptionalFeature -FeatureName`, que aceita apenas uma string por chamada. A consulta foi corrigida para iterar recurso por recurso.
3. **Elevação necessária:** mesmo após corrigida, a consulta dos recursos opcionais foi recusada por falta de privilégios administrativos. Nenhuma tentativa de elevar permissões ou modificar o Windows foi realizada.
4. **Saída WSL em UTF-16 no terminal:** a mensagem de ausência do WSL apareceu com bytes nulos e caracteres ilegíveis na captura do PowerShell. Isso afetou somente a apresentação da saída, não os arquivos do projeto.

### Decisão provisória de capacidade

- A máquina pode executar uma VM Wazuh pequena, porém 8 GiB para a VM consumiriam aproximadamente metade da memória física.
- A proposta inicial é 4 vCPU, 8 GiB de RAM e 80 GiB de disco expansível em `D:`, começando com um agente.
- A instalação continua pendente da escolha do hipervisor e de autorização específica para habilitar recursos ou instalar software.

### Atualização fornecida pelo mantenedor

- O mantenedor informou que o Wazuh já está instalado.
- A documentação foi corrigida para não continuar afirmando que a instalação estava pendente.
- Como versão, host, topologia, método e evidências não foram fornecidos, o estado foi alterado para **instalação informada; validação pendente**.
- O LAB-0001 continua pendente até existir evidência do primeiro evento ponta a ponta.

## 2026-11-17 — Release 0.3.0: Windows e Sysmon

### Contexto

- O mantenedor informou que começou a estudar o `sysmonconfig.xml`.
- Nenhum arquivo XML relacionado ao Sysmon foi encontrado no repositório.
- A documentação oficial atual foi consultada porque, em 2026, há Sysmon do Sysinternals e Sysmon integrado como recurso opcional do Windows 11.

### Trabalho realizado

- Criado capítulo introdutório distinguindo as duas variantes.
- Documentada a anatomia do XML, incluindo schema, configuração global, `include`, `exclude`, condições, grupos e precedência.
- Criado catálogo inicial dos Event IDs 1–29 com finalidade e cuidados.
- Documentado ciclo de tuning, antipadrões e métricas mínimas.
- Documentado o fluxo Sysmon → Event Log → Wazuh agent → server → indexer → dashboard.
- Criado workflow para incorporar e estudar o XML com origem, versão e licença.
- Criado `Analyze-SysmonConfig.ps1`, que lê o XML e produz inventário JSON sem aplicar ou alterar a configuração.
- Planejado o LAB-0002 para validar Process Create (Event ID 1) do endpoint ao Wazuh.

### Limitações e pendências

1. A variante e a versão do Sysmon ainda não foram informadas.
2. O schema ativo ainda não foi registrado.
3. O `sysmonconfig.xml` estudado ainda não está disponível para análise.
4. Origem e licença da configuração precisam ser preservadas antes de versioná-la.
5. Nenhum evento ou integração foi marcado como validado sem evidência.

### Análise do histórico compartilhado e correção do XML

- A conversa pública compartilhada foi recuperada e analisada.
- O ambiente foi identificado como VirtualBox, rede `SOC-LAB-NAT`, Ubuntu Server 24.04.5 LTS, Wazuh 4.14.8 e endpoint Windows 11 Enterprise Evaluation.
- O histórico informa Wazuh agent ativo, snapshot `WAZUH-BASELINE` e endereço `10.10.10.4` para o núcleo.
- O XML didático encontrado usava filtros vazios com `onmatch="include"` e os descrevia incorretamente como coleta de todos os eventos.
- A documentação oficial mostra que um `include` vazio não seleciona eventos; para coletar tudo de um tipo, usa-se normalmente `onmatch="exclude"` sem regras filhas.
- Também foi registrado que `RegistryEvent` cobre a família de eventos 12–14 e que schema e versão do executável são conceitos diferentes.
- O XML não foi incorporado como configuração operacional porque precisa ser corrigido, ter versão/schema confirmados e ser testado em etapas.

### Reorganização documental e inventário visual

- O mantenedor informou que o projeto cresceu além da proporção inicialmente esperada e solicitou uma estrutura mais fácil de compreender.
- A raiz foi reduzida para arquivos de entrada, licença, changelog, governança e configuração.
- Arquitetura, princípios, glossário, instalação, filosofia, diário, estrutura, referências, roadmap e stack foram movidos para domínios dentro de `docs/`.
- O README foi reescrito como porta de entrada curta e a wiki MkDocs passou a ser a fonte central de conhecimento.
- Foi criado um guia do projeto que diferencia estados planejado, informado, observado, validado e bloqueado.
- As capturas do VirtualBox foram transcritas para um inventário sanitizado; MACs e caminhos pessoais não foram publicados.
- A VM Wazuh foi registrada com 2 vCPU, 4096 MB, VDI dinâmico de 60 GB, uso físico observado de 36,65 GB e rede `SOC-LAB-NAT`.
- `WIN-ENDPOINT-01` foi registrada com 2 vCPU, 4096 MB, VDI dinâmico de 64 GB, uso físico observado de 40,98 GB e a mesma rede NAT.
- O ADR-0004 foi atualizado de proposto para aceito e implementado com VirtualBox.

### Riscos e inconsistências preservados

1. A coleta inicial não encontrou `VBoxManage` no PATH, mas as capturas confirmam que o VirtualBox está instalado; a documentação foi corrigida para distinguir CLI indisponível de aplicativo ausente.
2. O núcleo Wazuh possui 4 GB de RAM, abaixo do planejamento inicial de 8 GB; desempenho precisa ser medido antes de ampliar telemetria.
3. A ISO do Windows ainda aparecia montada e os discos virtuais estavam sem criptografia nas capturas.
4. IPs, versões e estados oriundos do histórico continuam classificados como informados até confirmação por comando atual.
5. As imagens recebidas não foram copiadas para o repositório; somente informações necessárias e sanitizadas foram transcritas.

### Evolução para relatório web

- O mantenedor solicitou tema escuro, gráficos de evolução e acesso pela web.
- O MkDocs Material foi configurado com tema `slate`, alto contraste e identidade visual inspirada em operações de SOC.
- Criada a página `report.md` com indicadores, evolução do número de arquivos, progresso editorial por release, estado dos componentes e próximo marco.
- Os gráficos usam HTML, CSS e SVG locais, sem dependência externa de biblioteca de visualização.
- Os percentuais de release foram rotulados como estimativas editoriais, não telemetria operacional.
- Foram adicionados rótulos acessíveis, `progressbar`, descrições no SVG, foco visível, layout responsivo e respeito a `prefers-reduced-motion`.
- A saída estática do MkDocs foi alterada para `dist/` e o upload do GitHub Actions foi atualizado.
- Um Site privado chamado `OpenSOC Lab Report` foi criado para hospedar a versão web.

### Erro durante a validação web

- O primeiro teste HTTP tentou armazenar a resposta da página inicial em `$home`.
- PowerShell trata nomes de variáveis sem diferenciar maiúsculas e minúsculas, portanto `$home` colidiu com a variável protegida `$HOME` e gerou `VariableNotWritable`.
- O relatório e o CSS responderam HTTP 200 mesmo nessa execução; nenhum arquivo ou estado do sistema foi alterado.
- A variável do teste foi renomeada para `$siteHomeResponse` antes da repetição.
