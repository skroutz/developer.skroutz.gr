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

<%= render_recording :children_api_category %>
