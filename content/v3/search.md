---
title: Search | Skroutz API
---

# Search

* TOC
{:toc}

## Search

<pre class="terminal">
  GET /search
</pre>

Name | Type | Description
-----| -----| -----------
`q` | `String` | `The keyphrase to search by`

The main response type is a collection of 
[Categories](<%= relative_path_to('/v3/category')  %>).

Any other resources matching the specified query are generally of lesser
importance.

Our suggestion system may provide alternative search queries in the
`alternatives` key of `meta`.

Any of those alternatives having a flag `important` set to `true`, hint
the client to perform a search with the alternative query instead. 

There may also exist matches of different resources under the key `strong_matches`.  
Currently there may be up-to one of each of the following resources:

* [Category](<%= relative_path_to('/v3/category') %>)
* [SKU](<%= relative_path_to('/v3/sku') %>)
* [Manufacturer](<%= relative_path_to('/v3/manufacturer') %>)
* [Shop](<%= relative_path_to('/v3/shop') %>)

### Query with less than 2 characters

<%= render_recording :search_invalid %>

### Query that doesn't match anything

<%= render_recording :search_no_results %>

### Query with strong insights for a specific category

<%= render_recording :search_category_match %>

### Query matching many categories

<%= render_recording :search_category_facade %>

### Query with strong insights for a specific manufacturer

<%= render_recording :search_manufacturer_match %>

### Query with more results when written in another language

<%= render_recording :search_latin_mapping %>

### Probably misspelled query

<%= render_recording :search_spelling %>

### Query with strong insights for a specific SKU

<%= render_recording :search_sku_match %>

### Query that matches SKUS from a single category

<%= render_recording :search_skus_match %> 

### Query parts of which have results

<%= render_recording :search_drop %>

## Autocomplete

<pre class="terminal">
  GET /autocomplete
</pre>

Name | Type      | Description
-----| ---------| ------------
 `q` | `String` | `The term to be autocompleted`

<%= render_recording :autocomplete %>
