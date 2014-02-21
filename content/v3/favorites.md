---
title: User Favorite | Skroutz API
---

# User Favorite

<small>Note: To access any of the following endpoints a valid access_token is required.</small>

* TOC
{:toc}


## About

User may pick one or more SKUs as favorites

## List favorites

<pre class="terminal">
  /favorites
</pre>

<%= render_recording :favorites_index %>

## Retrieve a single favorite

<pre class="terminal">
  /favorites/:id
</pre>

<%= render_recording :favorites_show %>
