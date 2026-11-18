# Tuning do Sysmon

## Objetivo

Tuning não significa remover todo ruído. Significa equilibrar custo, privacidade e valor investigativo sem excluir evidência necessária para hipóteses conhecidas.

## Ciclo

1. Defina o caso de uso e os campos necessários.
2. Colete uma baseline com período e carga conhecidos.
3. Meça eventos por ID, host e processo.
4. Identifique produtores frequentes e compreenda sua função.
5. Proponha uma exclusão pequena e justificável.
6. Execute testes positivos e negativos.
7. Aplique em escopo piloto e compare o volume.
8. Registre perda de visibilidade e possibilidade de evasão.

## Antipadrões

- Copiar uma configuração comunitária sem registrar versão e origem.
- Excluir por nome de processo sem considerar caminhos ou assinaturas.
- Tratar eventos legítimos frequentes como inúteis automaticamente.
- Alterar várias regras antes de medir cada efeito.
- Usar `include` restritivo sem mapear o que ficará invisível.
- Habilitar eventos de alto volume em todos os hosts de uma vez.

## Métricas mínimas

- Eventos por segundo e por dia.
- Distribuição por Event ID.
- Principais imagens e regras correspondentes.
- Tamanho do log local.
- Latência até o Wazuh.
- Crescimento do índice.
- Percentual de redução e hipóteses afetadas após tuning.
