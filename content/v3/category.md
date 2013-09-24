---
title: Categories | Skroutz API
---

# Categories API

* TOC
{:toc}

## List categories

    GET /categories

## Get a single category

    GET /categories/:id

## Get the root category

    GET /categories/root

### Response

<%= headers 200 %>
<%= json :single_category %>

## List the skus of a category

    GET /categories/:category_id/skus

### Response
The example response is paginated with `per=1` for the sake of brevity

<%= headers 200 %>
<%= json :category_skus %>
