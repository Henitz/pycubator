# Arquivos e Módulos 
### Pycubator

---

# Arquivos
<!-- .slide: data-background="img/files.jpg" -->
National Archives UK

--
### Abrindo arquivos

- `open(name, mode)` retorna um objeto do tipo _file_
- `name` é o caminho do arquivo a ser aberto
- `mode`:
    - `'r'` (read - leitura): o arquivo é aberto em modo somente leitura
    - `'w'` (write - escrita): o arquivo é aberto em modo somente escrita, e é truncado.
    - `'a'` (append - adição): como 'e' mas acrescenta no arquivo sem truncar.
    - `'x'`: como 'w' mas o arquivo não deve existir.
- `open(name)` padrão para leitura: `open(name, 'rt')`

--
### Fechando
- `f.close()`:
	- Lança um tratamento no arquivo
    - Escreve o contéudo do objeto _file_ no disco.
- Pode ser feito de forma alternativa usando a declaração `with`:

        with open('example.txt') as f:
            print(f.read())

--
### Lendo
- `f.read()` faz a leitura de todo o arquivo (até `EOF`)
- `f.read(index)` faz a leitura do arquivo até `index`

        # Prints each line of the file.
        with open('example.txt') as f:
            for l in f:
                print(l)

--
### Escrevendo
- `f.write(string)` escreve string (sem adicionar `\n`)
- `f.writelines(sequence)` escreve uma sequência de conteúdo (também sem adicionar `\n`)

        fruits = ['Bannana', 'Melon', 'Peach']
        with open('example.txt', 'w') as f:
            f.writelines(fruits)

--
###### Exercícios

[Trabalhando com arquivos](http://lms.10x.org.il/item/35/)

---

# Módulos e pacotes

--
### A declaração import

- Habilita uso do outro arquivo python ou biblioteca
- Importação: `import math`
- Importação nomeada: `import match as m`
- Importação específica: `from match import pow`
- Importação total: `from match import *` (cuidado! use somente em casos específicos)

--

### Módulos

    # utensils.py
    def eat_soup():
        return 'spoon'

    # main.py (opção 1)
    import utensils
    print(utensils.eat_soup())

    # main.py (opção 2)
    from utensils import eat_soup
    print(eat_soup())

--
### Pacotes

- Pacotes são namespaces que contém múltiplos pacotes e módulos.
- Pacotes são simplesmente diretórios, mas tem um porém: cada pacote/diretório
  DEVE conter um arquivo especial chamado de `__init__.py`
- Não inserindo o arquivo `__init__.py` em um pacote usando Python 3 deve funcionar
  mas isso é uma [outra história](https://www.python.org/dev/peps/pep-0420/)

--
```python
# fruits/__init__.py
# -- vazio -- nada aqui -- realmente nada -- somente um solitário e vazio arquivo

# fruits/apple.py
def print_it():
    print('apple')

# main.py
from fruits import apple
apple.print_it()
```
--

- Se a pasta conter um arquivo `__init__.py`, ele mesmo pode ser importado com o nome do pacote.

        # foo/__init__.py
        def greeting():
            return "Hello World!"

        # main.py
        from foo import greeting
        print(greeting())

--
##### Avançado
### Módulos são singletons

    # stuff.py
    fruits = ['Pineapple']

    # module_a.py
    import stuff
    def foo():
        stuff.fruits.append('Apple')

    # module_b.py
    import stuff
    def foo():
        stuff.fruits.append('Banana')

--

    # program.py
    import module_a, module_b, stuff
    module_a.foo()
    module_b.foo()
    print(stuff.fruits)

    # output
    ['Pineapple', 'Apple', 'Banana']

