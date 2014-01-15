# developer.skroutz.gr

This is the Skroutz developer platform built with [nanoc][nanoc].

All submissions are welcome. To submit a change, fork this repo, commit your changes, and send us a pull request.

## Setup

Ruby 1.9 is required to build the site.

Get the nanoc gem, plus kramdown for markdown parsing:

    bundle install

You can see the available commands with nanoc:

    nanoc -h

Nanoc has [some nice documentation](http://nanoc.stoneship.org/docs/3-getting-started/) to get you started.  Though if you're mainly concerned with editing or adding content, you won't need to know much about nanoc.

[nanoc]: http://nanoc.stoneship.org/

## Styleguide

Not sure how to structure the docs?  Here's what the structure of the
API docs should look like:

    ---
    title: Sample Resource | Skroutz API
    ---

    ## About

      This is a short description concerning the sample resource

    ## Sample endpoint

    <%%= render_recording :sample_key %>

**Note**: We're using [Kramdown Markdown extensions](http://kramdown.rubyforge.org/syntax.html), such as definition lists.

### JSON Responses

We use [response_mate](https://github.com/Zorbash/response_mate) gem
to record API responses.

To render a recording do:

```erb
<%%= render_recording :category %>
```

This looks up in `output/responses/` for `categories.yml`

### Terminal blocks

You can specify terminal blocks with `pre.terminal` elements.  It'd be
nice if Markdown could do this more cleanly...

    <pre class="terminal">
    $ curl foobar
    ....
    </pre>

This isn't a `curl` tutorial though, I'm not sure every API call needs
to show how to access it with `curl`.

## Development

Nanoc compiles the site into static files living in `./output`.  It's
smart enough not to try to compile unchanged files:

    $ bundle exec nanoc compile
    Loading site data...
    Compiling site...
       identical  [0.00s]  output/css/960.css
       identical  [0.00s]  output/css/pygments.css
       identical  [0.00s]  output/css/reset.css
       identical  [0.00s]  output/css/styles.css
          update  [0.28s]  output/index.html
          update  [1.31s]  output/v3/categories/index.html
          update  [0.99s]  output/v3/skus/index.html

    Site compiled in 2.58.

You can setup whatever you want to view the files.  If you have the adsf
gem, however (I hope so, it was in the Gemfile), you can start Webrick:

    $ bundle exec nanoc view
    $ open http://localhost:3000

Compilation times got you down?  Use `guard` to autocompile changes!

    $ bundle exec guard

## Recording

  Consult [response_mate](https://github.com/Zorbash/response_mate) for
help with each command.

  We use a manifest that describes requests we need to have recorded.
  This file is not checked in git so you have to ask for it, shoot a
mail at [api-team@skroutz.gr](api-team@skroutz.gr) to get it.

  Most of the times you'll have to either tweak an existing key

## Deploy

    $ rake deploy

