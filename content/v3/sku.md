---
title: Sku | Skroutz API
---

# Sku API

* TOC
{:toc}

## About

A SKU (Stock Keeping Unit) is an aggregation of products.

## List SKUs

<%= render_recording :skus_index %>

## Retrieve a single SKU

<%= render_recording :skus_show %>

## Retrieve a SKU's products

<%= render_recording :skus_products %>

## Filtering

You have to specify a category in order to perform filtering.
You may supply the optional parameter `include_meta[]=available_filters`
to get meta information about the filters that can be applied.

Example

<%= render_recording :category_skus_with_available_filters %>
As you can see above the available_filters object contains two objects
(filters, manufacturers) each of which has as keys the ids of the
entities that can be applied and as values the number of skus that match
the filter/manufacturer.

### By category

<%= render_recording :category_skus, only: [:request, :description] %>

### By manufacturers

<%= render_recording :category_skus_manufacturers, only: [:request, :description] %>

### By filters

<%= render_recording :category_skus_filters, only: [:request, :description] %>
