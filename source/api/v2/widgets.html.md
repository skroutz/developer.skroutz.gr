---
title: Widgets | Skroutz API v2
---

# Παραδείγματα για Widget

* TOC
{:toc}

## Τιμές για συγκεκριμένο προϊόν

Χρησιμοποιείστε τον παρακάτω κώδικα αντικαταστώντας το `id` με το
αντίστοιχο `id` προΪόντος όπως εμφανίζεται στην διεύθυνση της σελίδας
του. π.χ. http://www.skroutz.gr/s/**2567463**/Apple-iPad-mini-Wifi-16GB.html

~~~ html
<div class="skroutz-widget">
<script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" >
  new SkroutzWidget().display_sku({id:2567463});
</script>
<p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>
~~~

<div class="skroutz-widget">
<script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" >
  new SkroutzWidget().display_sku({id:2567463});
</script>
<p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>

## Αποτελέσματα γενικής αναζήτησης

Χρησιμοποιείστε τον παρακάτω κώδικα αντικαταστώντας το `keyphrase` με
την λέξη/λέξεις αναζήτησης που επιθυμείτε.

~~~ html
<div class="skroutz-widget">
  <script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
  <script type="text/javascript" charset="utf-8" >
    new SkroutzWidget().display_popular({keyphrase:'samsung'});
  </script>
  <p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>
~~~

<div class="skroutz-widget">
<script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" >
  new SkroutzWidget().display_popular({keyphrase:'samsung'});
</script>
<p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>

## Αποτελέσματα αναζήτησης σε συγκεκριμένη κατηγορία

Χρησιμοποιείστε τον παρακάτω κώδικα αντικαταστώντας το `keyphrase` με
την λέξη/λέξεις αναζήτησης που επιθυμείτε και τo `cat_id` με τον κωδικό
κατηγορίας όπως εμφανίζεται στην διεύθυνση
π.χ. http://www.skroutz.gr/c/**40**/kinhta-thlefwna.html

~~~ html
<div class="skroutz-widget">
  <script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
  <script type="text/javascript" charset="utf-8" >
    new SkroutzWidget().display_popular({cat_id:40, keyphrase:'iphone'});
  </script>
  <p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>
~~~

<div class="skroutz-widget">
<script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" >
  new SkroutzWidget().display_popular({cat_id:40, keyphrase:'iphone'});
</script>
<p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>

### Top προϊόντα κατηγορίας 

Χρησιμοποιείστε τον παρακάτω κώδικα αντικαταστώντας τo `cat_id` με τον
κωδικό κατηγορίας όπως εμφανίζεται στην διεύθυνση
π.χ. http://www.skroutz.gr/c/<b>40</b>/kinhta-thlefwna.html

~~~ html
<div class="skroutz-widget">
  <script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
  <script type="text/javascript" charset="utf-8" >
    new SkroutzWidget().display_popular({cat_id:40});
  </script>
  <p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>
~~~

<div class="skroutz-widget">
<script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" >
  new SkroutzWidget().display_popular({cat_id:40});
</script>
<p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>

## Παράμετροι

* `target` - Τα links να ανοίγουν:
  * στο ιδιο παράθυρο *(default)*: `'_top'`
  * σε άλλο παράθυρο: `'_blank'`

~~~ html
<div class="skroutz-widget">
  <script type="text/javascript" src="http://www.skroutz.gr/javascripts/widget-v1.js" charset="utf-8"></script>
  <script type="text/javascript" charset="utf-8" >
    new SkroutzWidget({target:'_blank'}).display_popular({cat_id:40});
  </script>
  <p class="skwidget-footer">powered by <a href="http://www.skroutz.gr/" title="Skroutz.gr">Skroutz.gr</a></p>
</div>
~~~
