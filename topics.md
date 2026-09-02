---
layout: default
title: Topics
permalink: /topics
---

# Topics

{% assign all_tags = site.posts | map: 'tags' | join: ',' | split: ',' | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
{% for tag in all_tags %}
<section class="topic-section" id="{{ tag | slugify }}">
  <h2>{{ tag }}</h2>
  <ul>
    {% for post in site.posts %}
    {% if post.tags contains tag %}
    <li><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endif %}
    {% endfor %}
  </ul>
</section>
{% endfor %}
{% else %}
<p>No topics yet.</p>
{% endif %}
