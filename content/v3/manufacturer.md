---
title: Manufacturers | Skroutz API
---

# Manufacturers API

* TOC
{:toc}

## List manufacturers

<pre class="terminal">
  GET /manufacturers
</pre>

<%= render_recording :manufacturers_index %>

## Retrieve a single manufacturer

<pre class="terminal">
  GET /manufacturers/:id
</pre>

<%= render_recording :manufacturers_show %>

## Retrieve a manufacturer's categories

Set ordering with order_by parameter. Possible values:

    - 'popularity' (default)
    - 'name'

Set ordering direction with order_dir parameter. Possible values:

    - 'asc' (default)
    - 'desc'

<pre class="terminal">
  GET /manufacturers/:id/categories
</pre>

<%= render_recording :manufacturer_categories %>

## Retrieve a manufacturer's skus

Set ordering with order_by parameter. Possible values:

    - 'popularity' (default)
    - 'name'

Set ordering direction with order_dir parameter. Possible values:

    - 'asc' (default)
    - 'desc'

<pre class="terminal">
  GET /manufacturers/:id/skus
</pre>

<%= render_recording :manufacturer_skus %>
