---
layout: default
lang: pt
---
<div class="is-flex is-flex-direction-row mt-6 mx-6 ">
    <h1 class="title is-flex-grow-1">Cursos</h1>
    <button class="button is-link" id="NovoPodcast">Criar curso</button>
</div>

<div class="mx-6 mt-6">
{% assign cursos = site.cursos | sort: 'date' | reverse %}
    <div class="columns is-multiline">
        {% for curso in cursos %}
        {% assign nome = curso.name | replace: ".md","" %}
        <div class="column is-one-third">
            <a href='{{ site.baseurl }}{{ curso.url  }}.html' class="card-link">
                <div class="card">
                    <div class="card-image">
                        <figure class="image is-4by3">
                            <img src="{{ site.baseurl }}/thumbs/{{ nome }}.jpg">
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="content my-2">
                            <h1 class="title is-size-4">{{  curso.title }}</h1>
                            {% for aula in curso.aulas %}
                            <span class="tag is-link">{{ aula  }}</span>
                            {% endfor %}
                            <h3 class="subtitle is-size-6">{{ curso.description  }}</h3>
                            <h3 class="subtitle is-size-6">{{ curso.author  }}</h3>
                        </div>
                    </div>  
                </div>
            </a>
        </div>
        {% endfor %}
    </div>
</div>
