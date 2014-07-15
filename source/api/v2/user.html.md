---
title: Χρήστης | Skroutz API v2
---
# API Χρήστη

* toc
{:toc}

## Γενικά

Για τις κλήσεις API που αφορούν τον χρήστη χρειάζεται full token.

## Bookmarklists
Τα Bookmarklists του χρήστη

**Παράδειγμα**

<pre class="terminal">
GET /bookmarklists
</pre>

**Returns:**

 * `bookmarklists`

## Δημιουργία Bookmark

### Παράμετροι
 * `type` - `sku` ή `product` ή `book`
 * `id` - Το `id` του Sku/προϊόντος/βιβλίου

**Παράδειγμα**

<pre class="terminal">
GET /bookmark/create&type=sku&id=145
</pre>

**Returns:**

 * `bookmark`

**Errors:**

 * `not_found` - Δεν βρέθηκε το Sku/Product
 * `bookmark_create` - Υπήρξε κάποιο άλλο πρόβλημα με την δημιουργία


## Διαγραφή Bookmark

### Παράμετροι
 * `type` - `sku` ή `product` ή `book`
 * `id` - Το `id` του Sku ή προϊόντος

**Παράδειγμα**

<pre class="terminal">
GET /bookmark/destroy&type=sku&id=145
</pre>

**Returns:**

 * `success` - true

**Errors:**

 * `not_found` - Δεν βρέθηκε bookmark

