<!-- .slide: data-background="img/function.jpg" -->
# Funções e Programação Funcional

---

# Argumentos posicionais e nomeadas
<!-- .slide: data-background="img/steen_argument_over_a_card_game.jpg" -->

--

### Argumentos Posicionais

    def func(arg1, arg2, arg3):
        pass

    func(a, b, c)

- `arg1`, `arg2` e `arg3` são argumentos posicionais
- Quando invoca `func`, exatamente 3 argumentos devem ser passados, então, o número
errado de argumentos resulta em um `TypeError`
- A ordem da chamada determina que arg elee estão vinaulados

--
### Argumentos Nomeados

    def say(arg1, named1, named2):
        print(arg1, named1, named2)

    say('make', named2='day', named1='my')

    # output
    make my day

- Argumentos nomeados podem ser passados fora de ordem


--

### Argumentos padrão

    def func(arg1, named1=val1, named2=val2):
        pass

    func(a, named2=b, named1=c)

- Depois dos args regulares, argumentos padrão podem ser aceitos
- `val1` e `val2` são valores para essas variáveis.
- Omitindo argumentos nomeados em uma chamada, serão usados
os valores padrão.

--
##### avançado
### Mutação dos argumentos padrão

- Os argumentos padrão são avaliados quando a função é definida
- Em todas as chamadas, o objeeto que a expressão foi avaliada sera usado.
- Se o padrão é mutável, as atualizações seguem um efeito de chamadas
- `def func(a=[])` deverá mudar o padrão em cada chamada
- Use None como padrão para evitar mutação

        def func(a=None):
            a = a or []

--
##### avançado
### Memoização

- Memoização é uma técnica de otimização que armazena resultados em
chamadas de função
- As respostas computadas anteriormente, podem ser pesquisadas em
futuras chamadas
- Use um dicionário padrão arg para armazenar as respostas
- `def func(arg, cache={}):`
- Armazene respostas em `cache[arg] = ans`
- Verifique arg no cache antes de fazer qualquer trabalho

---

# Args e KWArgs
<!-- .slide: data-background="img/argument-shadows.jpg" -->

--

### *args

     def func(arg1, *args):
        print(args)
     func(1, 2, 3, 4)

     # output:
    (2, 3, 4)

- Uma número de variáveis de argumentos posicionais que podem ser especificadas
- Deve usar qualquer identificador, mas `args` é convencional
- `args` é uma tupla de 0 ou mais objetos

--
###### Exercícios
### Lista de Estudantes

- Implementa a função `list_students` com `args`

        expected_result = '''0 Tim
        1 Tom
        2 Tal'''

        assert expected_result == list_students('tal', 'tom', 'tim')


--
### **kwargs

    def foo(arg1, **kwargs):
        print(kwargs)

    foo(1,two=2, three=3)

    # output
    {'two': 2, 'three': 3}

- Use `**kwargs` no final
- Deve usar qualquer identificador, mas `kwargs` é convencional
- *kwargs* é um dicionário de strings para valores
- As chaves do *kwargs* são os nomes dos argumentos

--
###### Exercício
Implemente `person_details` com kwargs
```python
# output
assert person_details(name='Mike', age=28) == 'Mike is 28 years old'
```
--

### `*` em chamadas de função

    def bar(arg1, arg2, arg3):
        print(arg1+arg2+arg3)

    l = [1, 2, 3]
    bar(*l)

    # output
    6

- `l` é um iterável
- Isso é pego descompactado, como argumentos posicionais de `bar`

--
### `**` em chamadas de função

    def print_person(name, age):
        print('{} is {} years old'.format(name, age))

    person = {'name': 'Mike', 'age': 28}
    print_person(**person)

    # output
    Mike is 28 years old


- `person` deve ser um dicionário de forma `{'string': val, ...}`
- Ele é pego descompactado como argumentos palavra-chave de `print_version`


--
##### avançado
### Expansão de iterador

    a, *the_rest = range(4)
    print(the_rest)

    # output
    (1, 2, 3)

- Somente funciona no Python 3
-   Only works on Python3
-   `a,*var_name = range(5)`: `var_name` é uma lista pegando 0 ou mais valores

--
##### avançado
### Args de palavra-chave obrigatórias

- Somente no Python 3
- Qualquer argumento depois de `*args` são argumentos de palavra-chave
- Se não houver nenhum valor padrão especificado, eles serão obrigatórios
como argumentos de palavra-chave
- `dev func(*args, named):`
	- `named` é um arguento de palavra-chave obrigatória
- Para especificar argumentos de palavra-chave obrigatórias sem aceitar
variáveis posicionais use `*`
- `def func(arg1, *, named)`
	- `named` é um kwarg obrigatório
	- `func` deve pegar exatamente um arg posicional e um arg kwarg


--
##### avançado
### Anotações

    def func(name: str, hight: float = 1.90)-> int:
        pass

