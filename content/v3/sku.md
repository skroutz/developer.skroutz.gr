---
title: Sku | Skroutz API
---

# Sku API

* TOC
{:toc}

## About

A SKU (Stock Keeping Unit) is an aggregation of products.

## List SKUs

      GET /skus

<%= render_recording :skus_index %>

## Get a single SKU

      GET /sku/:id

<%= render_recording :skus_show %>

## Get a SKU's products

      GET /sku/:id/products

<%= render_recording :skus_products %>
