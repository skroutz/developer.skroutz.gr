---
title: User Notification | Skroutz API
---

# User Notification

* TOC
{:toc}

To access any of the following endpoints a valid user access_token is required.

## About

Notifications are events (price changes of favorite products,
subscribed discussion messages etc).

## List favorites 

<pre class="terminal">
  /notifications
</pre>

<%= render_recording :notifications_index %>

## Retrieve a single favorite 

<pre class="terminal">
  /notifications/:id
</pre>

<%= render_recording :notifications_show %>