- Argumentos de função e retorno de valores podem ser anotados
- Python não reforça qualquer significado para anotações
- Leia mais sobre [PEP 3107](https://www.python.org/dev/peps/pep-3107/) and [PEP 484](https://www.python.org/dev/peps/pep-0484/)

---

##### avançado
# Closures, Global e Non-Local
<!-- .slide: data-background="img/global.jpeg" -->

--

### Closures

    def list_fruits():
        fruits = ['bannana', 'apple']
        def show():
            print(fruits)

        return show

    fruit_list = list_fruits()
    fruit_list()

    # saida:
    ['bannana', 'apple']


--

- Uma função que conhece a variável definida fora de seu escopo.
- `show()` é um closure, porque ele conhece sobre `fruits`.
- Closures são somente leitura: adicionando `fruits += ['kiwi']` dentro de `show()`
irá resultar uma exceção `UnboundLocalError`.

--

### Global

    a = 42
    def func():
        global a
        a += 1

- Alterando estado global pode ser perigoso, então Python obriga que você declare isso explicitamente
- `global` pode contornar closures somente leitura
- A palavra-chave `global` declara certas variáveis em um bloco de código atual para referência ao escopo global
- Variáveis que seguem global não precisam ser limitadas novamente

--

### Nonlocal

    def outer():
        a = 42
        def func():
            nonlocal a
            print(a)
            a += 1
        func()

- Somente Python 3
- `nonlocal` declara certas variáveis em um bloco de código atual para referência ao escopo de inclusão
mais próximo.
- Se o escopo de inclusão é um escopo global, então o nonlocal levanta um `SyntaxError`
-   Veja [PEP 3104](https://www.python.org/dev/peps/pep-3104/)


---

##### avançado
#Programação Funcional
<!-- .slide: data-background="img/lambda.jpg" -->
--

### Background (1)

- A Programação Funcional começou com cálculo lambda
- Alternativa para máquinas Turning para computabilidade
- Programas expressam como operações de funções em outras funções
- Programação funcional tente facilitar o raciocínio sobre o comportamento do programa
- Nenhum estado de dados permite a programação multi-thread de forma fácil

--

### Background (2)
- Dados em Python são mutáveis é permitem efeitos colaterais
- Possui alguns conceitos funcionais
- Não é um ambiente ideal de programação funcional

--

### Funções de primeira classe
- Uma **função de primeira classe** é uma função que faz pelo menos uma das seguintes:
	- Toma uma função como um de suas entradas
	- Executa uma função
- Você pode usar funções em qualquer lugar, que você usaria um valor
- Funções são imutáveis, então você pode usar eles como chaves de dicionários
- Funções podem ser valor de outra função

--

### Funções &lambda; (lambda)

    f = lambda x: x + 1

- Funções anônimas são objetos de função sem um nome
- *lambdas* podem ter os mesmos argumentos que uma função regular:
`lambda arg, *args, named=val, **kwargs: ret`
- *lambdas* deve ter uma linha e não suportar anotações
- 'açucar sintático' para passar funções curtas para outras funções.

--

### Funções de Alta Ordem
- O mais comum são `map` e `filter`
- `map(f, seq)` retorna um iterador contendo cada elemento de `seq` mas com `f` aplicado
-   `filter(f, seq)` retorna um interador de elementos de seq aonde `bool(f(seq[i]))` é `True`

--

### Funções como palavra-chave Args

- Várias funções devem aceitar outra função como um kwargs `sorted(seq, key=f)`
- `sorted` deve chamar `f` do elemento para ordem determinada
- Tendo uma chave, reotrna uma tupla para classificar múltiplos campos
- `min(seq, key=f)` e `max(seq, key=f)` possui comportamento similar
- Isso é um bom local para lambda

--

### Aplicativo parcial

    from functools import partial
    def add(x, y):
        return x + y

    add_3 = partial(add, 3)

- Aplicativo parcial cria uma nova função fornecendo uma função existente com alguns dos seus argumentos

---

##### avançado
# Decoradores
<!-- .slide: data-background="img/decorators.jpg" -->

--

### Decoradores

- Decoradores são transformações em funções
- Uma função que recebe uma função e retorna outra função modificada

        @dec
        def func(arg1, arg2, ...):
            pass

- É equivalente para:

        def func(arg1, arg2, ...):
            pass
        func = dec(func)


--

### Argumentos em decoradores

- Um decorador pode ter argumentos

        @decmaker(argA, argB, ...)
        def func(arg1, arg2, ...):
            pass

- É equivalente para:

        def func(arg1, arg2, ...):
            pass
        func = decmaker(argA, argB, ...)(func)

--
### Exemplo de decorador

    import urllib
    from functools import lru_cache

    @lru_cache(maxsize=32)
    def get_pep(num):
        'Recupera texto de um Python Enhancement Proposal'
        resource = 'http://www.python.org/dev/peps/pep-{:04d}'.format(num)
        try:
            with urllib.request.urlopen(resource) as s:
                return s.read()
        except urllib.error.HTTPError:
            return 'Not Found'

--

### Múltiplos Decoradores

    @dec1
    @dec2
    def func(arg1, arg2, ...):
        pass


- É equivalente para:

        def func(arg1, arg2, ...):
            pass
        func = dec1(dec2(func))

