---
layout: default
title: About
lang: pt
---

<h1 class="mt-5">Sobre</h1>
<h2></h2>
## Como criar página de autores:


O nome do autor é definido pelo nome do arquivo .md do mesmo e sua foto é definida com o mesmo nome .jpg. 

Um autor deve ter:
``` liquid
---
github: https://github.com/flschiavoni
lattes: http://lattes.cnpq.br/1259591090948385
---
```

## Como criar página de aulas:

O nome da aula é definido pelo nome do arquivo .md da mesma, caso a aula tenha arquivos, os mesmos devem estar em um arquivo zip com o mesmo nome e o vídeo da aula em um arquivo mkv com o mesmo nome. Exemplo:

	- Aula Teste para o site.md
	- Aula Teste para o site.zip
	- Aula Teste para o site.mkv 

Uma aula deve ter:

``` liquid
---
author: Flávio Luiz Schiavoni
description: Introdução ao Sooper Looper
date: 2023/12/09
software: [Sooper Looper]
level: Básico | Intermediário | Avançado
---
```

