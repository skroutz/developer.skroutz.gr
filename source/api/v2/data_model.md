---
layout: default
title: Μοντέλο Δεδομένων
---

## Μοντέλων Δεδομένων ##

### Category ###

Η κατηγοριοποίηση του Skroutz.gr αποτελείται από ένα δέντρο περίπου
800 κατηγορίων. Τα προιόντα και τα Skus ανήκουν **υποχρεωτικά** σε κάποια
τελική κατηγορία, μια κατηγορία δηλαδή χωρίς υποκατηγορίες.

Υπάρχουν δύο τύποι κατηγοριών, αυτές που περιέχουν Sku και αυτές που
περιέχουν αταξινόμητα προιόντα.

Αποτελείται από τα εξής πεδία:

* `id`
* `name`
* `children_count`
* `family_id`
* `family_name`
* `image_url`

### Product ###

Το Product αναφέρεται σε ένα συγκεκριμένο προϊόν κάποιου
καταστήματος. Η ομάδα του Skroutz.gr στις περισσότερες δημοφιλείς
κατηγορίες ομαδoποιεί ίδια προιόντα που υπάρχουν σε διαφορετικά
καταστήματα. Η ομαδοποίηση αυτή ονομάζεται Sku.

Αποτελείται από τα εξής πεδία:

 * `id`
 * `name`
 * `imageurl`
 * `pricevat`
 * `click_url`
 * `Category`
 * `Manufacturer`
 * `Shop`

### Sku ###

Το Sku είναι ένα `γενικό προϊόν` που ομαδοποίει όμοια προιόντα ανάμεσα
στα καταστήματα. Το Sku μπορεί να περιέχει κριτικές ή specifications,
όπως π.χ. τον επεξεργαστή στην περίπτωση ενός laptop ή τις ίντσες στην
περίπτωση μιας τηλεόρασης.

Αποτελείται από τα εξής πεδία:

 * `id`
 * `price_min`
 * `price_max`
 * `ean` Barcode
 * `pn` Part Number
 * `reviewscore`
 * `display_name`
 * `plain_spec_summary`
 * `Category`
 * `ActiveProducts`
 * `Reviews`
 * `SkuSpecs`
 * `SkuPictures`
 * `MainPicture`
 * `Proposals` (type Sku with fewer attrs)


### SkuPicture ###

Αποτελείται από τα εξής πεδία:

* `original_url`
* `tiny_url`
* `small_url`
* `medium_url`

### Reviews ###

Αποτελείται από τα εξής πεδία:

* `created_on`
* `negative`
* `positives`
* `rating`
* `review`
* `User`
* `Sku`

### Specifications ###

Αποτελείται από τα εξής πεδία:

 * `name`
 * `spec_value`
 * `specification_name`
 * `specification_group`

### Manufacturer ###

Αποτελείται από τα εξής πεδία:

 * `id`
 * `name`
 * `image_url`

### Shop ###

Αποτελείται από τα εξής πεδία:

 * `id`
 * `name`
 * `reviewscore`
 * `reviews_count`
 * `phone`
 * `created_on`
 * `communication_score`
 * `orderflow_score`
 * `completence_score`
 * `rma_score`
 * `feedback_score`
 * `image_url` - Το λογότυπο που μαγαζιού, ενδεχομένως να μην υπάρχει.
 * `thumbshot_url`
 * `last_reviews_hash`
 * `total_reviews_hash`
 * `link`
 * `info`
 * `credit_card`
 * `paypal`
 * `bank`
 * `reviewscore`
 * `reviews_count`
 * `store_picking` - Παραλαβή από το κατάστημα
 * `spot_cash` - Αντικαταβολή
 * `spot_cash_cost` - Κόστος αντικαταβολής
 * `spot_cash_info` - Πληροφορίες αντικαταβολής
 * `installments` - Δόσεις
 * `free_shipping` - Μεταφορικά
 * `free_from` - Ελάχιστο κόστος για δωρεάν μεταφορικά
 * `free_from_info` - Πληροφορίες μεταφορικών
 * `min_shipping` - Ελάχιστα μεταφορικά
 * `Locations`
 * `ApprovedShopReviews` (type ShopReviews)

### ShopReviews ###
Αποτελείται από τα εξής πεδία:

* `review`
* `rating`
* `shop_reply`
* `created_on`

### Location ###
Αποτελείται από τα εξής πεδία:

* `phone`
* `full_address`
* `latitude`
* `longitude`

### Book ###
Ένα sku που ανήκει στην κατηγορία βιβλίων. Αποτελείται από τα εξής
πεδία:

* `id`
* `display_name`
* `title`
* `price_min`
* `price_max`
* `author_name`
* `main_dewey_id`
* `main_author_id`
* `picture_url`
* `Authors`
* `Deweys`
* `MainPicture`
* `ActiveProducts`
* `Reviews`

### User ###

 * `username`
 * `avatar_url`

### Bookmarklist ###

 * `id`
 * `name`
 * `is_public`
 * `Bookmarks`

### Bookmark ###

 * `id`
 * `resource_type` `Product` | `Sku` | `Book`
 * `resource_id`
 * `bookmarklist_id`

### SearchResults ###

Τα αποτελέσματα μιας αναζήτησης

Αποτελείται από τα εξής πεδία:

* `id` - Κωδικός κατηγορίας
* `name` - Όνομα κατηγορίας
* `children_count` - Αριθμός υποκατηγοριών
* `count` - Αριθμός αποτελεσμάτων στην κατηγορία

