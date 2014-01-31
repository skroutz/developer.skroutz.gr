---
title: Categories | Skroutz API
---

# Categories API

* TOC
{:toc}

## About

Categories are organized in a tree-like structure.  
A product/sku belongs to a leaf category.

## List all categories

<pre class="terminal">
  GET /categories
</pre>

<%= render_recording :categories_index %>

## Retrieve a single category

<pre class="terminal">
  GET /categories/:id
</pre>

<%= render_recording :categories_show %>

## Retrieve the parent of a category

<pre class="terminal">
  GET /categories/:id/parent
</pre>

<%= render_recording :category_parent %>

## Retrieve the root category

<pre class="terminal">
  GET /categories/root
</pre>

<%= render_recording :categories_root %>

## List the children categories of a category

<pre class="terminal">
  GET /categories/:id/children
</pre>

<%= render_recording :children_api_category %>
