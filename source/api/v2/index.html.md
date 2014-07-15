---
title: Overview | Skroutz API v2
---

## Γενικές πληροφορίες ##

### Γενικά ###

Πρόκειται για μια πρώτη δοκιμαστική έκδοση ενός API. Για την ώρα τα
περισσότερα calls αντιστοιχούν επακριβώς στον τρόπο που δουλεύει το
skroutz.gr, στο μέλλον όμως θα εμπλουτιστεί με πιο γενικά calls.

Αν θέλετε να πάρετε μια γεύση στείλτε μας ένα email στο api /at/
skroutz.gr και θα σας στείλουμε ένα api key.

### Μορφή Ερώτησης ###

Η πρόσβαση στο API πραγματοποιείται μέσω HTTP και πρέπει να αρχίζει με

    http://apiv2.skroutz.gr/:format/

όπου το `:format` είναι `json` ή `xml`, ανάλογα με τον τύπο των
δεδομένων που θα επιστραφούν. Στο εξής αυτό το κομμάτι θα παραλείπεται
αφού παραμένει ίδιο για κάθε API call.

### Μορφή Απάντησης ###

Μια απάντηση API έχει την εξής μορφή:

 * `type`
 * `result`
 * `error`

Παράδειγμα XML:
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>categories</type>
        <error nil="true"></error>
        <result>
        ...
        </result>
    </SkroutzApi>

To πεδίο `result` είναι το **αποτέλεσμα** της κλήσης API. Είναι ασφαλές
να προσπελαστεί *μόνο στην περίπτωση* που το πεδίο `error` είναι
`null`. Κάθε σωστή απάντηση έχει ένα κωδικό όνομα που θα περιγράφετε
στην τεκμηρίωση, το όνομα αυτό περιέχεται στο πεδίο `type`.

### Χειρισμός λαθών ###

Σε περίπτωση λάθους το πεδίο `error` αποτελείται από τρία στοιχεία

 * `code` Κώδικος λάθους
 * `number` Αριθμός λάθους
 * `text` Σύντομη περιγραφή λάθους


### Κλειδί συνεργάτη ###

Για να χρησιμοποιήσετε το API απαιτείται ένα *κλειδί συνεργάτη Skroutz* `api_key` που 
θα σας δώθεί από το Skroutz.gr

### Πιστοποίηση ###

Για να πραγματοποιήσετε κλήσεις στο Skroutz Api χρειάζεται να περιμβάνετε σε κάθε κλήση
ως παράμετρος το `access_token` σας.

`access tokens` μπορείτε να πάρετε με το `/authenticate` api call

Ένα παράδειγμα:
    $ curl -F 'access_token=36c57b67...' http://apiv2.skroutz.gr/xml/subcats/769/

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

### Access Tokens ###

Υπάρχουν δύο ειδών `access tokens`, το `basic` και το `full`.
Το `full` είναι ένα token συσχετισμένο με έναν χρήση και επιτρέπει επιπλέον api calls που τον αφορούν. (e.x. `bookmarks`)

### Authenticate ###

Έκδοση `access_token`. **Μόνο "https"**

#### Παράμετροι ####
 * `api_key` - Το api_key σας
 * `username` - Όνομα χρήστη, στην περίπτωση full token
 * `password` - Κωδικός χρήστη, στην περίπτωση full token

**Παράδειγμα**
    # basic token
    /authenticate api_key=<your api-key>
    
    # full token
    /authenticate api_key=<your api-key> username=skroutz password=donald

**Returns:**

 * `access_token` - Το access token για την χρήση του api
 * `access_token_expiry` - Πότε λήγει το access_token
 * `access_token_type` - basic/full
 * `user` - Εναν χρήστη στην περίπτωση που ζητήθηκε  full_token

**Errors:**

  * `wrong_auth` - Λάθος credentials
  * `access_denied` - Λάθος api_key

**Παράδειγμα:**

    $ curl -F 'access_token=36c57b67...' -F username=skroutz -F password=donald \
           http://apiv2.skroutz.gr/xml/authenticate/
    ---
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


### Logout ###
Αποσύνδεση

**Returns:**

 * `success` - true
    
### Περιορισμοί ###

Για την ώρα δεν υπάρχουν περιορισμοί στην χρήση του API εφόσον κινείται
σε λογικά πλαίσια.
