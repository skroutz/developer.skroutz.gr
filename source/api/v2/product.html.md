---
title: Product | Skroutz API v2
---

## API Προϊόντων ##

### Εύρεση Sku ###

    # Με βάση το id
    /sku/:sku_id/
    
    # Με βάση τον κωδικό προιόντος <sku> που έχει στο κατάστημα με shop_id <shop_id>
    /sku/lookup/shop/:shop_id/sku/:sku/

    # Με βάση το part number του κατασκευαστή
    /sku/lookup/pn/:pn/

    # Με βάση το barcode
    /sku/lookup/barcode/:barcode/

**Returns:** Sku

    $ curl -F 'access_token=36c57b67...'  http://apiv2.skroutz.gr/xml/sku/13304/
    ---
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>sku</type>
        <result>
            <sku>
                <id>13304</id>
                <ean nil="true"></ean>
                <id>13304</id>
                <pn nil="true"></pn>
                <price_max>264.0</price_max>
                <price_min>264.0</price_min>
                <display_name>Nokia 6270</display_name>
                <active_products>
                    <active_product>
                        <id>1234</id>
                        <imageurl>...</imageurl>
                        <name>
                            <![CDATA[NOKIA 6270  Κινητό Τηλέφωνο]]>
                        </name>
                        <click_url>http://www.skroutz.gr/products/show/1234/</click_url>
                        <pricevat>264.0</pricevat>
                        <category>
                            <children_count>0</children_count>
                            <id>40</id>
                            <name>
                                <![CDATA[Κινητά Τηλέφωνα]]>
                            </name>
                            <family_id>2</family_id>
                            <family_name>
                                 <![CDATA[Τηλεφωνία]]>
                            </family_name>
                        </category>
                        <shop>
                            <free_from>90</free_from>
                            <free_from_info></free_from_info>
                            <free_shipping>true</free_shipping>
                            <id>681</id>
                            <name>
                                <![CDATA[A-shop]]>
                            </name>
                            <reviews_count>2</reviews_count>
                            <reviewscore>3.0</reviewscore>
                            <spot_cash>true</spot_cash>
                            <spot_cash_cost>0.0</spot_cash_cost>
                            <image_url>http://www.skroutz.gr/...</image_url>
                        </shop>
                        </active_product>
                    <active_product>
                    </active_product>
                </active_products>
                <category>
                    <children_count>0</children_count>
                    <id>40</id>
                    <name>
                        <![CDATA[Κινητά Τηλέφωνα]]>
                    </name>
                </category>
                <sku_reviews>
                    <sku_review>
                        <created_on>2007-12-10T10:53:09+02:00</created_on>
                        <positives>
                            <![CDATA[Camera, Σήμα κλασσικά Nokia, Κατασκευή]]>
                        </positives>
                        <rating>4</rating>
                        <review>
                            <![CDATA[Είμαι απόλυτα ευχαριστημένος.]]>
                        </review>
                    </sku_review>
                </sku_reviews>
                <skuspecs>
                    <skuspec>
                        <value>Slide</value>
                        <specification_name>
                            <![CDATA[Τύπος Κινητού]]>
                        </specification_name>
                        <specification_group>
                            <![CDATA[Βασικά Χαρακτηριστικά]]>
                        </specification_group>
                    </skuspec>
                    <skuspec>
                        <value>TFT, 256K colors</value>
                        <specification_name>
                            <![CDATA[Τύπος Οθόνης]]>
                        </specification_name>
                        <specification_group>
                            <![CDATA[Τεχνικά Χαρακτηριστικά]]>
                        </specification_group>
                    </skuspec>
                </skuspecs>
            </sku>
    

### Κατηγορίες ###

    # Εύρεση υποκατηγοριών για μη τελικές κατηγορίες
    /subcategories/:cat_id/

    # Αν το cat_id παραλειφθεί επιστρέφει τις top level κατηγορίες (families)

**Result:** Categories

    $ curl -F 'access_token=36c57b67...'  http://apiv2.skroutz.gr/xml/subcategories/769/
    ---
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>categories</type>
        <result>
            <categories>
                <category>
                    <children_count>0</children_count>
                    <id>25</id>
                    <name>Laptop</name>
                    <family_id>2</family_id>
                    <family_name>
                         <![CDATA[Τηλεφωνία]]>
                    </family_name>
                </category>
    

