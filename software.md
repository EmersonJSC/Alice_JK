---
layout: default
lang: pt
---

<div class="is-flex is-flex-direction-row mt-6 mx-6 ">
    <h1 class="title is-flex-grow-1">Software</h1>
    <button class="button is-link" id="NovoPodcast">Cadastrar software</button>
</div>

<div class="mx-6 mt-6">
  <div id="archives">
    <div class="archive-group is-flex is-justify-content-center">
  {% for software in site.software %}
    {% assign name = software.name | replace: ".md", "" %}
        <a href='{{ site.baseurl }}{{ software.url  }}.html' class="mx-2" >
          <div class="tags are-large">
            <h1 class="title is-size-4 tag is-link">{{ name }}</h1>
          </div>
        </a>  
  {% endfor %} 
    </div>
  </div>
</div>
