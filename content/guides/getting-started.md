---
title: Getting Started | Skroutz API
---

# Getting Started

Follow the steps below to build your first succesful application using
Skroutz API.

## Authenticate
Before you perform any api request make sure you read [authentication](../authentication)

Make sure you have installed to your system a tool to perform request to
our API.

Some suggested tools:

<ul class="api-tools">
  <li><a href="http://curl.haxx.se/">curl</a></li>
  <li>
    <a
href="https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm">postman
    </a>
  </li>
  <li><a href="https://github.com/Zorbash/response_mate">response_mate</a></li>
</ul>

## Your First Request

Supposing that you have successfuly obtained a valid access token you can use it to perform requests.
As mentioned in [authentication](../authentication) there are 2 ways to specify your access token.

### Via the oauth_token parameter
You may add the oauth_token parameter obtained above as access_token.

Example Request

<pre class="terminal">
GET https:/api.skroutz.gr/categories/40?oauth_token=your_token
</pre>

### Via Authorization HTTP header
You have to add the following header:

<pre class="terminal">
Authorization: Bearer your_token
</pre>


### Point to the right version
There are 2 version of the Skroutz API:
[v2](http://docs.skroutz.gr/apiv2/) and [v3](<%= relative_path_to('/v3') %>).
[v2](http://docs.skroutz.gr/apiv2/) is to be deprecated at 2014-01-01.

To use v3 you have to explicitly request the API v3 media type in the
`Accept` header:

<pre class="terminal">
application/vnd.skroutz+json;version=3
</pre>

Also you are suggested to specify the `User-Agent` header to match your application's name.
