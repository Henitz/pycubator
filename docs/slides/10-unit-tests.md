# Testes unitários
### Pycubator

--
### Para que fazer Testes?

-   Encontrar defeitos cedo custa menos do que corrigi-los tarde.
-   Os defeitos removidos no teste unitário custam cerca de 10 vezes menos do que os defeitos removidos na  verificação funcional.
-   E cerca de 40 vezes menos do que defeitos removidos por sistemas ou testes de integração.

--

### O que é teste Unitário ?


-   Um teste unitário isola uma parte do programa
-   Testa um único comportamento
-   Identifica claramente qualquer motivo de falha
-   Comportamento esperado dos documentos
-   Funciona rapidamente

--

### Um teste não é um teste unitário se:

*   Ele fala com o banco de dados
*   Ele se comunica através da rede
*   Toca o sistema de arquivos
*   Ele não pode ser executado ao mesmo tempo que outros testes unitários
*   Você tem que fazer coisas especiais para o seu ambiente (como a edição de arquivos de configuração) para executá-lo

Source: [Michael Feathers' blog](http://www.artima.com/weblogs/viewpost.jsp?thread=126923) (2005)

---

# Demonstração de teste unitário

--

### Intercalar

-   Vamos escrever uma função para intercalar duas listas
-   Será bom se uma lista for mais longa do que a outra
-   Antes de começar a escrever o código, devemos saber o que a função deve produzir para todos os tipos
    de entradas:

        interleave([], []) # -> []
        interleave([1,5,3], ["hello"]) # -> [1,"hello",5,3]
        interleave([True], [[], 8]) # -> [True, [], 8]

--

-   Escreva o teste primeiro, `interleave_test.py`:

        from interleave import interleave
        import unittest

        class TestGettingStartedFunctions(unittest.TestCase):
            def test_interleave(self):
                cases = [
                    ([], [], []),
                    ([1], [9], [1, 9]),
                    ([2], [7, 8, 9], [2, 7, 8, 9]),
                ]

                for a, b, expected in cases:
                    self.assertEqual(interleave(a, b), expected)

        if __name__ == '__main__':
            unittest.main()


--

-   Escreva um stub, `interleave.py`:

        def interleave(a, b):
            return None

--

-   Execute o teste

        $ python interleave_test.py
        F
        ======================================================================
        FAIL: test_interleave (__main__.TestGettingStartedFunctions)
        ----------------------------------------------------------------------
        Traceback (most recent call last):
          File "interleavetest.py", line 15, in test_interleave
            self.assertEqual(interleave(a, b), expected)
        AssertionError: None != []

        ----------------------------------------------------------------------
        Ran 1 test in 0.000s

        FAILED (failures=1)

--

-   Agora escreva o código

        def interleave(a, b):
            """Retorna a intercalação de duas seqüências como uma lista."""
            return [y for x in izip_longest(a, b) for y in x if y is not None]

--

-   Teste novamente

        $ python interleave_test.py
        E
        ======================================================================
        ERROR: test_interleave (__main__.TestGettingStartedFunctions)
        ----------------------------------------------------------------------
        Traceback (most recent call last):
          File "interleavetest.py", line 15, in test_interleave
            self.assertEqual(interleave(a, b), expected)
          File "/Users/raytoal/scratch/interleave.py", line 3, in interleave
            return [y for x in izip_longest(a, b) for y in x if y is not None]
        NameError: global name izip_longest is not defined

        ----------------------------------------------------------------------
        Ran 1 test in 0.000s

        FAILED (errors=1)
--

-   Corrigir o código

        from itertools import izip_longest

        def interleave(a, b):
            """Retorna a intercalação de duas seqüências como uma lista."""
            return [y for x in izip_longest(a, b) for y in x if y is not None]

--

-   Repetir o teste

        $ python interleave_test.py
        .
        -------------------------------------------------------------
        Ran 1 test in 0.000s

        OK

---
# Recursos e exercício

--
### Recursos
-   Ray Toal, [unittest in 5 minutes](http://www.slideshare.net/raytoal/unittest-in-5-minutes)
-   Python stdlib [documentation](https://docs.python.org/3/library/unittest.html#module-unittest)


--
###### exercício
[Unit testing](http://lms.10x.org.il/item/47/)
