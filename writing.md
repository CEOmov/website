---
layout: default
title: Writing
permalink: /writing/
---

<h1 class="page-title">Writing</h1>

{% assign dated = site.notes | where_exp: "item", "item.date != nil" | sort: 'date' | reverse %}
{% assign undated = site.notes | where_exp: "item", "item.date == nil" %}

<ul class="archive">
  {% for post in undated %}
  <li>
    {% assign t = post.title | default: post.relative_path | default: post.path | split: '/' | last | replace: '.md', '' | replace: '.markdown', '' %}
    <a href="{{ site.baseurl }}{{ post.url }}">{{ t }}</a>
  </li>
  {% endfor %}
  {% for post in dated %}
  <li>
    <span class="archive-date">{{ post.date | date: '%Y · %m' }}</span>
    {% assign t = post.title | default: post.relative_path | default: post.path | split: '/' | last | replace: '.md', '' | replace: '.markdown', '' %}
    <a href="{{ site.baseurl }}{{ post.url }}">{{ t }}</a>
  </li>
  {% endfor %}
</ul>