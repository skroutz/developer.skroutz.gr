We use [OAuth2.0](http://oauth.net/2/) for authorization.

Make sure you have obtained a valid set of `client_id`, `client_secret`
To get one [contact](api@skroutz.gr)

## Get an authorization code
<div class="terminal">
https://www.skroutz.gr/oauth2/authorizations/new?client_id=your_client_id&redirect_uri=your_redirect_uri&response_type=code&scope=some_scope
</div>

Name            | Type     | Description
----------------| ---------| -----------
`client_id`     | `String` | `The client_id supplied by skroutz for the application`
`redirect_uri`  | `String` | `The redirect_uri set for the application`
`response_type` | `String` | `The value should be "code"`
`scope`         | `String` | `The space separated set of permissions your application wishes` 

### Obtainable permissions
* public 
* favorites
* notifications
## Get an oauth_token
