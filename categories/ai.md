---
layout: default
title: AI How-To Guides
description: Step-by-step tutorials for working with artificial intelligence tools and technologies
permalink: /categories/ai/
---

# AI How-To Guides

Find practical step-by-step guides to help you get started with AI tools and technologies.

{% assign ai_posts = site.posts | where_exp: "post", "post.categories contains 'ai'" %}

<div class="posts-list">
  {% for post in ai_posts %}
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
  
  {% if ai_posts.size == 0 %}
    <p>No guides available in this category yet. Check back soon!</p>
  {% endif %}
</div> 