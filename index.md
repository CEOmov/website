---
layout: default
title: Home
permalink: /
---

<section class="latest">
  <h2>Latest</h2>
  {% for post in site.posts %}
  <article class="post-item">
    <time>{{ post.date | date: '%B %d, %Y' }} · {{ post.content | number_of_words | divided_by: 200 | at_least: 1 }} min read</time>
    <h3><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h3>
    {% if post.excerpt %}
    <p>{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
    <a href="{{ site.baseurl }}{{ post.url }}" class="read-more">Keep reading →</a>
    {% endif %}
  </article>
  {% endfor %}
</section>

{% assign all_tags = site.posts | map: 'tags' | join: ',' | split: ',' | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
<section class="topics">
  <h2>Topics</h2>
  <div class="tags-list">
    {% for tag in all_tags %}
    <a href="{{ site.baseurl }}/topics#{{ tag | slugify }}" class="tag">{{ tag }}</a>
    {% endfor %}
  </div>
</section>
{% endif %}
