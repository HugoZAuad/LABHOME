# Workflow de estudo do `sysmonconfig.xml`

## Entrada segura

1. Copie o XML para `configs/sysmon/sysmonconfig.xml`.
2. Registre a origem, licença, commit ou versão no `configs/sysmon/README.md`.
3. Não inclua nomes internos, caminhos pessoais ou dados sensíveis.
4. Não aplique a configuração apenas porque o XML é bem-formado.

## Análise estática

Execute:

```powershell
.\scripts\Analyze-SysmonConfig.ps1 -Path .\configs\sysmon\sysmonconfig.xml
```

O script apenas lê o XML e resume schema, configurações globais, grupos e filtros. Em seguida, revise manualmente semântica, precedência, campos válidos e impacto.

## Diário de estudo por bloco

Para cada evento, registre:

- O que o evento observa.
- Campos disponíveis e úteis.
- Estratégia `include` ou `exclude`.
- Regras que mais reduzem volume.
- Visibilidade perdida.
- Teste benigno positivo e negativo.
- Como o evento aparece no Wazuh.
