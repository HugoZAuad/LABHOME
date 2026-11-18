# Anatomia do `sysmonconfig.xml`

## Estrutura

```xml
<Sysmon schemaversion="VERSAO_COMPATIVEL">
  <HashAlgorithms>SHA256</HashAlgorithms>
  <EventFiltering>
    <!-- Filtros de eventos entram aqui. -->
  </EventFiltering>
</Sysmon>
```

O valor de `schemaversion` não é a versão do executável. O schema suportado deve ser consultado no próprio Sysmon com `sysmon -? config` ou `sysmon -s` antes de aplicar o XML.

## Configuração global

Elementos diretamente abaixo de `<Sysmon>` controlam capacidades como algoritmos de hash, resolução DNS e arquivamento de arquivos excluídos. Eles não substituem a seleção dos eventos dentro de `<EventFiltering>`.

## `include` e `exclude`

- `onmatch="include"`: somente eventos correspondentes são registrados.
- `onmatch="exclude"`: eventos são registrados, exceto quando correspondem ao filtro.
- Uma exclusão correspondente prevalece sobre uma inclusão.
- Um filtro vazio também possui semântica; não deve ser interpretado como “não configurado”.

## Condições e lógica

Filtros com o mesmo campo normalmente se combinam como **OR**; campos diferentes, como **AND**. `RuleGroup` permite declarar `groupRelation="and"` ou `groupRelation="or"` explicitamente.

Condições incluem correspondência exata, prefixo, sufixo, substring e conjuntos de valores. Antes de confiar numa condição, confirme se o campo existe no schema do evento e teste casos positivos e negativos.

## Nomes de regras

Regras nomeadas facilitam explicar por que um evento foi coletado e preservam contexto no pipeline. Use nomes estáveis, descritivos e sem referência temporária a uma pessoa ou máquina.

## Checklist de leitura

- Qual schema está declarado e qual o Sysmon instalado?
- Quais hashes são calculados e qual o custo esperado?
- Quais eventos estão habilitados?
- A estratégia de cada evento começa ampla ou restrita?
- Quais exclusões descartam telemetria?
- Existem regras redundantes ou impossíveis?
- A precedência de exclusões foi considerada?
- Cada regra possui justificativa e teste?
