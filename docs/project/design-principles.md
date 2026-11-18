# Princípios de design

- **Open source por padrão:** alternativas proprietárias podem ser comparadas, mas não devem ser necessárias para reproduzir o núcleo.
- **Separação de responsabilidades:** coleta, transporte, armazenamento, análise e resposta devem ser identificáveis.
- **Menor privilégio:** contas e integrações recebem apenas permissões necessárias.
- **Segredos fora do Git:** tokens, senhas, chaves e certificados privados nunca entram no repositório.
- **Configuração como código:** configurações relevantes são versionadas e revisáveis.
- **Detecções testáveis:** cada regra declara fonte, comportamento, falso positivo e teste.
- **Observabilidade do próprio laboratório:** capacidade, atraso, falhas e perda de eventos devem ser mensuráveis.
- **Reprodutibilidade:** versões, recursos, rede e dependências são explícitos.
