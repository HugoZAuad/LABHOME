# Guia de instalação

Esta release configura somente a documentação e a governança. A implantação dos componentes do SOC começa na 0.2.0.

## Documentação local

Requisitos: Git, Python 3.11+ e ambiente virtual.

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements-docs.txt
mkdocs serve
```

Acesse `http://127.0.0.1:8000`. Para validar uma compilação estrita:

```powershell
mkdocs build --strict
```

## Antes da infraestrutura

Defina capacidade disponível, hipervisor, endereçamento, DNS, NTP, política de snapshots e isolamento. Registre versões exatas e nunca reutilize credenciais de ambientes reais.
