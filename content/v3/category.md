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

<%= render_recording :categories_index %>

## Retrieve a single category

<%= render_recording :categories_show %>

## Retrieve the root category

<%= render_recording :categories_root %>

## List the children categories of a category

<%= render_recording :category_children %>

## List the skus of a category

### Note 
Only leaf categories have skus.  
If you request the skus of a non-leaf category you'll get a `404 Not Found` response.

<%= render_recording :category_skus %>