### Αναζητήση ###

*Γενική* αναζήτηση, δηλαδή αναζήτηση που δεν αναφέρεται σε συγκεκριμένη κατηγορία

    # Required Parameters: 'keyphrase'
    /search/

#### Μια αναζήτηση μπορεί να επιστρέψει απαντήσεις με type: ####

 * `multiple_results` - Βρέθηκαν αποτελέσματα σε πολλαπλές κατηγορίες
   (Οι κατηγορίες που επιστρέφονται είναι πάντα τελικές κατηγορίες)

   **Result:** SearchResults

        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=ipad' http://apiv2.skroutz.gr/xml/search/
        ---
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>multiple_results</type>
            <result>
                <search_results>
                    <search_result>
                        <name>
                            <![CDATA[Διάφορα Αξεσουάρ Laptop]]>
                        </name>
                        <count>40</count>
                        <id>290</id>
                        <family_id>22</family_id>
                        <family_name>
                             <![CDATA[Ηλεκτρονικοί υπολογιστές]]>
                        </family_name>
                        <children_count>0</children_count>
                    </search_result>
                    <search_result>
                        <name>
                            <![CDATA[Τσάντες]]>
                        </name>
                        <count>30</count>
                        <id>92</id>
                        <family_id>22</family_id>
                        <family_name>
                             <![CDATA[Ηλεκτρονικοί υπολογιστές]]>
                        </family_name>
                        <children_count>0</children_count>
        

 * `category_match` - Το keyphrase είναι το όνομα μια κατηγορίας

   **Result:** Category
        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=Κινητά Τηλέφωνα' \
             http://apiv2.skroutz.gr/xml/search/
        ---
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>category_match</type>
            <result>
                <category>
                    <children_count>0</children_count>
                    <id>40</id>
                    <name>
                        <![CDATA[Κινητά Τηλέφωνα]]>
                    <family_id>2</family_id>
                    <family_name>
                         <![CDATA[Τηλεφωνία]]>
                    </family_name>
                    </name>
                </category>
            </result>
            <error nil="true"></error>
        </SkroutzApi>
        

 * `manufacturer` - Το keyphrase είναι το όνομα κατασκευαστή

   **Result:** Manufacturer
        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=sony' http://apiv2.skroutz.gr/xml/search/
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>manufacturer</type>
            <result>
                <manufacturer>
                    <id>2</id>
                    <name>Sony</name>
                </manufacturer>
            </result>
            <error nil="true"></error>
        </SkroutzApi>
        


 * `sku` - Βρέθηκε μόνο ένα Sku

   **Result:** Sku
        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=The eye of judgment fire' \
               http://apiv2.skroutz.gr/xml/search/
        ---
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>sku</type>
            <result>
                <sku>
                    <ean nil="true"></ean>
                    <id>33933</id>
                    <pn nil="true"></pn>
                    <price_max>34.9</price_max>
                    <price_min>34.9</price_min>
                    <display_name>The Eye of Judgment: Fire Crusader Theme Deck</display_name>
                    <sku_reviews/>
                    <category>
                        <children_count>0</children_count>
                        <family_id>59</family_id>
                        <id>414</id>
                        <name>
                            <![CDATA[Παιχνίδια Playstation 3 ]]>
                        </name>
                        <family_id>59</family_id>
                        <family_name>
                            <![CDATA[Ηλεκτρονικά Παιχνίδια]]>
                        </family_name>
                    </category>
                    <active_products>
                        <active_product>
                            <id>4206001</id>
                            <imageurl>http://fi.gameexplorers.gr/6de.jpg</imageurl>
                            <name>The Eye Of Judgment - Fire Crusader Theme Deck (PS3)</name>
                            <pricevat>34.9</pricevat>
                            <click_url>http://www.skroutz.gr/products/show/4206001</click_url>
                            <category>
                                <children_count>0</children_count>
                                <id>414</id>
                                <name>
                                    <![CDATA[Παιχνίδια Playstation 3 ]]>
                                </name>
                                <family_id>59</family_id>
                                <family_name>
                                    <![CDATA[Ηλεκτρονικά Παιχνίδια]]>
                                </family_name>
                            </category>
                            <shop>
                                <free_from>90</free_from>
                                <free_from_info></free_from_info>
                                <free_shipping>true</free_shipping>
                                <id>681</id>
                                <name>
                                    <![CDATA[Ashop]]>
                                </name>
                                <reviews_count>2</reviews_count>
                                <reviewscore>3.0</reviewscore>
                                <spot_cash>true</spot_cash>
                                <spot_cash_cost>0.0</spot_cash_cost>
                                <image_url>http://www.skroutz.gr/...</image_url>
                            </shop>
                            </active_product>
                    </active_products>
                    <skuspecs/>
                </sku>
            </result>
            <error nil="true"></error>
        </SkroutzApi>        

 * `book_search` - Βρέθηκαν αποτελέσματα μόνο στα βιβλία

   **Result:** Κενό

        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=μεταπολίτευση' \
               http://apiv2.skroutz.gr/xml/search/
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>book_search</type>
            <result>
            </result>
            <error nil="true"></error>
        </SkroutzApi>
        

 * `single_category_results` - Βρέθηκαν αποτελέσματα μόνο σε μια κατηγορία

   **Result:** Category
        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=thinkpad x301' \
               http://apiv2.skroutz.gr/xml/search/
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>single_category_results</type>
            <result>
                <category>
                    <children_count>0</children_count>
                    <id>25</id>
                    <name>Laptop</name>
                    <family_id>22</family_id>
                    <family_name>
                        <![CDATA[Ηλεκτρονικοί Υπολογιστές]]>
                    </family_name>
                </category>
            </result>
            <error nil="true"></error>
        </SkroutzApi>
        
 * `no_results` - Δεν βρέθηκαν αποτελέσματα

 **Result:** Κενό
        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=υποβρύχια κυκλοφορία' \
               http://apiv2.skroutz.gr/xml/search/
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <type>no_results</type>
            <result>
            </result>
            <error nil="true"></error>
        </SkroutzApi>
        
