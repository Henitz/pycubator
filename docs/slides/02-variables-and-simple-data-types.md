<!-- .slide: data-background="img/puzzles.jpg" -->
# Variáveis e Tipos de dados simples

### Pycubator

---

# Variáveis e comparações

--
### Atribuição

Variáveis em python pode armazenar valores. Isso é feito usando o operador de atribuição:

    >>> a = 100
    >>> a
    100
    >>> b = 200
    200
    >>> c = a + b
    300

--

### Reatribuindo

Você pode moficiar o valor de qualquer variável somente reatribuindo o valor:

    >>> a = 10
    >>> a
    10
    >>> a = 20
    >>> a
    20
    >>> a = 5.5
    >>> a
    5.5

--
### Atribuição aumentada

    >>> a = 50
    >>> a += 10
    >>> a
    60

-   A instrução acima é o mesmo que isso: `a = a + 10`
-   Tente: `-=`, `*=`, `/=`, `//=`, `%=` e `**=`.

--
### Convenção para nomes

De acordo com as convenções Python, nomes de variáveis deve ser minúsculas com palavras separadas por underlines:

    # Bom
    age = 12
    first_name = "Joe"
    x = 100

    # Ruim!
    J = 5.5
    UserName = "itzik"
    numOfRetries = 5

--

### Erros de nomes

 - O que acontece se você tentar acessar o valor de uma variável que não existe?

        >>> x = 100
        >>> x
        100
        >>> y
        NameError: name 'y' is not defined

- No script Python, cada variável deve ser atribuida antes dela ser acessada:

        print(x)  # This line raises NameError
        x = 1

--
##### Avançado
###  Removendo nomes

Variáveis ("nomes") podem ser removidas com `del`

    >>> x = 100
    >>> x
    100
    >>> del x
    >>> x
    NameError: name 'x' is not defined

--
### Comparações

- Cada tipo de dado tem sem comportamento específico quando encontra cada operador de comparação diferente
- Vamos ver mais no próximo slide, mas vamos verificar algums exemplos agora:

        >>> 1 > 2
        True
        >>> 5 < 7 <= 10:
        True
        >>> 'abd' > 'abc'
        True


--

| Operação  | Significado                    |
| --------- | ------------------------------ |
| `<`       | estritamente menos que         |
| `<=`      | menos ou iqual que             |
| `>`       | estritamente maior que         |
| `>=`      | maior ou igual que             |
| `==`      | igual                          |
| `!=`      | diferente                      |
| `is`      | identidade do objeto           |
| `is not`  | não identidade do objeto       |

---

# Booleanos

--

### Booleanos

