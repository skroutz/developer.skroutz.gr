---
title: Authentication - Permissions | Skroutz API
---

# Permissions

A representations of the permissions granted to your app by Skroutz and a User.

<table>
  <thead>
    <tr>
      <th>Code</th>
      <th>Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>public</td>
      <td>application</td>
      <td>All public resources*</td>
    </tr>
    <tr>
      <td>favorites</td>
      <td>user</td>
      <td>User <a href="<%= relative_path_to('/v3/favorites/') %>">Favorites</a></td>
    </tr>
    <tr>
      <td>notifications</td>
      <td>user</td>
      <td>User <a href="<%= relative_path_to('/v3/notifications/') %>">notifications</a></td>
    </tr>
  </tbody>
</table>

For more info about permission types check 
[authentication flows](<%= relative_path_to('/authentication/flows') %>).

## Public Resources
Having obtained the public permission you can access the following resources:

<ul class="public-resources">
  <li><a href="<%= relative_path_to('/v3/category/') %>">Categories</a></li>
  <li><a href="<%= relative_path_to('/v3/sku/') %>">Skus</a></li>
  <li><a href="<%= relative_path_to('/v3/product/') %>">Products</a></li>
  <li><a href="<%= relative_path_to('/v3/shop/') %>">Shops</a></li>
  <li><a href="<%= relative_path_to('/v3/manufacturer/') %>">Manufacturers</a></li>
  <li><a href="<%= relative_path_to('/v3/search/') %>">Search</a></li>
  <li><a href="<%= relative_path_to('/v3/filter_groups/') %>">Filter Groups</a></li>
</ul>

## User Resources
These permissions require that you have explicitly requested them using
the scope param [see here](<%= relative_path_to('/guides/authentication') %>)
The user will have to consent to grant any of those permissions.  
You __must__ not share these data to 3rd parties. 

<ul class="private-resources">
  <li><a href="<%= relative_path_to('/v3/favorites/') %>">Favorites</a></li>
  <li><a href="<%= relative_path_to('/v3/notifications/') %>">Notifications</a></li>
</ul>
