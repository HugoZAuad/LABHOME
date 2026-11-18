# Instalação do núcleo Wazuh

## Método proposto

Use o assistente oficial all-in-one em um host Linux dedicado e suportado. Não copie comandos antigos deste repositório: abra o [Quickstart oficial](https://documentation.wazuh.com/current/quickstart.html) no momento da execução e registre a versão efetivamente instalada.

## Antes de executar

1. Complete o [inventário](../../getting-started/inventory.md).
2. Confirme que o host não contém serviços ou dados de produção.
3. Crie snapshot ou backup recuperável.
4. Valide DNS, NTP, espaço em disco e portas planejadas.
5. Registre hash/URL do instalador e versão da documentação consultada.

## Durante a instalação

- Capture logs do assistente, removendo segredos antes de publicá-los.
- Guarde `wazuh-passwords.txt` fora do repositório, com acesso restrito.
- Não desative validações TLS para “resolver” falhas sem investigar a causa.
- Registre alterações de firewall e seus responsáveis.

## Depois da instalação

1. Confirme serviços ativos e ausência de erros críticos nos logs.
2. Acesse o dashboard por HTTPS a partir da rede administrativa.
3. Troque credenciais iniciais e proteja artefatos de certificados.
4. Registre a versão de server, indexer, dashboard e agente.
5. Faça backup da configuração e teste a possibilidade de restauração.
6. Prossiga para [enrollment do primeiro agente](first-agent.md).