Os tipos booleanos literais no Python são `True` e `False`.
Vamos rodar eles através da declaração `if`:

    >>> if True:
            print('Sure is')
    Sure is

    >>> if False:
            print('You shouldn't see me')


--

### Booleanos e outros tipos de dados
- Os seguintes valores é definido como `False`:
    -   `None`
    -   `0`
    -   `[]`(ou qualquer outra sequência vazia, string inclusive)
- Tudo diferente dos anteriores age como um `True`

--

### Operações booleanas

| Operação  | Resultado
| --------- | ---------------------------------------------
|`x or y`   | SE `x` E `False`, ENTAO `y`, SENAO `x`
|`x and y`  | SE `x` E `False`, ENTAO `x`, SENAO `y`
|`not x`    | SE `x` E `False`, ENTAO `True`, SENAO `False`

--
##### Avançado
### Curto circuito

- A tabela anterior mostra que em Python `and` e `or` são operadores **curso circuito**:

        >>> 1 or True
        1
        >>> True or 1
        True

-   Qual será o resultado de `True and (2 + 2)`?
-   E qual será de `not 3`?

---

# Strings
<!-- .slide: data-background="img/string.jpg" -->
--
### Literais de Strings

Os seguintes literais de strings são equivalentes:

    "Hello World!"
    'Hello World!'
    """Hello World!"""
    '''Hello World!'''

Escolha o tipo de aspas que precisa:

    "It's a very nice day."
    'The sign says "Hello World!".'

--
### Strings multi linha

Aspas triplas habilita o string multi-linha em seu código:

    """Shopping List:
    Cheese
    Apples
    Bread"""

    '''ABC
    DEF
    GHI'''

--
### Sequências de escape

Abaixo segue os as sequências de escape para strings:

*    `\n`: nova linha
*    `\t`: tabulação
*    `\'` e `\"`: aspas simples e aspas duplas.
*    `\\`: barra
*    `\x68`: caracter ASCII 104 ("68" em hexadecimal é 104 em decimal)

--
### Exemplo

    "I wrote: \"Hello!\".\nHe wrote: \"Goodbye!\"."

- Veja [análise léxica][lex] na documentação do Python para mais informações.

[lex]: http://docs.python.org/2/reference/lexical_analysis.html#string-literals

--
##### Avançado
### Strings cruas (Raw Strings)

Para desabilitar a função de escape, as raw strings podem ser usadas:

    >>> print('c:\windows\newstuff\todo')  # OOPS!
    c:\windows
    ewstuff odo
    >>> print(r'c:\windows\newstuff\todo') # Better.
    c:\windows\newstuff\todo

---

# Métodos de string comuns

--
### Checagem
*   endswith, startswith

        'hello world'.startswith('he')  # -> True
*   isalnum, isalpha, isdigit, islower, isupper, isspace

        '123'.isdigit()  # -> True
        'Hello World'.islower()  # -> False

--
### Pesquisas

*   count

        'hello world'.count('l')  # -> 3
*   find

        'hello world'.find('l')  # -> 2
        'hello world'.find('t')  # -> -1



--
### Manipulações

Esteja atento, porque `str` é um tipo imutável.
Todos os métodos abaixo retornam uma nova string.

--

*   lower, upper , title , capitalize , swapcase

        'hello world'.title()  # -> 'Hello World'
        'hello world'.capitalize()  # -> 'Hello world'

*   replace

        'hello world'.replace('world', 'john')  # -> 'hello john'

*   strip, rstrip, lstrip - remove espaços e nova linha no fim da string:

        '     hello!    \n'.strip() # -> 'hello!'

--
### `+` e `*`

    'hello ' + 'world'  # -> 'hello world'

    'hello ' * 3  # -> 'hello hello hello '

---

# Entrada interativa e formatação de strings
<!-- .slide: data-background="img/input.png" -->

--
### Entrada interativa
- `input()`
- `input(prompt)` imprime `prompt` antes da leitura do teclado
- **Cuidado!** no Python 2 use a função `raw_input()`

--
### Formatando

    name = 'Tom'

    # Estilo de formatação ruim
    print('hello ' + name + '!' )

    # Estilo de formatação antiga
    print('Hello %s!' % name)

    # Estilo de formatação nova
    print('Hello {}!'.format(name))

--

- Formatação nomeada

        TMPL = 'You got an error in {file} line {line}'
        #.....
        # ....

        print(TMPL.format(file='a.py', line=5))

- Formatação posicionada

        >>> print('{0} {0}, {1}'.format('repeat me','not me'))
        repeat me repeat me not me

--

- String possui x números de caracteres: `{:x}`

        TEST_RESULTS_TMPL = '{test:40} {status:10}'
        print(TEST_RESULTS_TMPL.format(test='NDU', status='Failed'))
        print(TEST_RESULTS_TMPL.format(test='Cluster expansion', status='Succeed'))
        ---
        NDU                                      Failed
        Cluster expansion                        Succeed
--

-   Formatando números como binário `{:b}` ou hexadecimal `{:x}`

        >>> print('{:b}'.format(5))
        101

--
### Recursos
-   [Especificação para mini-linguagem de formatação](https://docs.python.org/2/library/string.html#format-specification-mini-language).
-   [Exemplos](https://docs.python.org/2/library/string.html#format-examples)
-   [Receitas de formatação de Strings](http://ebeab.com/2012/10/10/python-string-format/)
-   [Casos mais comuns](http://pyformat.info/)


--
###### Exercícios
[Entrada e formatação de Strings](http://lms.10x.org.il/item/123/)
