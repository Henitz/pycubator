<!-- .slide: data-background="img/monty-python.jpg" -->
# Introdução

### Pycubator

---

## Python?

--

* Dinamicamente tipado
* Multi-paradigma
* Sintaxe intuitiva
* Interpretado
* Tipos de dados de alto nível
* Compromisso entre shell script e um programa C++/Java

--

### Porque aprender Python?

* Fácil de aprender a praticar <!-- Citar algum case nacional -->
* Fortemente usado no mercado: Google, Facebook(Instagram), Microsoft, Dropbox, Globo.com, etc.
* Utilizando em várias áreas - web, data science, devops, automação, IA e muito mais.

<!--

* Easy and practical to learn (see [Python is Now the Most Popular Introductory Teaching
Language at Top U.S. Universities][usage])
* Industrial strength, used by: Google, Facebook(Instagram), Microsoft, Dropbox, etc.
* Utilized in many fields - web, data science, ops, automation, AI and much more.
-->

[usage]: http://cacm.acm.org/blogs/blog-cacm/176450-python-is-now-the-most-popular-introductory-teaching-language-at-top-us-universities/fulltext

--

### Um pouco de história

--

![](img/guido.jpg)

Esse é o Guido Van-Rossum, criador do Python ^^

--

"Let me introduce myself. I'm a nerd, a geek. I'm probably somewhere on the autism spectrum.
I'm also a late bloomer. I graduated from college when I was 26. I was 45 when I got married.
I'm now 60 years old, with a 14 year old son... I'm no Steve Jobs or Mark Zuckerberg. But at age 35
I created a programming language that got a bit of a following. What happened next was pretty
amazing..."

Guido's, [king's day speech][speech]

[speech]: http://neopythonic.blogspot.co.il/2016/04/kings-day-speech.html

--

### Como foi e como o Python é feito?

* Comunidade de [voluntários](core-dev), aka core developres ([você também pode ser um](be-core-dev))
* Processo transparente através do Python Enhancement Proposals ([PEPs](PEPs))

[PEPs]: https://www.python.org/dev/peps/
[core-dev]: https://hg.python.org/committers.txt
[be-core-dev]: https://docs.python.org/devguide/coredev.html

---

## O Zen of Python

--

* Bonito é melhor que feito
* Explícito é melhor do que implícito
* Simples é melhor do que complexo
* Complexo é melhor do que complicado
* Legibilidade conta

[Zen of Python completo](zen-of-python)

[zen-of-python](https://zenorocha.com/licoes-aprendidas-com-o-mundo-python/)
--

### Java

    public class Hello{
      public static void main(String[] args){
        System.out.println("Hello, world!");
      }
    }

--

### C++

    #include <iostream>

    int main(){
      std::cout << "Hello World!" << std::endl;
      return 0;
    }
--

### Python

    print('Hello World!')

--

### Outras idéias

* Deveria haver um - e preferencialmente só um - modo óbvio de fazer algo
* Clareza sobre velocidade

---

## A grande divisão
#### Python2 vs. Python3

--
### Linha do tempo

* Dezembro 1989:  Guido  Van  Rossum  inicia a implementação do Python
* Janeiro 1994:  Versão 1.0 lançado
* Outubro 2000:  Versão  2.0 lançado
* Dezembro  2008:  Versão  3.0  lançado
* Junho  2009:  Versão  3.1  lançado
* Julho  2010:  Versão  2.7  lançado com correções de segurança
* Novembro 2016:  Versões atual do Python são 2.7.12 and 3.5.2

--

###  Porque Python 3?

* Guido procurava alterar algumas partes do design da linguagem (principalmente encoding de strings)
* Financiamento fornecido pela Google
* Uma lingua nova nasceu (só um pouco)

--

### Python 3 incompatível com versões anteriores!

* `print` e `exec` tornam-se funções
* Uso massivo de generators ao invés de listas
* Todo o texto (str) é Unicode e texto encoded é um dado binário (bytes)
* Outras pequenas alterações no standard library

--

### Então, porque usar Python 3?

* Encoding adequado
* Programação assíncrona (`async/await`)
* Inserção do `virtualenv` na Standard Library
* Diretório `__pycache__`
* Argumento com somente palavras-chave ([PEP 3102](PEP-3102))

E muito, muito mais, mas vamos voltar nisso depois...

[PEP-3102](https://www.python.org/dev/peps/pep-3102/)

---
## Ferramentas para codificação

---

## REPL - Read Evaluate Print Loop
(Shell interativo)

--
### REPL - Read Evaluate Print Loop

    $ python
    Python 2.7.9 (default, Apr  2 2015, 15:33:21)
    [GCC 4.9.2] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>>print('hello world!')
    hello world!

* To exit use `ctrl+d` on *nix, and `ctrl+z` on windows.

--

### Porque eu devo usar isso??

* Fácil!
* Ajuda a testar o comportamento do código Python
* Mas... não é legal trabalhar com código multilinha (ex.: classes, funções)

--

###### Exercícios
### Python como uma calculadora

* Tenta executa o seguinte código no seu python shell:

        >>> 10 + 10
        20
        >>> 50 * 2
        100
        >>> 10 + 20 * 3
        70
        >>> (10 + 20) * 3
        90

* O que `**` faz?
* O que `%` faz?
* O que `import this` faz?

---

## IPython
### (REPL com esteróides)

--
```bash
$ ipython
Python 3.5.1 (default, Mar  3 2016, 09:29:07)
Type "copyright", "credits" or "license" for more information.

IPython 4.0.2 -- An enhanced Interactive Python.
?         -> Introduction and overview of IPython's features.
%quickref -> Quick reference.
help      -> Python's own help system.
object?   -> Details about 'object', use 'object??' for extra details.

In [1]: fr
from       frozenset
```

--

### Funcionalidades legais

* Use `tab` para autocomplete.
* Acrescente um `?` no fim da variável, função, classe e mais que deseja saber.
* Executa comandos shell normalmente com Ipython: `!ls`
* O comando `%magic` é realmente legal. Tente `%history`, `%save` e `%pastebin` por exemplo.

---

## Arquivos *.py

--
* Código fonte Python
* (Não precisa de compilação)

--

### .py files

![gedit](img/gedit-hello-world.png)

    $ python /tmp/example.py
    hello world!

---

## Guia de estilo

- Python coloca uma forte ênfase na legibilidade
- Consequentemente a [PEP 8][pep8] foi criada
- Ele mantem um guia de estilo para mostrar como o código Python deve ficar **bonito**

[pep8]: https://www.python.org/dev/peps/pep-0008/


---

##### Avançado
## Mais um pouco de teoria

--

### Interpretado?

* O que significa para uma linguagem ser "interpretada?"
* Dica - "interpretado" e "compilado" se refere a implementações, não linguagens
* A implementação Python mais comum (CPython) é uma mistura de ambos:
   * Código-fonte compilado para byte code (arquivos .pyc)
   * Em seguida, o byte code é interpretado diretamente
   * Essencialmente, código-fonte pode ser executado diretamente
