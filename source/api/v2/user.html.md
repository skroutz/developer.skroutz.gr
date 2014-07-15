---
title: User | Skroutz API v2
---
## API Χρήστη ##

### Γενικά ###

Για τις κλήσεις API που αφορούν τον χρήστη χρειάζεται full token.

### Bookmarklists ###
Τα Bookmarklists του χρήστη

**Παράδειγμα**
    /bookmarklists

**Returns:**

 * `bookmarklists`

### Δημιουργία Bookmark ###
Δημιουργία Bookmark

#### Παράμετροι ####
 * `type` - `sku` ή `product` ή `book`
 * `id` - Το `id` του Sku/προϊόντος/βιβλίου

**Παράδειγμα**
    /bookmark/create type=sku id=145

**Returns:**

 * `bookmark`

**Errors:**

 * `not_found` - Δεν βρέθηκε το Sku/Product
 * `bookmark_create` - Υπήρξε κάποιο άλλο πρόβλημα με την δημιουργία


### Διαγραφή Bookmark ###
Διαγραφή Bookmark

#### Παράμετροι ####
 * `type` - `sku` ή `product` ή `book`
 * `id` - Το `id` του Sku ή προϊόντος

**Παράδειγμα**
    /bookmark/destroy type=sku id=145

**Returns:**

 * `success` - true

**Errors:**

 * `not_found` - Δεν βρέθηκε bookmark

