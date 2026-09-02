---
layout: page
title: Home
permalink: /
---

<section class="home-latest">
   <h2>Latest</h2>
   {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
   {% for note in recent_notes limit: 10 %}
      {% unless note.title == "Essays" or note.title == "About me" or note.title == "Index" %}
      <div class="post-item">
         <span class="post-date">{{ note.last_modified_at | date: "%B %d, %Y" }}</span>
         <h3><a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a></h3>
      </div>
      {% endunless %}
   {% endfor %}
</section>

{% assign all_tags = site.notes | map: "tags" | join: "," | split: "," | uniq | sort %}
{% if all_tags.size > 0 and all_tags[0] != empty %}
<section class="home-topics">
   <h2>Topics</h2>
   <div class="topics-list">
      {% for tag in all_tags %}
      <a href="{{ site.baseurl }}/topics#{{ tag | slugify }}" class="topic-tag">{{ tag }}</a>
      {% endfor %}
   </div>
</section>
{% endif %}
