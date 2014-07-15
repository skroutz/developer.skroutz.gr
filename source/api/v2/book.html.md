---
title: Βιβλία | Skroutz API v2
---

# API Βιβλίων

* TOC
{:toc}

## Εύρεση Sku

### Με βάση το id

<pre class="terminal">
GET /book/:book_id/
</pre>

**Παράδειγμα:**

<pre class="terminal">
$ curl -F 'access_to  ken=36c57b67...' http://apiv2.skroutz.gr/xml/book/258276/
</pre>

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<SkroutzApi>
  <type>book</type>
  <result>
    <book>
      <id>258276</id>
      <display_name>
        <![CDATA[Ο ιστός της αράχνης]]>
      </display_name>
      <author_name>Roth, Joseph</author_name>
      <main_dewey_id nil="true"></main_dewey_id>
      <main_author_id>16124</main_author_id>
      <authors>
        <author>
          <id>16124</id>
          <name>Roth, Joseph</name>
        </author>
        <author>
          <id>3762</id>
          <name>
            <![CDATA[Σιετή, Τούλα]]>
          </name>
        </author>
      </authors>
      <deweys>
        <dewey>
          <id>127</id>
          <name>
            <![CDATA[Αυστριακή πεζογραφία - Μυθιστόρημα]]>
          </name>
        </dewey>
      </deweys>
    </book>
  </result>
  <error nil="true"></error>
</SkroutzApi>
~~~


## Listing

Με αυτή την κλήση api εκτός του `listing` γίνεται και **αναζήτηση στα βιβλία**.

<pre class="terminal">
GET /books/list/
</pre>

#### Παράμετροι

 * `keyphrase` - Προαιρετική φράση αναζήτησης
 * `id` - Dewey id (Βιβλιοθηκονομική κατηγοριοποίηση)
 * `page` - Επιλογή σελίδας

#### Μορφή Απάντησης

 * `Books`
 * `dewey_results`
 * `Paginator`
   * `total_results`
   * `page`
   * `results_per_page`
   * `total_pages`

**Παράδειγμα:**

<pre class="terminal">
$ curl -F 'access_token=36c57b67...' -F 'id=866' http://apiv2.skroutz.gr/xml/books/list/
</pre>

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<SkroutzApi>
  <type>book_listing</type>
  <result>
    <paginator>
      <total_results>9316</total_results>
      <results_per_page>18</results_per_page>
      <page>1</page>
      <total_pages>518</total_pages>
    </paginator>
    <books>
      <book>
        <id>208222</id>
        <display_name>
          <![CDATA[Μέθοδοι αποστείρωσης και απολύμανσης...]]>
        </display_name>
        <author_name>
          <![CDATA[Παγκόσμιος Οργανισμός Υγείας]]>
        </author_name>
        <main_dewey_id>1509</main_dewey_id>
        <main_author_id>12179</main_author_id>
        <authors>
          <author>
            <id>12179</id>
            <name>
              <![CDATA[Παγκόσμιος Οργανισμός Υγείας]]>
            </name>
          </author>
        </authors>
        <deweys>
          <dewey>
            <id>1509</id>
            <name>
              <![CDATA[ Μπλα μπλα μπλα...]]>
            </name>
          </dewey>
        </deweys>
      </book>
      ...
     </books>
     <dewey_results>
      <dewey_result>
        <count>1</count>
        <name>
          <![CDATA[Θρησκεία]]>
        </name>
        <id>1042</id>
      </dewey_result>
      <dewey_result>
        <count>5</count>
        <name>
          <![CDATA[Ακολουθίες]]>
        </name>
        ...
~~~

## Index Βιβλίων

Διάφορα widgets από την κεντρική σελίδα βιβλιών του skroutz.gr

<pre class="terminal">
GET /books
</pre>

* `recommendations`
  * `Books`
* `popular`
  * `Books`
* `latest`
  * `Books`
* `critics`

**Παράδειγμα:**

<pre class="terminal">
$ curl -F 'access_`token=36c57b67...' http://apiv2.skroutz.gr/xml/books/
</pre>

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<SkroutzApi>
  <type>book_index</type>
  <result>
    <critiques>
      <critique>
        <critic>
          <![CDATA[Στέφανος Ξένος]]>
        </critic>
        <title>
          <![CDATA[ΕΓΩ Ο ΙΗΣΟΥΣ]]>
        </title>
      </critique>
      <book>
      ...
      </book>
    </critiques>
    <recommendations>
      <books>
      ...
      </books>
    </recommendations>
    <latest>
      <books>
      ...
      </books>
    </latest>
    <popular>
      <books>
      ...
      </books>
    </popular>
  </result>
  <error nil="true"></error>
</SkroutzApi>
~~~
