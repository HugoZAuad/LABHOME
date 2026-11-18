# MkDocs

## Desenvolvimento local

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements-docs.txt
mkdocs serve
```

## Validação

`mkdocs build --strict` transforma avisos em falhas. O mesmo comando é executado no CI.

## Publicação

O workflow `docs.yml` publica o diretório gerado no GitHub Pages quando houver push na branch `main`. No GitHub, configure **Settings → Pages → Source** como **GitHub Actions**.
