# ADR-0003: MkDocs Material para documentação

- **Estado:** Aceito
- **Data:** 2026-11-17

## Contexto

A documentação precisa ser pesquisável, navegável, versionada junto ao projeto e publicável sem infraestrutura própria.

## Decisão

Usar MkDocs com o tema Material, Markdown e diagramas Mermaid. GitHub Actions validará e publicará o site.

## Consequências

A navegação deve ser mantida no `mkdocs.yml`, e toda mudança precisa passar por compilação estrita. Plugins ficam fixados em `requirements-docs.txt` para reduzir variações.
