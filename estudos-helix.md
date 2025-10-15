Modes_:

- _NORMAL_: modo padrão para navegação e comandos.
- _INSERT_: modo para escrita.
- _SELECT_: modo para seleção.

_Buffers_ são representações de arquivos em memória.

## _Keymaps_

### _Normal mode_

#### _Movement_

As teclas abaixo movimentam o cursor.

`h` move para a esquerda.

`j` move para baixo. `j` se parece com uma seta apontada para baixo.

`k` move para cima.

`l` move para a direita.

`w` e `W` (_**w**ord_) move para o começo da próxima palavra.

`e` e `E` (_**e**nd__) move para o final da palavra atual.

`b` e `B` (_**b**ack_) move para início da palavra atual.

`f` (_**f**ind_) move na próxima ocorrência do caractere específicado.

`F` (_**F**ind_) move na última ocorrência do caractere específicado.

`t` (_**t**ill_) move até a próxima ocorrência do caractere específicado.

`T` (_**T**ill_) move até a última ocorrência do caractere específicado.

`Alt + .` repete a última movimentação `f`, `t`, `m`, `[`, ou `]`.

`Ctrl + d` (_**d**own_) move a página para baixo.

`Ctrl + u` (_**u**p_) move a página para cima.

#### _Changes_

`i` (_**i**nsert_) troca para o modo _INSERT_ com o cursor no início da seleção.

`I` (_**I**nsert_) troca para o modo _INSERT_ com o cursor no início da linha.

`a` (_**a**pend_) troca para o modo _INSERT_ com o cursor no final da seleção.

`A` (_**A**pend_) troca para o modo _INSERT_ com o cusror no final da linha.

`o` (_**o**pen_) troca para o modo _INSERT_ com o cursor em uma nova linha abaixo da seleção.

`O` (_**O**pen_) troca para o modo _INSERT_ com o cursor em uma nova linha acima da seleção.

`u` (_**u**ndo_) desfaz a última alteração.

`U` refaz a última alteração desfeita.

`r` (_**r**eplace_) substitui com um caractere.

`R` (_**r**eplace_) substitui com o texto copiado.

`d` (_**d**elete_) deleta o conteúdo selecionado, adicionando-o no registro `"`.

`D` (_**D**elete_) deleta o conteúdo selecionado, sem adicioná-lo a nenhum registro.

`c` (_**c**hange_) deleta o conteúdo selecionado e troca para o modo

`~` altera o texto para letras minúsculas ou maiúsculas.

`>` indenta as linhas selecionadas.

`<` desindenta as linhas selecionadas.

`=` formata as linhas selecionadas.

`y` (_**y**ank_) copia a seleção para o registro selecionado.

`p` (_**p**aste_) cola o conteúdo do registro selecionado após a seleção.

`P` (_**P**aste_) cola o conteúdo do registro selecionado antes da seleção.

### _Selection_

`x` seleciona a linha atual. Se linha atual já estiver selecionada, seleciona a próxima.

`X` seleciona a linha atual.

## _Recipes_

Escrever aqui como fazer coisas que eu fazia no Visual Studio Code.

### Sorting

1. Selecione as linhas para serem ordenadas
2. Utilize `Alt+s` para dividir o cursor nas linhas selecionadas
3. Digite o comando `:sort`

Possivelmente, transformar isso aqui em um comando ou Keybinding. Algo como `sort-lines`.

### Múltiplos cursores com o _mouse_

1. Segure a tecla `Alt`
2. Clique com o botão esquerdo do _mouse_ onde inserir um cursor

## Dúvidas/Habilidades/Vontades

Quero remover ou trocar o atalho de CapsLock. Vai toma no cu quando aperto essa porra.

Quero mudar os _keybindings_ abaixo.

- `crase` altera o texto para letras minúsculas.
- `Alt + crase` altera o texto para letras maiúsculas.

Como posso trocar todas as ocorrências de uma palavra? Algo como o `Ctrl + h` do Visual Studio Code.

Como posso selecionar linhas para cima? O contrário de `x`.

Como posso deselecionar uma linha que acabei selecionando a mais com `- Como posso selecionar linhas para cima? O contrário de `xx.

Como posso deselecionar uma linha que acabei selecionando a mais com `x`?

Posso diminuir a quantidade de linhas navegadas por `Ctrl + d` e `Ctrl + u`.

Existe alguma forma mais fácil de remover o coteúdo até o final da linha ao invés de `g l x d`? Talvez seja melhor já selecioná-lo e então substituí-lo?

Preciso para de mover o cursor até o final da linha apertar `Enter` e começar a escrever na linha de baixo. Utilizar `o`.

Como posso realizar comandos do Git em linhas selecionadas? Algo como `Git: Revert selected ranges` e `Git: Stage selected ranges` do Visual Studio Code.

Quais _keybindings_ outros programadores configuram e utilizam?

LSP para Markdown, YML, TOML, e Python.

Como resetar uma seleção de palavra? Por exemplo, quando seleciono uma palavra com `w` e então quero deixar a seleção no início do meu cursor.

Seria legal me acostumar com `N + j | k` ao invés de apertar essas teclas repetidamente. No Visual Studio Code, eu utilizo `Ctrl + UpArrow | DownArrow`, mas isso implica, na maioria das vezes, em apenas se aproximar da linha em que quero chegar.

Remover os atalhos `Ctrl+b` e `Ctrl+f`.

Remover os atalhos de relacionados a _jumplist_.

## _Links_

https://keygli.de
https://tomgroenwoldt.github.io/helix-shortcut-quizhttps://www.youtube.com/@schr3da/videos
https://www.youtube.com/@vagabund4621
https://www.youtube.com/watch?v=HcuDmSb-JBU
https://www.youtube.com/watch?v=MURMkIlCHRg
https://www.youtube.com/watch?v=a0CQDaWlDlk
https://www.youtube.com/watch?v=b7hf4KXx9AA
https://www.youtube.com/watch?v=qAdVAaWEqto
https://www.youtube.com/watch?v=tJHjCGHGQhw
https://www.youtube.com/watch?v=wcKND97-bWI