#### Είδη λαθών: ####

 * `invalid` - To keyphrase δεν είναι σωστό, π.χ. είναι μικρότερο από 2 χαρακτήρες
 
        $ curl -F 'access_token=36c57b67...' -F 'keyphrase=E' http://apiv2.skroutz.gr/xml/search/
        ---
        <?xml version="1.0" encoding="UTF-8"?>
        <SkroutzApi>
            <error>
                <code>invalid</code>
                <text>Invalid Search</text>
                <number>221</number>
            </error>
        </SkroutzApi>

#### Correction ####

Σε μια αναζήτηση ενδεχομένως να περιέχεται και το πεδίο `correction`.
Το πεδίο αυτό προτείνει μια *εναλλακτική αναζήτηση* στον χρήστη.
π.χ. όταν `keyphrase=nolia`. Μπορεί να υπάρχει **μόνο** στους τύπους `multiple_results`
και `no_results`.


**Χειρισμός:** Αν ο χρήστης το επιλέξει, εκ νέου αναζήτηση με το καινούριο `keyphrase`.


#### Proposer ####

Σε μια αναζήτηση ενδεχομένως να περιέχεται και το πεδίο `proposer`.
Το πεδίο αυτό μπορεί να υπάρχει **μόνο** στον τύπο `multiple_results`
και έχει τρεις τύπους (`type`):

* `category` - Πρόταση μεταφοράς σε τελική κατατηγορία, π.x. `'usb flash 4gb'`

  **Χειρισμός:** Μεταφορά στο `listing` της κατηγορίας

* `category_manufacturer` - Πρόταση μεταφοράς σε κατατηγορία με κατασκευαστή,
  π.x. `'laptop sony'`

  **Χειρισμός:** Μεταφορά στο `listing` κατηγορία με το αντίστοιχο `manufacturer_id`

* `category_filter` - Πρόταση μεταφοράς σε κατατηγορία με κατασκευαστή,
  π.x. `'τηλεοράσεις plasma'`

  **Χειρισμός:** Μεταφορά στο `listing` κατηγορία με το αντίστοιχο `filter_id`



