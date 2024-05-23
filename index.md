---
layout: default
---

<div class="is-flex is-flex-direction-row home-greeting is-justify-content-end px-6">
    <div class="is-flex is-justify-content-center is-flex-direction-column">
        <h1 class="home-title">Bem-vindo ao nosso espaço educacional aberto!</h1>
        <p class="home-text">
            <br > Aqui você encontrará uma comunidade colaborativa onde o conhecimento é compartilhado livremente. <br > Explore cursos, aulas e materiais educativos criados por diversos colaboradores. Sinta-se à vontade para contribuir, modificar e expandir o aprendizado coletivo. <br> Juntos, vamos construir uma plataforma educacional inclusiva e dinâmica!
        </p>
    </div>
    <div class="home-image is-flex">
        <img
            class="about-image"
            src="{{ site.baseurl }}/assets/images/about-image.png"
        />
    </div>
</div>

<h1 class="home-title px-6" >Confira nossos cursos</h1>
{% assign cursos = site.cursos | sort: 'date' %}
<ul class="aula px-6">
    {% for curso in cursos %}
    {% assign nome = curso.name | replace: ".md","" %}
    <li>
        <a href='{{ site.baseurl }}{{ curso.url }}.html' >
            <div class="card mx-1 my-1">
                <div class="card-content">
                    <div class="content my-2">
                        <h1 class="title is-size-4">{{ nome }}</h1>
                    </div>
                </div>  
            </div>
        </a>
    </li>
    {% endfor %}

