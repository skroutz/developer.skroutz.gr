---
title: Sku | Skroutz API
---

# Sku API

* TOC
{:toc}

## About

A SKU (Stock Keeping Unit) is an aggregation of products.  
Linked resources: [product](<%= relative_path_to('/v3/product') %>)

## List SKUs

<pre class="terminal">
  /skus
</pre>

<%= render_recording :skus_index %>

## Retrieve a single SKU

<pre class="terminal">
  /skus/:id
</pre>

<%= render_recording :skus_show %>

## Retrieve a SKU's products

<pre class="terminal">
  /skus/:id/products
</pre>

<%= render_recording :skus_products %>

## Filtering

You have to specify a category in order to perform filtering.  
You may supply the optional parameter `include_meta[]=available_filters`
to get meta information about the filters that can be applied.

### Include available filters

Name | Type | Description
-----| -----| -----------
`include_meta` | `Array` | `Extra meta info to be included in the response`

<%= render_recording :category_skus_with_available_filters %>
As you can see above the available_filters object contains two objects
(filters, manufacturers) each of which has as keys the ids of the
entities that can be applied and as values the number of skus that match
the filter/manufacturer.

### By category

<pre class="terminal">
  /categories/:category_id/skus
</pre>

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
