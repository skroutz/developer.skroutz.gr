---
title: Shops | Skroutz API
---

# Shops API

* TOC
{:toc}

## List shops

<pre class="terminal">
  GET /shops
</pre>

Name | Type | Description
-----| -----| -----------
`letter` | `String` | `(optional) Filter shops of which the first letter matches the given value`

<%= render_recording :shops_index %>

## Retrieve a single shop

<pre class="terminal">
  GET /shops/:id
</pre>

<%= render_recording :shops_show %>


## Retrieve a shop's reviews

<pre class="terminal">
  GET /shops/:id/reviews
</pre>

<%= render_recording :shop_reviews %>

## Search for shops

<pre class="terminal">
  GET /shops/search
</pre>

Name | Type | Description
-----| -----| -----------
`q` | `String` | `(required) Search with the value of this parameter

<%= render_recording :shop_search %>
