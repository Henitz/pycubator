# Tipo de dados compostos
<!-- .slide: data-background="img/puzzles.jpg" -->

--

### Visão Geral
- Tipos de dados são compostos em pequenas partes, exemplo: uma string é composta de strings menores que contém um único caracter.
- Suporta métodos semelhantes, embora cada tipo tenha suas próprias qualidades e deve ser efetivo em certos casos (e não em outros).
- Tipos incluidos são: string, tuplas, listas, dicionários e sets.

---

# Mais diversão com Strings!
<!-- .slide: data-background="img/string.jpg" -->

--
### Slicing
- Similar com parâmetros `range`
- Índices com pares de colchetes: `s[1]`
- Índice negativo que retorna o elemento no fim da lista: `s[-1]`
- Fatias:
  - Sintaxe básica é `s[inicio:final]`: `s[1:4]`
  - Fatiando no inicio da string: `s[:5]`
  - Fatiando até o final da string: `s[3:]`
  - Índice negativo também pode ser usado em fatias: `s[-3:-1]`

--
### Exemplos

    s = 'hello world'

	# fatiando (incluindo inicio, excluindo o final)
    s[1:4]  # -> 'ell'

    # a partir do início do índice
    s[:4]  # -> 'hell'

	# a partir do final do índice
    s[3:]  # -> 'lo world'

--
### Exemplos

	# pode usar índice negativo também
    s[2:-2]  # -> 'llo wor'

	# saltos
    s[::2]  # -> 'hlowrd'
    s[1::2]  # -> 'el ol'

	# saltos negativos
    s[::-1]  # -> 'dlrow olleh'

--

### Dividindo, juntando e listando
* Dividindo uma string de acordo com o valor:

        'hello world'.split()  # -> ['hello', 'world']

        'hello, and ,welcome'.split(',', maxsplit=1) # -> ['hello', ' and ,welcome']

* `['hello', 'world']` é um dado do tipo lista. Nós vamos ver mais sobre isso depois!

--

* Unindo valores de uma lista usando um separador de string específico
        ' '.join(['hello', 'world'])  # -> 'hello world'

        ','.join(['first line', 'second line'])  # -> 'first line,second line'

