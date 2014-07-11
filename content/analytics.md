---
title: Overview | Analytics
---

# Analytics

Analytics is a project to measure how users interact with our partners websites.

* toc
{:toc}


## Add the JavaScript reporting snippet

To successfully report your sales insights you have to add the JavaScript snippet and 
declare actions, at least inside the page which informs the user 
that the order is completed (eg. "thank you page").

You may add the snippet just before closing either the `<head>` or `<body>` section.


> **Note:**
> You **have to** replace the `'SA-XXXX-Y'` property with the actual *Shop Account ID* 
you received from us.

<%= render_code_from_file 'analytics/js_snippet' %>

## Register actions for the completed orders and purchased items

You need to at least register the events shown in the examples below:

Below you can see example code that constructs the action declarations.

<%= render_code_from_file 'analytics/order_preprocessing' %>

Your completed order and purchased items could have the following structure:

<%= render_code_from_file 'analytics/order_declaration' %>

Before the closing tag of your `</body>` add the following, for the declaration of actions
to happen:

<%= render_code_from_file 'analytics/order_rendering' %>



## Analytics.js

The source of the tracking script is hosted on [github](https://www.github.com/skroutz/analytics.js).  
The tracking script, registers a new global function named `sa`, and then asynchronously loads the `analytics.js` library onto the page.

The `sa` global function is the main way you interact with the Analytics library. 
It accepts a sequence of parameters, that represent:

 1. **Category**
    *the API category*
 2. **Command**
    *the Command of the API category you be executed*
 3. **Data**
    *the Data to be reported by the Command*

> **Note**
> *Categories* and *Commands* are **case-sensitive**. Be careful when registering new calls for `sa`.

### Settings

#### setAccount
The `setAccount` command initializes the tracker object for your Account. This is a required call, in order to set up correctly the tracking code. Usually it is the first call you will do.

##### Data Parameters:
<table>
    <thead>
        <th>Value</th>
        <th>Type</th>
        <th>Required</th>
        <th>Description</th>
    </thead>
    <tbody>
        <tr>
            <td>shop_account_id</td>
            <td>String</td>
            <td><strong>Yes</strong></td>
            <td>The unique <em>Shop Account ID</em> that you received from us. (e.g. SA-XXXX-Y)</td>
        </tr>
    </tbody>
</table>


### Ecommerce

#### addOrder
The `addOrder` command creates a shopping cart object.

##### Data Parameters:
<table>
    <thead>
        <th>Value</th>
        <th>Type</th>
        <th>Required</th>
        <th>Description</th>
    </thead>
    <tbody>
        <tr>
            <td>order_id</td>
            <td>String</td>
            <td><strong>Yes</strong></td>
            <td>The Order ID that produced and stored at your e-shop to identify the transaction. This id is what links items to the orders to which they belong. (e.g. 123456)</td>
        </tr>
        <tr>
            <td>revenue</td>
            <td>String</td>
            <td>No</td>
            <td>The total revenue or grand total of the order (e.g. 120.99). This value may include shipping, tax costs, or other adjustments to total revenue that you want to include as part of your revenue calculations.</td>
        </tr>
        <tr>
            <td>shipping</td>
            <td>String</td>
            <td>No</td>
            <td>The total shipping cost of the order. (e.g. 5.45)</td>
        </tr>
        <tr>
            <td>tax</td>
            <td>String</td>
            <td>No</td>
            <td>The total tax of the order. (e.g. 10.50)</td>
        </tr>
    </tbody>
</table>

##### Example
<%= render_code "
sa('ecommerce', 'addOrder', {
  'order_id': '123456',  // Order ID. Required.
  'revenue': '120.99',   // Grand Total.
  'shipping': '5.45',    // Total Shipping Cost.
  'tax': '10.50'         // Total Tax.
});
", 'javascript' %>

#### addItem
The `addItem` command adds a new item to the shopping cart object.

##### Data Parameters:
<table>
    <thead>
        <th>Value</th>
        <th>Type</th>
        <th>Required</th>
        <th>Description</th>
    </thead>
    <tbody>
        <tr>
            <td>order_id</td>
            <td>String</td>
            <td><strong>Yes</strong></td>
            <td>The Order ID that produced and stored at your e-shop to identify the transaction. This id is what links items to the orders to which they belong. (e.g. 123456)</td>
        </tr>
        <tr>
            <td>product_id</td>
            <td>String</td>
            <td><strong>Yes</strong></td>
            <td>The id of the product as stored at your e-shop. (e.g. 987)</td>
        </tr>
        <tr>
            <td>price</td>
            <td>String</td>
            <td><strong>Yes</strong></td>
            <td>The individual, unit, final price for each item. (e.g. 10.50)</td>
        </tr>
        <tr>
            <td>quantity</td>
            <td>String</td>
            <td><strong>Yes</strong></td>
            <td>The number of units purchased in the order. (e.g. 4)</td>
        </tr>
    </tbody>
</table>

##### Example
<%= render_code "
sa('ecommerce', 'addItem',{
    'order_id': '123456',  // Order ID. Required.
    'product_id': '987',   // Product ID. Required.
    'price': '10.50',      // Price per Unit. Required.
    'quantity': '4'        // Quantity of Items. Required.
});", 'javascript' %>

## FAQ

1. Will adding this script affect the performance of my website?  

<p>
No, we've put a lot of effort, and used some of the most cutting edge techniques to make sure 
that our script runs sandboxed without affecting the experience of your users.
</p>

2. What kind of info is emitted from this script?

<p>
We take user privacy seriously. The data retained by our service remain anonymous, and are 
neither exposed or sold to 3rd parties. We only report what you agree to be reported.
</p>

3. Where can i view the source of this script?

<p>
The script is open sourced on <a href="https://www.github.com/skroutz/analytics.js">github</a>.
Feel free to create issues there, or even contribute.
</p>

4. Are there any dependencies?

<p>
No. The script is self-sufficient.
</p>

5. What about browser support?

<p>
The script is tested to work on all modern browsers. [Internet Explorer > 6, Chrome, Firefox, Opera, Safari]
</p>