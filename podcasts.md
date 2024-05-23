---
layout: default
title: Podcasts
lang: pt
---

<div class="is-flex is-flex-direction-row mt-6 mx-6 ">
    <h1 class="title is-flex-grow-1">Podcasts</h1>
    <button class="button is-link" id="NovoPodcast">Criar um novo podcast</button>
</div>


<script>
    const createPodcastButton = document.getElementById('NovoPodcast');

    createPodcastButton.addEventListener('click', function() {
    window.location.href = '{{ site.baseurl }}/assets/extend/podcasts/criarPodcast.html'; // Replace with your actual target URL
    });
</script>