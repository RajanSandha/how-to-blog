---
layout: default
title: Design How-To Guides
description: Tips, tricks, and tutorials for digital design and creativity
permalink: /categories/design/
---

# Design How-To Guides

Find practical step-by-step guides to help you create better designs and enhance your creative skills.

{% assign design_posts = site.posts | where_exp: "post", "post.categories contains 'design'" %}

<div class="posts-list">
  {% for post in design_posts %}
    <article class="post">
      <h2 class="post-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h2>
      <div class="post-meta">
        <span class="post-date">{{ post.date | date: "%B %d, %Y" }}</span>
      </div>
      <div class="post-excerpt">
        {{ post.excerpt }}
      </div>
      <a href="{{ post.url | relative_url }}" class="read-more">Read the full guide &raquo;</a>
    </article>
  {% endfor %}
  
  {% if design_posts.size == 0 %}
    <p>No guides available in this category yet. Check back soon!</p>
  {% endif %}
</div> 