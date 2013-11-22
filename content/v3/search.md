---
title: Search | Skroutz API
---

# Search API

* TOC
{:toc}

## Search

### Parameters
q
: _Required_ **string** The keyphrase to search by

### Case `invalid` *The query was invalid. Eg. less than 2 characters*

<%= render_recording :search_invalid %>

### Case `no_results` *Nothing seems to match the specified query*

<%= render_recording :search_no_results %>

### Case `category_match` *When your query matched a category*


<%= render_recording :search_category_match %>

### Case `category_facade` *When your query matched many categories*

<%= render_recording :search_category_facade %>

### Case `manufacturer_match` *Your query matched one of our manufacturers
exactly*

<%= render_recording :search_manufacturer_match %>

### Case `latin_mapping` *Your query has an exact match in its latin form* 

Note: You will have to follow one or more 302 redirections

<%= render_recording :search_latin_mapping %>

### Case `sku_match` *Your query matches exactly one of our skus*

<%= render_recording :search_sku_match %>

### Case `category_skus_match` *Your query matches skus from a category*

<%= render_recording :search_skus_match %> 

### Case `drop` *Your query has no results but the proposals in the
response have*

<%= render_recording :search_drop %>

## Autocomplete


### Parameters
q  
: **Required** **string** The keyphrase to search by

<%= render_recording :autocomplete %>
