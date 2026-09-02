---
layout: default
title: Home
permalink: /
---

{% assign latest = site.posts | first %}
{% if latest %}
<section class="latest">
  <h2>Latest</h2>
  <article class="post-item">
    <h3><a href="{{ site.baseurl }}{{ latest.url }}">{{ latest.title }}</a></h3>
    <time>{{ latest.date | date: '%B %d, %Y' }} · {{ latest.content | number_of_words | divided_by: 200 | at_least: 1 }} minute read</time>
    {% if latest.excerpt %}
    <p class="excerpt">{{ latest.excerpt | strip_html | truncatewords: 40 }} <a href="{{ site.baseurl }}{{ latest.url }}" class="read-more">Keep reading →</a></p>
    {% endif %}
  </article>
</section>
{% endif %}

<hr>

{% assign all_tags = site.posts | map: 'tags' | join: ',' | split: ',' | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
<section class="topics">
  <h2>Topics</h2>
  <p class="tag-list">
    {% for tag in all_tags %}
    <a href="{{ site.baseurl }}/topics/#{{ tag | slugify }}">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
    {% endfor %}
  </p>
</section>
{% endif %}

<hr>

<section class="writing">
  <h2>Writing</h2>
  <ul class="archive">
    {% for post in site.posts %}
    <li>
      <span class="archive-date">{{ post.date | date: '%Y · %m' }}</span>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
    {% endfor %}
  </ul>
</section>