--
###### Exercícios
[Dividindo, Juntando e Mais](http://lms.10x.org.il/item/30/)

---

# Listas
<!-- .slide: data-background="img/list.jpg" -->
--
### Básico
- Uma coleção ordenada
- Cria uma lista vazia:

        >>> l = list()
        >>> type(l)
        list
        >>> l = []
        >>> type(l)
        list

--
### Modificando

- Acrescentando valores na lista:

        >>> l.append('apple')
        >>> l
        ['apple']
        >>> l.append('orange')
        >>> l
        ['apple', 'orange']

- Criando uma lista populada:

        >>> l = ["orange", "apple", "strawberry", "banana", "apricot"]
        >>> l
        ['orange', 'apple', 'strawberry', 'banana', 'apricot']

--

- Adicionando em um índice específico:

        >>> l.insert(3, 'melon')
        >>> l
        ['orange', 'apple', 'strawberry', 'melon', 'banana', 'apricot', 'grapes']

- Removendo um item de um índice específico:

        >>> del l[0]
        >>> l
        ['apple', 'strawberry', 'melon', 'banana', 'apricot', 'grapes']

--

- Removendo um elemento (remove ele e retorna o seu valor):

        >>> l.pop() # last element by default
        'grapes'
        >>> l
        ['apple', 'strawberry', 'melon', 'banana', 'apricot']
        >>>l.pop(0) # by index
        'apple'
        >>> l
        ['strawberry', 'melon', 'banana', 'apricot']

--
### Mais ações

- `lst[i] = v`: Altera um elemento ou fatia por atribuir a ele
- `lst.extend(l)`: Adiciona um iterável (uma outra lista, por exemplo)
- `lst.remove(v)`: Remove um valor específico

--

### Sequência de operações nas listas

- Todas as sequências de operações são válidas nas listas:

        >>> l = ['orange', 'apple', 'strawberry', 'melon', 'banana', 'apricot', 'grapes']
        >>> len(l)
        7

- Loops for através das listas:

        >>> for x in l:
        ...     print(x)
        ...
        orange
        apple
        strawberry
        banana
        apricot

--

- Recuperando elementos por índice, índice negativo e fatia:

        >>> l[0]
        'apple'
        >>> l[8]
        ...
        IndexError: list index out of range
        >>> l[-1]
        'grapes'
        >>> l[2:4]
        ['strawberry', 'melon']
        >>> [10,20,30,40][::-1]
        [40, 30, 20, 10]

--

- O operador `in` escaneia por todos os elementos e retorna `True` ou `False`:

        >>> 'apple' in l
        True
        >>> 'basketball' in l
        False

- Listas podem ser concatenadas com `+` e multiplicadas por `*`:

        >>> [25,3,14] + [5,4] + [101, 2]
        [25, 3, 14, 5, 4, 101, 2]
        >>> ["foo", "bar"] * 4
        ['foo', 'bar', 'foo', 'bar', 'foo', 'bar', 'foo', 'bar']

--

### Operações in loco

- O método `.reverse()` altera a própria lista, e retorna `None`:

        >>> fruit = ["orange", "apple", "strawberry", "banana", "apricot"]
        >>> fruit.reverse()  # changes the list fruit!
        >>> fruit
        ['apricot', 'banana', 'strawberry', 'apple', 'orange']

--

- O método `.sort()` organiza os próprios elementos, e retorna `None`:

        >>> fruit = ["orange", "apple", "strawberry", "banana", "apricot"]
        >>> fruit.sort()  # changes the list fruit!
        >>> fruit
        ['apple', 'apricot', 'banana', 'orange', 'strawberry']
        >>> fruit.sort(reverse=True)
        >>> fruit
        ['strawberry', 'orange', 'banana', 'apricot', 'apple']

--

### Listas e Referências

Enquanto estiver usando o operador de atribuição (`=`) em uma lista, a referência é criada para a lista original:

    >>> l = [10,5,25,100,250,1,8]
    >>> l
    [10, 5, 25, 100, 250, 1, 8]
    >>> l2 = l
    >>> l2
    [10, 5, 25, 100, 250, 1, 8]
    >>> l.append("BOOM!")
    >>> l
    [10, 5, 25, 100, 250, 1, 8, 'BOOM!']
    >>> l2
    [10, 5, 25, 100, 250, 1, 8, 'BOOM!']

--

Como demonstrado acima, `l2` não é uma cópia de `l`, mas uma referência da mesma lista python na memória.
Para criar uma cópia da lista, use o operador de fatia (`[:]`):

    >>> l3 = l[:]
    >>> l3.append(9876)
    >>> l3
    [10, 5, 25, 100, 250, 1, 8, 'BOOM!', 9876]
    l
    >>> [10, 5, 25, 100, 250, 1, 8, 'BOOM!']

--

Tenha em mente é uma cópia rasa de l:

    >>> numbers = [10,20,30]
    >>> l = [numbers, "x", "y"]
    >>> l
    [[10, 20, 30], 'x', 'y']
    >>> l2 = l[:]
    >>> l2
    [[10, 20, 30], 'x', 'y']
    >>> l2.append("z")
    >>> l2
    [[10, 20, 30], 'x', 'y', 'z']
    >>> l
    [[10, 20, 30], 'x', 'y']
    >>> # BUT:
    >>> numbers.append(9999)
    >>> l
    [[10, 20, 30, 9999], 'x', 'y']
    >>> l2
    [[10, 20, 30, 9999], 'x', 'y', 'z']


(`copy.deepcopy` deve ser usado para criar uma cópia real das listas)

--
###### Exercícios

[Listas](http://lms.10x.org.il/item/148/)

---

# Tuplas
<!-- .slide: data-background="img/tulips.jpg" -->

--
### Visão geral
- **Imutável**
- Tuplas são usados para agrupar dados ordenados
- Suporta sintaxe de índices e fatiamento
- Poderosa funcionalidade de atribuição (packing/unpacking)
- Criação é mais rápida que a lista
- Pode ser _hashed_ (falamos isso em breve)

--
### Criando uma tupla
    >>> t = tuple()
    >>> type(t)
    tuple

    >>> t = (1, 2, 'hi')
    >>> type(t)
    tuple

    >>> t = 1, 2, 'hi' # cuidado
    >>> type(t)
    tuple

    >>> t = tuple([1,2,'yo'])
    >>> t
    (1, 2, 'yo')

--

### Poderosa atribuição

    x, y = 'hi', 'man'
    x, y = y, x
    print(x, y)

    # output
    man hi
---

# Dicionários
<!-- .slide: data-background="img/dictionary.jpg" -->

--
### Básico
- Um dicionário é um hash map:
  - Hash é uma chave para mapear valores
  - Chaves devem ser imutáveis para que o hash não mude
- `dict()` e `{}` são dicionários vazios.
- `d[k]` acessa o valor mapeado por `k`
- `d[k] = v` atualiza o valor mapeado por `k`

--
### Métodos
- `len()`, `in`, e `del` trabalha como listas
- `d.keys()` e `d.values()` Retorna uma lista correspondente das chaves e valores do dicionário.
- `d.items()` proxuz uma lista de tuplas `(k,v)`
- `d.get(k,x)` olha para o valor de `k`. Retorna `x` se `k not in d`
- `d[k] = x` cria uma chave ou altera um valor da respectiva chave.
- `d.pop(k,x)` retorna e remove o valor de `k`. Retorna `x` como padrão

--
### Substituição da decladação Switch
- Python não possui um `switch(x)`, já que dicionários fazem esse trabalho.
- Substitua o longo `if x = a: elif x = b: elif...` com o lookup de dicionários

--
###### Exercícios

[Dicionários](http://lms.10x.org.il/item/37/)


---

# Conjuntos (Sets)
<!-- .slide: data-background="img/set.png" -->

--
### Básico
- Sem ordem, nenhum valor duplicado
- Hash Set: elementos devem ser imutáveis
- Set vazio: `set()`
- Empty set: `set()` não é um `{}` (dicionário vazio)
- `{1, 'blah', 5, -1}`
- Pode desduplicar uma lista: `list(set(lst))`

--
### Métodos
- `s.add(v)`: adiciona um valor no set
- `s.remove(v)`: remove v. Deve disparar um erro se v não estiver em s
- `s.discard(v)`: remove v. Não disparar erro
- `s.difference(s2)` ou `s - s2`: elementos em s, mas não em s2
- `s.union(s2)` ou `s | s2`: elementos em s ou s2
- `s.intersection(s2)` ou `s & s2`: elementos em s e s2
- `s.update(s2)` ou `s = s | s2`: atualiza s com valores de s2

--
##### Exercício Avançado

[Conjuntos vs. Listas](http://lms.10x.org.il/item/90/)

---

# Comprehensions!
<!-- .slide: data-background="img/sequences.jpg" -->

--
### List Comprehensions
- Compila uma lista com uma linha.
- `[expr for v in iter]`
- `[expr for v in iter if cond]`
- Isso:

        res = []
        for v1, v2 in lst:
            if v1 > v2:
                res.append(v1 * v2)

- Se torna nisso:

        res = [v1 * v2 for v1, v2 in lst if v1 > v2]


--
### List Comprehensions aninhadas
- Isso:

        res = []
        for y in lst2:
            inter = []
            for x in lst1:
                inter.append(x)

- Se torna nisso:

        [[x for x in lst1] for y in lst2]


--
### Dictionary Comprehensions
- Como listas, mas troque `[]` por `{}`
- Isso:

        d = dict()
        for k, v in lst:
            d[k] = v


- Se torna nisso:

        {k: v for k,v in lst}


--
### Set Comprehensions
-   Como dicionários mas sem o `:`
-   Isso:

        s = set()
        for x in lst:
            s.add(x)

- Se torna nisso:

        {x for x in lst}


--
### Tuple Comprehensions?

        tup = (x for x in lst)
        type(tup)
        <class 'generator'>

- Vamos cobrir generators depois

---

# Iteradores Builtins

--

- `len(x)`: Mostra número de elementos
- `sum(x)`: Soma os elementos
- `a in x`: checa presença
- `all(x)/any(x)`: retorna `True` quando toda/qualquer elemento retorna `True`

--

- `max(x)/min(x)`: maior/menos elemento
- `reversed(x)`: iterador de elementos em ordem reversa (não trabalha com sets, porque?)
- `zip(x,x)`: lista de tuplas com um elemento de uma com outra lista
- `sorted(x)`: retorna uma lista ordenada

--
###### Exercícios

[Comprehensions](http://lms.10x.org.il/item/41/)
