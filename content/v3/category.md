---
title: Categories | Skroutz API
---

# Categories API

* TOC
{:toc}

## About

Categories are organized in a tree-like structure.  
A product/sku belongs to a leaf category.

## List categories

    GET /categories

## Get a single category

    GET /categories/:id

### Response

<%= headers 200 %>
<%= json :single_category %>

## Get the root category

    GET /categories/root


## List the skus of a category

    GET /categories/:category_id/skus

### Note 
Only leaf categories have skus.  
If you request the skus of a non-leaf category you'll get a `404 Not Found` response.

### Response
The example response is paginated with `per=1` for the sake of brevity

<%= headers 200 %>
<%= json :category_skus %>
