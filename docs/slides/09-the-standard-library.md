
# A Biblioteca Padrão

---

# Time

--

- `time.time` returna o tempo em segundos desde a época como um numéro de ponto flutuante.

        import time
        t0 = time.time()
        for i in range(10000000):
            pass
        t1 = time.time()
        print(t1 - t0)

        # saida:
        1.1572110652923584

--

- `time.sleep` suspende execução para determinado número de segundos.

        import time
        print('Processando, por favor aguarde ...')
        time.sleep(2)
        print('Pronto.')

        # Saida:
		Processando, por favor aguarde ...
		Pronto.

---

# Logging

--
### Logging

- Em programas grandes e de longa execução, nós precisamos de impressões mais sofisticadas.
- O pacote *logging* habilita para facilmente efetuar log do estado corrente e o tempo exato no seu programa

--

- Uso básico:

        logging.debug('Alltems operational')
        logging.info('Airspeed knots')
        logging.warn('Lowfuel')
        logging.error('Nol. Trying to glide.')
        logging.critical('Glide attempt failed. About to crash.')

        # Saida:
        WARNING:root:Lowfuel
        ERROR:root:Nol. Trying to glide.
        CRITICAL:root:Glide attempt failed. About to crash.

- Porque não podemos ver as mensagens `debug` e `warning`?

--

- Nós podemos determinar a verbosidade do log com `setLevel`

        logging.root.setLevel(logging.DEBUG)
        logging.debug('Alltems operational')
        logging.info('Airspeed knots')

        # Saida
        DEBUG:root:Alltems operational
        INFO:root:Airspeed knots

--

- Com `basicConfig` nós podemos criar customizações para suas necessidades.
- Para exemplo vamos criar um log mais informativo:

        logging.basicConfig(format='[%(levelname)s %(asctime)s %(module)s:%(lineno)d]  %(message)s',
                            level=logging.DEBUG)
        logging.debug("you'll see a lot more information now...")

        # Saida
        [DEBUG 2015-07-14 22:59:59,160 <ipython-input-60-8bd2b8d57226>:5]  you'll see a lot more information now...

--

- Ou registrar os logs em um arquivo:

        logging.basicConfig(filename='example.log',level=logging.DEBUG)
        logging.debug('This message should go to the log file')

--

- Recursos:
	-   [Documentação do módulo logging](https://docs.python.org/3.5/library/logging.html)
    -   [Como usar logging](https://docs.python.org/3.5/howto/logging.html)
    -   [Tornando um expert em logging por 30 minutos](https://youtu.be/24_4WWkSmNo), Gavin M. Roy, PyCon 2013

---

# OS

--
### OS
- `os.listdir` retorna uma lista contendo os nomes das entradas em um diretório dado um caminho:

        import os

        for filename in os.listdir('.'):
            print(filename)

        # saida
        The-standard-library.ipynb
        example.log
        unit-tests.ipynb

--

- `os.path.join` contatena caminhos (de acordo com o OS):

        import os

        home = '/home/user'
        os.path.join(home, 'Downloads')

        # output
        '/home/user/Downloads'

- `os.path.splitext` separa o arquivo dentro da raiz, da extensão:

        os.path.splitext('/home/noam/Downloads/xom.csv')

        # saida
        ('/home/noam/Downloads/xom', '.csv')

--

- `os.path.getsize` retorna o tamanho do arquivo em bytes

        os.path.getsize('The-standard-library.ipynb')

        # saida
        8440



- `os.path.isdir` verifica se o caminho passado é um diretório

        os.path.isdir('The-standard-library.ipynb')

        # saida
        False

---

# Sys e argparse

--
### Sys
- `sys.argv[0]` contêm o nome do arquivo
- `sys.argv[1:]` contêm argumentos (se tiver)

--

#### Exemplo
- Arquivo test.py:

        import sys

        def main(argv):
            a = int(argv[1])
            b = int(argv[2])
            return a + b

        if __name__ == '__main__':
            print(main(sys.argv))

- Linha de comando:

        $ python test.py 5 10
        15

--

### argparse
- Uma biblioteca padrão que soluciona o parsing de argumentos de scripts
- Gera mensagem de ajuda
- Robusto e limpo
- Aprenda mais em [argparse tutorial](https://docs.python.org/3/howto/argparse.html)
--

### Exemplo argparse
- Arquivo test.py:

        import argparse
        parser = argparse.ArgumentParser()
        parser.add_argument("square",
                            help="display a square of a given number",
                            type=int)
        args = parser.parse_args()
        print(args.square**2)

- Linha de comando:

        $ python3 test.py 4
        16

--

###### Exercícios

[The standard library](http://lms.10x.org.il/item/144/)

---

# Subprocess

--

O módulo *subprocess* provêm uma interface consistente para criar e trabalhar com processos
adicionais.

--
### Chamada simples
- Para rodar um comando externo sem interagir com ele, use a função `call()`.

        import subprocess

        subprocess.call(['ls', '-1'], shell=True)

--

- O valor retornado de `call()` é o código de saída do programa.
- O chamador é responsável por interpretar isso para detectar erros.

--
### Manipulando erros

- A função `check_call()` trabalha como `call()`, exceto que o código de saída é checado,
e se isto indicar que um erro aconteceu, então uma exceção `CalledProcessError` é levantado.

        import subprocess

        subprocess.check_call(['false'])

--
### Capturando saída
- Os canais de entrada e saída padrão, para o processo iniciado por `call()` são limitados
para a entrada e saída pai.
- Use `check_output()` para capturar a saída processar tardiamente.

        import subprocess

        output = subprocess.check_output(['ls', '-1'])
        print('Have {} bytes in output'.format(len(output)))
        print(output)

---

# Threading

--

- Um modo simples de usar uma Thread é instanciar isto com uma função alvo e chamar `start()`
para deixá-lo começar a trabalhar.

        import threading

        def worker(num):
            """thread worker function"""
            print('Worker: {}'.format(num))
            return

        for i in range(5):
            t = threading.Thread(target=worker, args=(i,))
            t.start()

--

- Várias vezes nos executamos threads and desejamos que o processo principal possa coletar os
resultados, para fazer isso, nós usamos o método `join`

        import threading, random, time

        def worker(num, sleep):
            print('Worker #{} starts to sleep {} seconds '.format(num, sleep))
            time.sleep(sleep)
            print('Worker #{} woke up '.format(num))
            return

        threads = []
        for i in range(5):
            sleep_time = random.randint(1,5)
            t = threading.Thread(target=worker, args=(i, sleep_time,))
            threads.append(t)
            t.start()

        for t in threads:
            t.join()

---

### Referência
-   [pymotw](https://pymotw.com/3/) - Módulo Python por semana
-   [Documentação do Standard Library](https://docs.python.org/3/library)
