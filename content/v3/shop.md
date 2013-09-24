---
title: Shops | Skroutz API
---

# Shops API

* TOC
{:toc}

## List shops 

    GET /shops

### Parameters

letter
: _Optional_ **string** Filter shops of which the first letter matches
the given value

### Response

<%= headers 200 %>
<%= json :shops_letter %>

## Get a single shop

    GET /shops/:id

### Response

<%= headers 200 %>
<%= json :single_category %>
