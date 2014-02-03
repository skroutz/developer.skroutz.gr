---
title: Authentication | Skroutz API
---

<img src="<%= relative_path_to('/assets/images/oauth.png') %>" alt="oauth">

We use [OAuth2.0](http://oauth.net/2/) for authorization.

Make sure you have obtained a valid set of `client_id`, `client_secret`
To get one <a href="mailto:api@skroutz.gr">contact us</a>.

## Application Token
With an application token you can only access resources not associated
to a user. Have a look at related [permissions](<%= relative_path_to('/authentication/permissions') %>).

<a href="http://tools.ietf.org/html/rfc6749#section-4.4" class="emph-link" target="_blank">More info about client-credentials</a>

<pre class="terminal">
POST https://www.skroutz.gr/oauth2/token
</pre>

Name            | Type     | Required | Description
----------------| ---------|----------| -----------
`client_id`     | String | yes      | The client_id supplied by skroutz for the application
`client_secret` | String | yes      | The client_secret supplied by skroutz for the application
`redirect_uri`  | String | yes      | The redirect_uri set for the application
`grant_type`    | String | yes      | client_credentials
`scope`         | String | no        | The space separated set of permissions your application wishes

## User Token

### Get an authorization code
With a "user token" you can access resources associated to a user. Given that the user
permits you to.

<a href="http://tools.ietf.org/html/rfc6749#section-4.1" class="emph-link" target="_blank">More info about authorization code grant</a>

<pre class="terminal">
GET https://www.skroutz.gr/oauth2/authorizations/new
</pre>

Name            | Type     | Required | Description
----------------| ---------|-----------| -----------
`client_id`     | String | yes       | The client_id supplied by skroutz for the application
`redirect_uri`  | String | yes       | The redirect_uri set for the application
`response_type` | String | yes       | The value should be "code"
`scope`         | String | no        | The space separated set of permissions your application wishes

If everything went OK and the user granted your the requested permissions declared in
the scope parameter, you are redirected to:

<pre class="terminal">
http://redirect_uri?code=a_valid_authorization_code
</pre>

### Obtainable permissions
<ul class="permissions">
  <li>public</li>
  <li>favorites</li>
  <li>notifications</li>
</ul>

<a href="<%= relative_path_to('/authentication/permissions') %>" class="emph-link" target="_blank">More info about permissions</a>



### Get an oauth_token


<pre class="terminal">
POST https://www.skroutz.gr/oauth2/token
</pre>

Name            | Type     | Required | Description
----------------| ---------|----------| -----------
`client_id`     | String | yes      | The client_id supplied by skroutz for the application
`client_secret` | String | yes      | The client_secret supplied by skroutz for the application
`redirect_uri`  | String | yes      | The redirect_uri set for the application
`response_type` | String | yes      | The value should be "code"
`grant_type`    | String | yes      | authorization_code
`code`          | String | yes      | authorization code obtained

If everything went OK, the response has the following form:

<pre class="terminal">
{
    "access_token": "your_access_token",
    "refresh_token": "your_refresh_token",
    "token_type": "bearer",
    "expires_in": 3599
}
</pre>

## Using the oauth_token
There are 2 ways to specify your oauth_token for each request you make.
You may pick the one that suits you best.

### Via the oauth_token parameter
You may add the oauth_token parameter obtained above as access_token.

Example Request

<pre class="terminal">
GET http://skroutz.gr/api/categories/40?oauth_token=your_token
</pre>

### Via Authorization HTTP header
You have to add the following header:

<pre class="terminal">
Authorization: Bearer your_token
</pre>
