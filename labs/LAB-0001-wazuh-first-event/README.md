# LAB-0001: Primeiro evento ponta a ponta no Wazuh

- **Estado:** Bloqueado por infraestrutura
- **Responsável:** PENDENTE
- **Data de planejamento:** 2026-11-17
- **Ambiente/versões:** PENDENTE

## Hipótese

Um evento benigno, gerado intencionalmente no primeiro endpoint, será coletado pelo agente, analisado pelo server, indexado e recuperável no dashboard com origem e horário corretos.

## Escopo e segurança

Somente o host Wazuh e o endpoint registrados no inventário. O teste não utiliza malware, persistência nem tráfego externo malicioso.

## Pré-condições

- Inventário completo e snapshot disponível.
- Núcleo Wazuh validado.
- Primeiro agente com estado `Active`.
- Horários sincronizados.

## Procedimento

1. Registre o horário UTC e o estado do agente.
2. Gere uma autenticação local malsucedida em uma conta exclusiva do laboratório, sem bloquear contas administrativas.
3. Registre o horário UTC imediatamente após o evento.
4. Pesquise a janela de tempo no dashboard por agente e categoria de autenticação.
5. Recupere o evento original e anote campos relevantes.
6. Meça o intervalo entre geração e disponibilidade.

## Evidências esperadas

Identidade do agente, timestamp, origem do log, resultado da autenticação e consulta usada. Sanitizar usuário, IP e capturas antes de publicar.

## Resultado

PENDENTE — o laboratório ainda não foi executado.

## Critério de conclusão

Evento localizado e explicado, com latência registrada e sem lacuna não investigada.
