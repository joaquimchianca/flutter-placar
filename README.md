# placar

Um app de placar, com dois contadores e um temporizador setado em 300 segundos.

## Descrição

A partir do momento em que o temporizador começar, você pode adicionar pontos para cada time.
Quando o temporizador para, não é possível mais adicionar pontos aos times.

Foram criados dois widgets: um com o temporizador, outro com o placar. A comunicação ocorre de maneira
que não é possível adicionar aos contadores caso o temporizador esteja parado. É feito por meio de uma função callback,
definida como uma propriedade do temporizador.
