# Orientação a Objetos
<!-- .slide: data-background="img/3D-Object-Pictures.jpg" -->

--

### Declaração de Classe

    class Foo:        #python2 Foo(object):
        pass

- `class Foo` &srarr; `class Foo(object)`
- Classes são modos para definir novos objetos
- Cria uma novo objeto de classe chamado Foo
- Definição de classe cria um novo namespace (escopo)
- Variáveis definidas no corpo da classe são *atributos de classe*
- Funções definidas no corpo da classe são *métodos de instância*

--
### Construtores

    class Circle:
        def __init__(self, radius):
            self.r = radius

- `__init__` inicializa uma instância da classe
- `x = Circle()`
	- Cria um objeto do tupo `Circle`
	- Chama `Circle.__init__(self)`
	- Liga *self* com o nome *x*

--

### Métodos de instância

    class Circle:
        def __init__(self, radius=5):
            self.r = radius
        def get_perimter(self, a, b):
            return 2 * math.pi * self.r

- Definições de método de instância deve usar *self* como primeiro argumento

--
### Privado por convenção

- O primeiro `_` significa que uso é por seu risco
- "Todos os adultos aqui": você pode ainda acessar qualquer variável que você quer

        class Circle:
            _pi = 3.14
            ...

            def get_perimter(self):
                return 2 * self._pi * self.r

--
###### Exercícios
[Classes Python](http://lms.10x.org.il/item/46/)

---

# Herança
<!-- .slide: data-background="img/William_Hogarth_Inheritance.jpg" -->

--

### Herança simples

    class Circle(Shape):
        def __init__(self):
            super().__init__()     # python2 super(Circle, self).__init__()
            self.new_var = default

- Super classes são argumentos para a declaração `class`
- `objeto` é a classe base padrão
- `class Circle(Shape)`: herda de Shape
- Tenha certeza de chamar o `__init__` da super classe

--

```python
class Animal:
    sound = None
    def make_sound(self):
        print(self.sound)

class Cat(Animal):
    sound = "meow"

class Duck(Animal):
    sound = "quack"

c = Cat()
c.make_sound()

d = Duck()
d.make_sound()
```

--

```python
class TitleRenderer:
    def render(self, s):
        return "* {} *".format(s)


class UppercaseTitleRenderer(TitleRenderer):
    def render(self, s):
        return super().render(s).upper()
        # in python2:
        # return super(UppercaseTitleRenderer, self).render(s).upper()


t = TitleRenderer()
print(t.render("hello"))

u = UppercaseTitleRenderer()
print(u.render("hello"))
```

--

##### avançado
## Herança múltipla

    class Circle(Shape, Drawable):
        def __init__(self):
            super().__init__(self)

- Você pode herdar múltiplas super classes
- Atributos deve ser resolvido via MRO (Ordem de Resolução de Método)
- `Circle.mro()`

--

###### Exercício
[Herança de Classe](http://lms.10x.org.il/item/116/)

---

##### Avançado
# Python Magic! (métodos)
<!-- .slide: data-background="img/magic_mist.jpg" -->

--
## Métodos Mágicos

- *Açucar sintático* é feito com métodos mágicos
- Mètodos com a forma `__method_name__` são "mágicos"
- Coisas como `f()` e `seq[i]` são chamadas de métodos mágicos

--

## __new__, __init__, __call__
- `x = C()` &srarr; `x = C.__init__(C.__new__())`
    - `__new__` cria um novo objeto
    - `__init__` inicializa o objeto
- `x(arg,...)` &srarr; `x.__call__(arg,...)`

--

## __str__, __repr__
- `str(x)` &srarr; `x.__str__()`
	- Retorna uma string humanizada
- `repr(x)` &srarr; `x.__repr__()`
	- Retorna uma descrição completa do objeto


--

## Comparações
- `x < y` &srarr; `x.__lt__(y)`
- `x > y` &srarr; `x.__gt__(y)`
- `x <= y` &srarr; `x.__le__(y)`
- `x >= y` &srarr; `x.__ge__(y)`
- `x == y` &srarr; `x.__eq__(y)`
- `x != y` &srarr; `x.__ne__(y)`

--

## Operações aritméticas
- Todas as operações aritméticas possuem métodos mágicos
- `__add__, __sub__, __mod__, __xor__, ...`
- Métodos adicionais para += e outros

---

##### avançado
# Tópicos avançados

--
### Attribute Lookups
### Atributos de pesquisas
- `Foo.__dict__` é um dicionário de armazenamento de atributo de classe
- `Foo.val` traduz para `Foo.__dict__['val']`
- Dados `x = Foo()` então `x.__dict__` é um dicionário de armazenamento de atributos da instância
- *x.val* traduz para:
	- `x.__dict__['val']` se *val* é um atributo de instância
	- `Foo.__dict__['val']` se não houver nenhum attributo de instância chamado *val*, mas existe um atributo de classe chamado val

--

### Métodos estáticos

    class Circle:
        @staticmethod
        def radius_to_perimeter(r):
            return 2 * math.pi * r

- Anexa funções para classes (com contexto similar)
- Um método estático não recebe um argumento *self*
- Métodos estáticos não deve depender de atributos de classe

--

### Métodos de classe

    class Circle:
        @classmethod
        def from_circumference(cls, circ):
            return cls(circ/(2 * math.pi))

- Um método de classe retorna um objeto de classe como *self*.
- Alternativa ao construtor.
- Chamada o primeiro argumento *cls*

--

### Atributos privados

- `__`
	- O primeiro `__` é usado para prevenir subclasses de acidentalmente sobrescrevê-la
	- Ele faz isso name mangling (decoração de nome):
        - `__some_var` &srarr; `_classname__some_var`
        - classname é o nome da classe que `__some_var` foi definido
	- Se você souber o nome da classe e variável você pode fazer o mangling você mesmo

--

## Sem getters e setters???
- No python, `@property` e `@attr.setter` substitui a necessidade de getters e setters
- Métodos decorados com `@property`, substitui atributos getter
	- Retorno chamados em `x.attr`
- Métodos decorados com `@attr.setter`, substitui atributos setter
    - Retorno chamado em `x.attr = val`

--

```
import math

class Circle:
    def __init__(self, radius):
        self.radius = radius

    @property
    def area(self):
        return self.radius ** 2 * math.pi

c = Circle(2)
print(c.area)
```

--
## Mergulhando no `super`

- `super(cls, obj)` &srarr; `super(C, self)`
	- Quando deseja chamar super fora de um método de classe, você precisa forneceer o nome da classe e seu conteúdo
	- Classe que precede de *cls* na MRO de *obj*
    - É obrigatório &srarr; *obj* é inserido em chamadas de método
- `super()`
	- quando chamado em métodos de instância da classe, deve chamar classe raiz.

--
## getattr
- `x.value` &srarr; `getattr(x, 'value')`
- Útil quando o nome do atributo é definido em tempo de execução
- `getattr(self, name)` calls `__getattribute__(self, name)` which falls back on `__getattr__(self, name)`
- Definindo `__getattr__` é útil para especificar valores padrão
- `getattr(x, 'value', default)` permite que você defina um padrão se todo o resto falhar
