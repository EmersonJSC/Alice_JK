---
layout: default
lang: pt
---

<div class="is-flex is-flex-direction-row mt-6 mx-6 ">
    <h1 class="title is-flex-grow-1">Aulas</h1>
    <button class="button is-link" id="NovoPodcast">Criar aula</button>
</div>

<div class="mx-6 mt-6">
    {% assign aulas = site.aulas | sort: 'date' | reverse %}
    <div class="columns is-multiline">
        {% for aula in aulas %}
        {% assign nome = aula.name | replace: ".md","" %}
        <div class="column is-one-third">
            <a href='{{ site.baseurl }}{{ aula.url  }}.html' class="card-link">
                <div class="card">
                    <div class="card-image">
                        <figure class="image is-4by3">
                            <img src="{{ site.baseurl }}/thumbs/{{ nome }}.jpg">
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="content my-2">
                            <h1 class="title is-size-4">{{  aula.title }}</h1>
                            <h3 class="subtitle is-size-6">{{ aula.level  }}</h3>
                            <h3 class="is-size-6">{{ aula.description  }}</h3>
                            <div class="is-flex is-flex-direction-row is-align-items-center	">
                                <span class="is-size-6 is-flex-grow-4 blue-text">{{ aula.author  }}</span>
                                <span class="is-size-7">{{ aula.date | date: "%d-%m-%y"}}</span>
                            </div>
                        </div>
                    </div>  
                </div>
            </a>
        </div>
        {% endfor %}
    </div>
</div>