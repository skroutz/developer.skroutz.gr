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

<%= render_recording :shops %>

## Get a single shop

    GET /shops/:id

<%= render_recording :single_shop %>
