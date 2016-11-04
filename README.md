# Pycubator

Esse projeto é uma tradução em português do [pycubator.com](pycubator.com), para ser usado como material para mini-cursos e workshops sobre o básico do Python.

Ele possui algumas alterações para tornar o conteúdo mais simples possível.

## O que é

Pycubator (Python Incubator) é uma coleção de slides e exercícios para ensinar Python. Esses slides são usados por um instrutor na sala, mas pode ser usado para qualquer tipo de estudo (individual e em grupo).

Ele utiliza [RevealJS][rjs] para gerar os slides, e estão escritos atualmente com Markdown, e foi usado o [Jupyter notebooks][jn] para exercícios, assim reduz o amontoado de requisitos mínimos para começar a praticar.

Pycubator segue os seguintes princípios:

 - Fale menos, pratique mais
 - Exemplos do mundo real

## Executando localmente
```shell
$ make setup
```

 - Execute o scripte da seguinte forma, para gerar os slides em HTML:

```shell
$ make build
```

 - Roda os comandos abaixo para abrir os slides no seu browser:

```shell
$ make run
```

## Contribuição
 - Os slides estão em `docs/slides` e estão no formato MD, sendo fácil de editar.
 - Os exercícios são arquivos Jupyter notebook e estão em `docs/exercises`.
 - Depois de aplicar as mudanças siga as instruções em [Executando localmente](#executando-localmente)

## Quem contribui com a iniciativa
Versão em inglês
* [Noam Elfanbaum](https://twitter.com/noamelf)
* [Udi Oron](https://twitter.com/nonZero)

Versão em português
* [Gilson Filho](http://gilsondev.in)

---

[![This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License][cc-img]][cc-site]


[cc-img]: https://i.creativecommons.org/l/by-sa/4.0/88x31.png
[cc-site]: http://creativecommons.org/licenses/by-sa/4.0/

[rjs]: https://github.com/hakimel/reveal.js/
[jn]: http://jupyter.org/

