---
title: Sku | Skroutz API
---

# Sku API

* TOC
{:toc}

## About

A SKU (Stock Keeping Unit) is an aggregation of products.  
[Linked resources](<%= relative_path_to('/v3') %>#linked-resources): [product](<%= relative_path_to('/v3/product') %>)

## List SKUs

<pre class="terminal">
  GET /skus
</pre>

<%= render_recording :skus_index %>

## List SKUS of specific category

<pre class="terminal">
  GET /categories/:category_id/skus
</pre>

<%= render_recording :category_skus %>

## Retrieve a single SKU

<pre class="terminal">
  GET /skus/:id
</pre>

<%= render_recording :skus_show %>

## Retrieve a SKU's products

<pre class="terminal">
  GET /skus/:id/products
</pre>

<%= render_recording :skus_products %>

## Retrieve a SKU's reviews

<pre class="terminal">
  GET /skus/:id/reviews
</pre>

<%= render_recording :sku_reviews %>

## Filtering

You have to specify a category in order to perform filtering.  
You may supply the optional parameter `include_meta[]=available_filters`
to get meta information about the filters that can be applied.

## Meta
You may choose to include extra meta information using the following parameters:

Name | Type | Description
-----| -----| -----------
`include_meta` | `Array` | `Extra meta info to be included in the response`

<%= render_recording :category_skus_with_available_filters %>
As you can see above the available_filters object contains two objects
(filters, manufacturers) each of which has as keys the ids of the
entities that can be applied and as values the number of skus that match
the filter/manufacturer.

### By manufacturers

Name | Type | Description
-----| -----| -----------
`manufacturer_ids` | `Array` | The ids of the manufacturers of the skus

<%= render_recording :category_skus_manufacturers %>

### By filters

Name | Type | Description
-----| -----| -----------
`filter_ids` | `Array` | The ids of the filters to be applied on the skus

<%= render_recording :category_skus_filters %>
