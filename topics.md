---
layout: default
title: Topics
permalink: /topics/
---

<h1 class="page-title">Topics</h1>

{% assign all_tags = site.notes | map: 'tags' | join: ',' | split: ',' | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
<p class="tag-list">
  {% for tag in all_tags %}
  <a href="{{ site.baseurl }}/topics/{{ tag | slugify }}/">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
  {% endfor %}
</p>
{% else %}
<p>No topics yet.</p>
{% endif %}
