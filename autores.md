---
layout: default
lang: pt
---
<div class="is-flex is-flex-direction-row mt-6 mx-6 ">
    <h1 class="title is-flex-grow-1">Autores</h1>
    <button class="button is-link" id="NovoPodcast">Cadastrar como autor</button>
</div>

<div class="mx-6 mt-6">
    {% assign autores = site.autores | sort: 'name' %}
    <div class="columns is-multiline">
        {% for autor in autores %}
        {% assign nome = autor.name | replace: ".md","" %}
        <div class="column is-one-third">
            <a href='{{ site.baseurl }}{{ autor.url }}.html' class="card-link">
                <div class="card">
                    <div class="card-image">
                        <figure class="image is-square">
                            <img src="{{ site.baseurl }}/autores/{{ nome }}.jpg">
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="content my-2">
                            <h1 class="title is-size-4">{{ nome }}</h1>
                        </div>
                    </div>  
                </div>
            </a>
        </div>
        {% endfor %}
    </div>
</div>
