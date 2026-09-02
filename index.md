---
layout: default
title: Home
permalink: /
---

{% assign dated = site.notes | where_exp: "item", "item.date != nil" | sort: 'date' | reverse %}
{% assign undated = site.notes | where_exp: "item", "item.date == nil" %}

{% if undated.size > 0 %}
  {% assign latest = undated | first %}
{% else %}
  {% assign latest = dated | first %}
{% endif %}

{% if latest %}
<section class="latest">
  <h2>Latest</h2>
  <article class="post-item">
    {% assign latest_title = latest.title | default: latest.relative_path | default: latest.path | split: '/' | last | replace: '.md', '' | replace: '.markdown', '' %}
    <h3><a href="{{ site.baseurl }}{{ latest.url }}">{{ latest_title }}</a></h3>
    {% if latest.date %}
    <time>{{ latest.date | date: '%B %d, %Y' }} · {{ latest.content | number_of_words | divided_by: 200 | at_least: 1 }} minute read</time>
    {% endif %}
    {% if latest.excerpt %}
    <p class="excerpt">{{ latest.excerpt | strip_html | truncatewords: 12 }}</p>
    <p><a href="{{ site.baseurl }}{{ latest.url }}" class="read-more">Keep reading →</a></p>
    {% endif %}
  </article>
</section>
{% endif %}

<hr>

{% assign all_tags = site.notes | map: 'tags' | join: ',' | split: ',' | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
<section class="topics">
  <h2><a href="{{ site.baseurl }}/topics/">Topics</a></h2>
  <p class="tag-list">
    {% for tag in all_tags %}
    <a href="{{ site.baseurl }}/topics/{{ tag | slugify }}/">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
    {% endfor %}
  </p>
</section>
{% endif %}

<hr>

<section class="writing">
  <h2><a href="{{ site.baseurl }}/writing/">Writing</a></h2>
  <ul class="archive">
    {% for post in dated %}
    <li>
      <span class="archive-date">{{ post.date | date: '%Y · %m' }}</span>
      {% assign t = post.title | default: post.relative_path | default: post.path | split: '/' | last | replace: '.md', '' | replace: '.markdown', '' %}
      <a href="{{ site.baseurl }}{{ post.url }}">{{ t }}</a>
    </li>
    {% endfor %}
    {% for post in undated %}
    <li>
      {% assign t = post.title | default: post.relative_path | default: post.path | split: '/' | last | replace: '.md', '' | replace: '.markdown', '' %}
      <a href="{{ site.baseurl }}{{ post.url }}">{{ t }}</a>
    </li>
    {% endfor %}
  </ul>
</section>
