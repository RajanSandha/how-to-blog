---
layout: default
title: Programming How-To Guides
description: Coding tutorials and development guides for programmers of all levels
permalink: /categories/programming/
---

# Programming How-To Guides

Find practical step-by-step guides to help you learn programming concepts and solve coding challenges.

{% assign programming_posts = site.posts | where_exp: "post", "post.categories contains 'programming'" %}

<div class="posts-list">
  {% for post in programming_posts %}
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
  
  {% if programming_posts.size == 0 %}
    <p>No guides available in this category yet. Check back soon!</p>
  {% endif %}
</div> 