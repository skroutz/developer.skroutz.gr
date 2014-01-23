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
      <td>Public</td>
      <td>application</td>
      <td>All public resources*</td>
    </tr>
    <tr>
      <td>Favorites</td>
      <td>user</td>
      <td>User Favorites</td>
    </tr>
    <tr>
      <td>Notifications</td>
      <td>user</td>
      <td>User notifications</td>
    </tr>
  </tbody>
</table>

## Public Resources
<ul class="public-resources">
  <li><a href="<%= relative_path_to('/v3/category/') %>">Categories</a></li>
  <li><a href="<%= relative_path_to('/v3/sku/') %>">Skus</a></li>
  <li><a href="<%= relative_path_to('/v3/product/') %>">Products</a></li>
  <li><a href="<%= relative_path_to('/v3/shop/') %>">Shops</a></li>
  <li><a href="<%= relative_path_to('/v3/manufacturer/') %>">Manufacturers</a></li>
  <li><a href="<%= relative_path_to('/v3/search/') %>">Search</a></li>
  <li><a href="<%= relative_path_to('/v3/filter_groups/') %>">Filter Groups</a></li>
</ul>
