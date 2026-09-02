---
layout: page
title: Topics
permalink: /topics
---

{% assign all_tags = site.notes | map: 'tags' | join: ',' | split: ',' | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
<div class="topics-page">
   {% for tag in all_tags %}
   <section class="topic-section" id="{{ tag | slugify }}">
      <h2>{{ tag }}</h2>
      <ul>
         {% for note in site.notes %}
         {% if note.tags contains tag %}
         <li><a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a></li>
         {% endif %}
         {% endfor %}
      </ul>
   </section>
   {% endfor %}
</div>
{% else %}
<p>No topics yet.</p>
{% endif %}
