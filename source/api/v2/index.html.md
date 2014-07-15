---
title: Overview | Skroutz API v2
---

# Γενικές πληροφορίες

* TOC
{:toc}

## Γενικά

Πρόκειται για μια πρώτη δοκιμαστική έκδοση ενός API. Για την ώρα τα
περισσότερα calls αντιστοιχούν επακριβώς στον τρόπο που δουλεύει το
skroutz.gr, στο μέλλον όμως θα εμπλουτιστεί με πιο γενικά calls.

Αν θέλετε να πάρετε μια γεύση στείλτε μας ένα email στο api /at/
skroutz.gr και θα σας στείλουμε ένα api key.

## Μορφή Ερώτησης

Η πρόσβαση στο API πραγματοποιείται μέσω HTTP και πρέπει να αρχίζει με

<pre class="terminal">
  http://apiv2.skroutz.gr/:format/
</pre>

όπου το `:format` είναι `json` ή `xml`, ανάλογα με τον τύπο των
δεδομένων που θα επιστραφούν. Στο εξής αυτό το κομμάτι θα παραλείπεται
αφού παραμένει ίδιο για κάθε API call.

### Μορφή Απάντησης

Μια απάντηση API έχει την εξής μορφή:

* `type`
* `result`
* `error`

Παράδειγμα XML:

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<SkroutzApi>
    <type>categories</type>
    <error nil="true"></error>
    <result>
    ...
    </result>
</SkroutzApi>
~~~

To πεδίο `result` είναι το **αποτέλεσμα** της κλήσης API. Είναι ασφαλές
να προσπελαστεί *μόνο στην περίπτωση* που το πεδίο `error` είναι
`null`. Κάθε σωστή απάντηση έχει ένα κωδικό όνομα που θα περιγράφετε
στην τεκμηρίωση, το όνομα αυτό περιέχεται στο πεδίο `type`.

## Χειρισμός λαθών

Σε περίπτωση λάθους το πεδίο `error` αποτελείται από τρία στοιχεία

<ol>
  <li>
    <p class="term">code</p>
    <p class="description">Κωδικός λάθους</p>
  </li>
  <li>
    <p class="term">number</p>
    <p class="description">Αριθμός λάθους</p>
  </li>
  <li>
    <p class="term">text</p>
    <p class="description">Σύντομη περιγραφή λάθους</p>
  </li>
</ol>

## Κλειδί συνεργάτη

Για να χρησιμοποιήσετε το API απαιτείται ένα *κλειδί συνεργάτη Skroutz* `api_key` που 
θα σας δώθεί από το Skroutz.gr

## Πιστοποίηση

Για να πραγματοποιήσετε κλήσεις στο Skroutz Api χρειάζεται να περιμβάνετε σε κάθε κλήση
ως παράμετρος το `access_token` σας.

`access tokens` μπορείτε να πάρετε με το `/authenticate` api call

Ένα παράδειγμα:

<pre class="terminal">
$ curl -F 'access_token=36c57b67...' http://apiv2.skroutz.gr/xml/subcats/769/
</pre>

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<SkroutzApi>
  <type>categories</type>
  <error nil="true"></error>
  <result>
    <categories>
      <category>
        <children_count>0</children_count>
        <id>290</id>
        <name>
          <![CDATA[Διάφορα Αξεσουάρ Laptop]]>
        </name>
      </category>
      <category>
        <children_count>0</children_count>
        <id>712</id>
        <name>Docking stations</name>
      </category>
      <category>
        <children_count>0</children_count>
        <id>713</id>
        <name>
          <![CDATA[Βάση Laptop]]>
        </name>
      </category>
    </categories>
  </result>
</SkroutzApi>
~~~

## Access Tokens

Υπάρχουν δύο ειδών `access tokens`, το `basic` και το `full`.
Το `full` είναι ένα token συσχετισμένο με έναν χρήση και επιτρέπει επιπλέον api calls που τον αφορούν. (e.x. `bookmarks`)

## Authenticate

Έκδοση `access_token`. **Μόνο "https"**

### Παράμετροι

<ul>
  <li>
    <p class="term">api_key</p>
    <p class="description">Το api_key σας</p>
  </li>
  <li>
    <p class="term">username</p>
    <p class="description">Όνομα χρήστη, στην περίπτωση full token</p>
  </li>
  <li>
    <p class="term">password</p>
    <p class="description">Κωδικός χρήστη, στην περίπτωση full token</p>
  </li>
</ul>

**Παράδειγμα**

<pre class="terminal">
  # basic token
  /authenticate api_key=your_api-key

  # full token
  /authenticate api_key=your_api-key username=skroutz password=donald
</pre>

**Returns:**

<ul>
  <li>
    <p class="term">access_token</p>
    <p class="description">Το access token για την χρήση του api</p>
  </li>
  <li>
    <p class="term">access_token_expiry</p>
    <p class="description">Πότε λήγει το access_token</p>
  </li>
  <li>
    <p class="term">access_token_type</p>
    <p class="description">basic/full</p>
  </li>
  <li>
    <p class="term">user</p>
    <p class="description">Κωδικός χρήστη, στην περίπτωση full token</p>
  </li>
</ul>

**Errors:**

<ul>
  <li>
    <p class="term">wrong_auth</p>
    <p class="description">Λάθος credentials</p>
  </li>
  <li>
    <p class="term">access_denied</p>
    <p class="description">Λάθος api_key</p>
  </li>
</ul>

**Παράδειγμα:**

<pre class="terminal">
$ curl -F 'access_token=36c57b67...' -F username=skroutz -F password=donald \
       http://apiv2.skroutz.gr/xml/authenticate/
</pre>

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<SkroutzApi>
  <type>authenticate</type>
  <result>
    <user>
      <username>skroutz</username>
      <avatar_url>http://www.skroutz.gr/avatars/skroutz.jpg</avatar_url>
    </user>
    <access_token_expiry>2010-10-12T16:43:08+03:00</access_token_expiry>
    <access_token>54c1446bd299ee758956f42241ae18db</access_token>
    <access_token_type>full</access_token>
  </result>
  <error nil="true"></error>
</SkroutzApi>
~~~

## Logout
Αποσύνδεση

**Returns:**

<ul>
  <li>
    <p class="term">success</p>
    <p class="description">true</p>
  </li>
</ul>
    
## Περιορισμοί

Για την ώρα δεν υπάρχουν περιορισμοί στην χρήση του API εφόσον κινείται
σε λογικά πλαίσια.
