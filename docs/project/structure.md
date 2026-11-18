# Estrutura do projeto

| Caminho | Responsabilidade |
|---|---|
| `docs/` | Documentação publicada pelo MkDocs |
| `docs/adr/` | Registros de decisões arquiteturais |
| `docs/project/` | Escopo, arquitetura, princípios, roadmap e estrutura |
| `docs/infrastructure/` | Inventário e topologia do ambiente real |
| `docs/tools/` | Capítulos técnicos por ferramenta |
| `docs/journal/` | Diário cronológico de decisões, erros e aprendizados |
| `docs/reference/` | Glossário e fontes de referência |
| `labs/` | Experimentos reproduzíveis e suas evidências referenciadas |
| `playbooks/` | Procedimentos de triagem e resposta |
| `detections/` | Regras Sigma, YARA e documentação associada |
| `configs/` | Configurações sanitizadas e versionáveis |
| `scripts/` | Automação segura e documentada |
| `diagrams/` | Fontes de diagramas externos ao Markdown |
| `research/` | Notas de pesquisa com hipótese e fontes |
| `assets/` | Imagens e recursos estáticos não sensíveis |
| `templates/` | Modelos oficiais do projeto |
| `tests/` | Fixtures e testes de validação; não contém configurações operacionais |
| `.github/workflows/` | Validação e publicação automatizadas |

Arquivos gerados, evidências volumosas, credenciais e dados pessoais não devem ser versionados.

## Política da raiz

A raiz permanece pequena para facilitar a leitura no GitHub. Ela contém apenas `README.md`, licença, changelog, arquivos de governança, configuração do MkDocs e dependências. Documentação técnica deve entrar na wiki sob `docs/`.
