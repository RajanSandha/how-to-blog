---
layout: default
title: Technology How-To Guides
description: Practical step-by-step guides for technology-related tasks
permalink: /categories/technology/
---

# Technology How-To Guides

Find practical step-by-step guides to help you navigate common technology challenges.

{% assign tech_posts = site.posts | where_exp: "post", "post.categories contains 'technology'" %}

<div class="posts-list">
  {% for post in tech_posts %}
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
  
  {% if tech_posts.size == 0 %}
    <p>No guides available in this category yet. Check back soon!</p>
  {% endif %}
</div> 