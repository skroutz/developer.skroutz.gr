---
title: Search | Skroutz API
---

# Search API

* TOC
{:toc}

## Search by barcode

    GET /barcode_search

### Parameters

q
: _Required_ **string** The barcode value to search by

### Response

<%= headers 200 %>
<%= json :single_sku %>
