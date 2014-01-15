---
title: Shops | Skroutz API
---

# Shops API

* TOC
{:toc}

## List shops

<pre class="terminal">
  /shops
</pre>

Name | Type | Description
-----| -----| -----------
`letter` | `String` | `(optional) Filter shops of which the first letter matches the given value`

<%= render_recording :shops_index %>

## Retrieve a single shop

<pre class="terminal">
  /shops/:id
</pre>

<%= render_recording :shops_show %>