### Προβολή Τελικών Κατηγοριών - Listing ###
Οι τελικές κατηγορίες του skroutz.gr έχουν μια ειδική μορφή. Μπορεί να
περιέχουν φίλτρα, ονόματα κατασκευαστών, κ.α.
Δείτε την κατηγορία [Laptop](http://www.skroutz.gr/c/25/laptop.html)
για παράδειγμα.

Με αυτή την κλήση api γίνεται **αναζήτηση σε τελικές κατηγορίες**.

#### Παράμετροι ####
 * `keyphrase` - Προαιρετική φράση αναζήτησης
 * `filter_id` - Ενεργά φίλτρα, για πολλαπλά φίλτρα ενώστε τα ids με underscores
 * `manufacturer_id` - Επιλογή ενός κατασκευαστή
 * `page` - Επιλογή σελίδας

#### Μορφή Απάντησης ####

* `SelectedFilters`
 * `Skus`
 * `Manufacturers`
 * `FilterGroups`
   * `Name`
   * `Filters`
     * `id`
     * `name`
 * `Paginator`
   * `total_results`
   * `page`
   * `results_per_page`
   * `total_pages`

**Παράδειγμα:**

    $ curl -F 'access_token=36c57b67...' http://apiv2.skroutz.gr/xml/list/25/
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>listing</type>
        <result>
            <selected_filters nil="true"></selected_filters>
            <skus>
                <sku>
                    <id>96531</id>
                    <display_name>OEM K7E5 G600</display_name>
                    <category>
                        <children_count>0</children_count>
                        <id>25</id>
                        <name>Laptop</name>
                        <family_id>22</family_id>
                        <family_name>
                            <![CDATA[Ηλεκτρονικοί Υπολογιστές]]>
                        </family_name>
                    </category>
                </sku>
                <sku>
                ...
                </sku>
            </skus>
            <filter_groups>
                <filter_group>
                    <name>
                        <![CDATA[Τύπος]]>
                    </name>
                    <filters>
                        <filter>
                            <id>5468</id>
                            <name>NetBook</name>
                        </filter>
                        <filter>
                            <id>5465</id>
                            <name>UMPC</name>
                        </filter>
                    </filters>
                </filter_group>
                <filter_group>
                    <name>
                        <![CDATA[Μέγεθος]]>
                    </name>
                    <filters>
                        <filter>
                            <id>5461</id>
                            <name>
                                <![CDATA[έως 10"]]>
                            </name>
                        </filter>
                    </filters>
                </filter_group>
            </filter_groups>
            <manufacturers>
                <manufacturer>
                    <id>23</id>
                    <name>Acer</name>
                </manufacturer>
                ...
            </manufacturers>
            <paginator>
                <total_results>1542</total_results>
                <page>1</page>
                <results_per_page>18</results_per_page>
                <total_pages>86</total_pages>
            </paginator>
        </result>
        <error nil="true"></error>
    </SkroutzApi>


### Manufacturer ###
    /manufacturer/:manuf_id/

#### Μορφή Απάντησης ####

* `Manufacturer`
* `popular_categories`
* `popular_skus`
* `search_results`

**Παράδειγμα**
    $ curl -F 'access_token=36c57b67...' \
           http://apiv2.skroutz.gr/xml/manufacturer/2/  # Sony
    ---
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>manufacturer_page</type>
        <result>
            <manufacturer>
                <id>2</id>
                <name>Sony</name>
            </manufacturer>
            <popular_categories>
                <popular_category>
                    <children_count>0</children_count>
                    <id>108</id>
                    <name>
                        <![CDATA[Κονσόλες]]>
                    </name>
                    <family_id>59</family_id>
                    <family_name>
                        <![CDATA[Ηλεκτρονικά Παιχνίδια]]>
                    </family_name>
                </popular_category>
                ...
            </popular_categories>
            <popular_skus>
                <popular_sku>
                    <id>88036</id>
                    <display_name>Sony PlayStation 3 (PS3) Slim 120GB</display_name>
                    <category>
                        <children_count>0</children_count>
                        <id>108</id>
                        <name>
                            <![CDATA[Κονσόλες]]>
                        </name>
                        <family_id>59</family_id>
                        <family_name>
                            <![CDATA[Ηλεκτρονικά Παιχνίδια]]>
                        </family_name>
                    </category>
                </popular_sku>
                ...
            </popular_skus>
            <search_results>
                <search_result>
                    <name>
                        <![CDATA[Ανταλλακτικά Kινητών τηλεφώνων]]>
                    </name>
                    <count>1303</count>
                    <id>583</id>
                    <children_count>0</children_count>
                </search_result>
                ...
            </search_results>
        </result>
        <error nil="true"></error>
    </SkroutzApi>

### Shop ###
    /shop/:shop_id/

#### Μορφή Απάντησης ####

**Παράδειγμα**
    $ curl -F 'access_token=36c57b67...' \
           http://apiv2.skroutz.gr/xml/shop/1000/ 
    ---
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>shop</type>
        <result>
            <shop>
                <bank>true</bank>
                <credit_card>true</credit_card>
                <free_from>90</free_from>
                <free_from_info></free_from_info>
                <free_shipping>true</free_shipping>
                <id>3</id>
                <info></info>
                <installments>
                    <![CDATA[έως 36 έντοκες με οποιαδήποτε πιστωτική κάρτα...]]>
                </installments>
                <link>http://www.e-shop.gr/</link>
                <min_shipping>3</min_shipping>
                <name>E-shop</name>
                <paypal>false</paypal>
                <reviews_count>123</reviews_count>
                <reviewscore>2.99187</reviewscore>
                <spot_cash>true</spot_cash>
                <spot_cash_cost>0.0</spot_cash_cost>
                <spot_cash_info></spot_cash_info>
                <store_picking>true</store_picking>
                <image_url>http://www.skroutz.gr/images/shops/logos/mid/1000-mid.jpg</image_url>
                <locations>
                    <location>
                        <phone nil="true"></phone>
                        <full_address>
                            <![CDATA[μπλα μπλα μπλα]]>
                        </full_address>
                        <latitude>38.6397</latitude>
                        <longitude>21.3843</longitude>
                    </location>
                </locations>
            </shop>
        </result>
        <error nil="true"></error>
    </SkroutzApi>
    
### Shops ###
    # Όλα τα shops (Αλφαβητικά)
    /shops/
    
    # Όλα τα shops που αρχίζουν από ένα γράμμα (Αλφαβητικά)
    /shops/?letter=b
    

#### Μορφή Απάντησης ####

**Παράδειγμα**
    $ curl -F 'access_token=36c57b67...' -F letter=b \
           http://apiv2.skroutz.gr/xml/shops/
    ---
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
    <type>shop_listing</type>
    <result>
        <shops>
            <shop>
                <id>633</id>
                <name>Babylonlis</name>
                <phone>11111111</phone>
                <image_url>http://www.skroutz.gr/...jpg</image_url>
                <thumbshot_url>http://www.skroutz.gr/....jpg</thumbshot_url>
            </shop>
            <shop>
                <id>947</id>
                ...


    
### Index Skroutz.gr ###

Διάφορα widgets από την κεντρική σελίδα του skroutz.gr
    /index/

* `search_cloud`

**Παράδειγμα:**
    $ curl -F 'access_token=36c57b67...' http://apiv2.skroutz.gr/xml/index/
    ---
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>skroutz_index</type>
        <result>
            <search_cloud>
                <items>
                    <item>
                        <value>1469</value>
                        <keyword>samsung</keyword>
                    </item>
                    <item>
                        <value>1114</value>
                        <keyword>lg</keyword>
                    </item>
                    ...
                 </items>
            </search_cloud>
        </result>
        <error nil="true"></error>
    </SkroutzApi>
    


### Top 5 Sku για αναζήτηση ###

    /search/sku/ # Keyphrase parameters

**Returns:** Skus

    $ curl -F 'access_token=36c57b67...' -F 'keyphrase=thinkpad' \
           http://apiv2.skroutz.gr/xml/search/sku/
    <?xml version="1.0" encoding="UTF-8"?>
    <SkroutzApi>
        <type>skus</type>
        <result>
            <skus>
                <sku>
                    <id>52298</id>
                    <display_name>Lenovo ThinkPad X61 Tablet [7762WPB]</display_name>
                    <category>
                        <children_count>0</children_count>
                        <id>25</id>
                        <name>Laptop</name>
                    </category>
                </sku>
                ...   
    
