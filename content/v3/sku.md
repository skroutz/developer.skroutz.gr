---
title: SKU | Skroutz API
---

# SKU API

* TOC
{:toc}

## About

A SKU (Stock Keeping Unit) is an aggregation of products.  
[Linked resources](<%= relative_path_to('/v3') %>#linked-resources): [product](<%= relative_path_to('/v3/product') %>)

<%= render_recording :skus_index %>

## List SKUs of specific category

<pre class="terminal">
  GET /categories/:category_id/skus
</pre>

<%= render_recording :category_skus %>

## Retrieve a single SKU

<pre class="terminal">
  GET /skus/:id
</pre>

<%= render_recording :skus_show %>

## Retrieve similar SKUs

<pre class="terminal">
  GET /skus/:id/similar
</pre>

<%= render_recording :skus_similar %>

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

## Retrieve a SKU's specifications

Sku specifications can be retrieved with the following request. "values"
attribute specifies the values this SKU has for the specification
(more than one if applicable). Group can be included/embedded and represents
a logical grouping of specifications. It can be used to show specifications in
groups. No pagination is used in this endpoint.

<pre class="terminal">
  GET /skus/:id/specifications?include=group
</pre>

<%= render_recording :sku_specifications %>

## Filtering

You have to specify a category in order to perform filtering.  
You may supply the optional parameter `include_meta[]=available_filters`
to get meta information about the filters that can be applied.


### By search keyword 

Name | Type | Description
-----| -----| -----------
`q` | `String` | The keyword to search by 

<%= render_recording :category_skus_search %>

### By manufacturers

Name | Type | Description
-----| -----| -----------
`manufacturer_ids` | `Array` | The ids of the manufacturers of the SKUs

<%= render_recording :category_skus_manufacturers %>

### By filters

Name | Type | Description
-----| -----| -----------
`filter_ids` | `Array` | The ids of the filters to be applied on the SKUs

<%= render_recording :category_skus_filters %>

### Meta
You may choose to include extra meta information using the following parameters:

Name | Type | Description
-----| -----| -----------
`include_meta` | `Array` | `Extra meta info to be included in the response`

<%= render_recording :category_skus_with_available_filters %>
As you can see above the available_filters object contains two objects
(filters, manufacturers) each of which has as keys the ids of the
entities that can be applied and as values the number of skus that match
the filter/manufacturer.
