# Exceções
<!-- .slide: data-background="img/puzzles.jpg" -->

---

# Capturando Exceções

--

### Python trata todos os erros com exceções

Uma exceção é um sinal de que um erro ou outra condição não usual ocorreu.

--
### Capturando uma exceção

    try:
        execute_some_code()
    except SomeException:
        handle_gracefully()

--

### Capturando todas as exceções

    try:
        execute_some_code()
    except:
        handle_gracefully()


--

- Não faça isso.
- Capturando exceções muito amplas é potencialmente perigoso.
- Entre outros, esse tratamento "coringa" deve disparar:
	- Disparos de saída do sistema
	- Erros de memória
	- Typos
	- Qualquer coisa que você pode não ter considerado

--
###### Exercício
### Divisão por zero

- Tente dividir `'1/0'`. O que acontece?
- Capture a exceção e diga ao usuário que ele não pode dividir por zero.

--
### Capturando múltiplas exceções

Lidando com todos eles do mesmo jeito

    try:
        execute_some_code()
    except (SomeException, AnotherException):
        handle_gracefully()


--

Lidando com eles separadamente

    try:
        execute_some_code()
    except SomeException:
        handle_gracefully()
    except AnotherException:
        do_another_thing()

---

# PDAA vs. MFPPP

--
### PDAA

Pense duas vezes antes de agir

> \[...\] testes explícitos para pré-condições antes de fazer chamadas ou
pesquisas. Esse estilo contrasta com a abordagem MFPPP e é caracterizado
pela presença de várias declarações if.

--

### MFPPP
Mais fácil pedir perdão do que permissão

> \[...\] assuma a existência de chaves ou atributos e capturas
de exceções, se a a suposição provar falsa. Essa limpeza e rápido estilo
é caracterizado pela presença de várias declarações *try* e *except*.
A técnica contrasta com o estilo padrão PDAA de várias outras
linguagens como o C.

--

### Exemplos
-   PDAA:

        import os
        if os.path.exists('tmp.txt'):
            with open('tmp.txt'):
                pass

-   MFPPP:

        try:
            with open('tmp.txt'):
                pass
        except IOError as e:
            print(e)

--

### Quando usar
>"Todos os erros são exceções, mas nem todas exceções são erros"

Use tratamento de exceções para recuperação de forma graciosa de erros de aplicação.
Mas: É perfeitamente permitido, e as vezes necessário, para utilizar
tratamento de exceções para fluxo de controle geral da aplicação. *EOFError*, por exemplo.

---

# Levantando, acessando e propagando

--

### Levantando exceções

Exceções podem ser levantadas usando `raise <exception>` com argumentos opcionais.

    raise RuntimeError()
    raise RuntimeError("error message")

--

### Acessando uma exceção

Use *as* para acessar o objeto do tipo de exceção

    try:
        raise RuntimeError("o hai")
    except RuntimeError as e:
        print(e)


--

### Propagando exceções

Blocos *try* podem ser aninhados;
Todas as exceções se propagam para o "manipulador de exceção raiz" de nível superior,
se não são detectadas.

    try:
        try:
            raise Exception
        except Exception:
            print('Inner')
    except Exception:
        print('Outer')

O manipulador de exceção raiz (padrão) termina o processo Python.

--

### Propagando exceções

Propagação pode ser forçado usando *raise* sem argumentos.
Isso aumenta a exceção mais recente.

    try:
        try:
            raise Exception
        except Exception:
            print('Inner')
            raise
    except Exception:
        print('Outer')


Isso é útil para por exemplo, logging de exceção.

--
### Prática

- Leia o arquivo [numeros.txt](exercises/numbers.txt).
- Adicione os inteiros no arquivo juntos, e imprima a suma até o final.
- Você precisa excluir as seguintes exceções e informat ao usuário sobre o problema:
	- `IOError`: se isso é um problema ao abrir o arquivo.
	- `ValueError`: se a linha lida não é um inteiro.
	- Todos os outros tipos: se qualquer outra exceção levantar, captura ele e diga 'erro inesperado ocorrido'

---

# Finally e Else

--
### Finally
O código no bloco `finally`, deve sempre ser executado (a não ser que o Python quebre completamente).

    try:
        open_file()
    except IOError:
        print('Exception caught')
    finally:
        close_file()

--

### Else
Código no bloco `else` deve ser executado quando nenhuma exceção foi levantada

    try:
        open_file()
    except IOError:
        print('Exception caught')
    else:
        print('Everything went according to plan')

---

# Escrevendo exceções

--
### Herança
- Exceções são combinados por relações de superclasses.
	- RuntimeError
	- StandardError
	- Exception
	- BaseException

--

### Combinações de exceções
- Hierarquia de exceções pode ser projetada.
- Por exemplo, `OverflowError`, `ZeroDivisionError` e `FloatingPointError`
são todas subclasses de `ArithmeticError`.
- Somente escreva um manipulador de `ArithmeticError` para capturar qualquer um deles.

--

### Escreva o seu próprio
Isso é simples como

    class MyException(Exception):
        pass

--
###### Exercício
### Escreva sua própria exceção!
- Crie uma função chamada de `guess_my_name` que:
	- Pegue uma entrada de usuário
	- Cheque se o usuário inseriu seu nome corretamente
	- Dispare uma exceção `NotMyName` se não inseriu corretamente.

- Chame a função:
	- Em um loop while, chame a função
	- se a exceção `NotMyName` é pego estando no loop.
	- senão saia e imprima 'sucesso!'
