# developer.skroutz.gr

This is the Skroutz developer platform built with [nanoc][nanoc].

Submissions are welcome.

## Contributing
The following steps will get you started

1. `git pull`                # make sure you get latest changes
2. `bundle install`          # make sure dependencies are met
3. `bundle exec guard`       # have changes autocompiled
4. `bundle exec nanoc view`  # start a local webserver to view the compiled static files found in `./output`
5. `bundle exec rake deploy` # deploy changes

[nanoc]: http://nanoc.stoneship.org/

If your interested in performing non-trivial changes (eg. structural)
you are suggested to read [nanoc documentation](http://nanoc.stoneship.org/docs/3-getting-started/)

## Styleguide

To make sure your contributions match the preferred format read below.

Not sure how to structure the docs?  Here's what the structure of the
API docs should look like:

    ---
    title: Sample Resource | Skroutz API
    ---

    ## About

      This is a short description concerning the sample resource

    ## Sample endpoint

    <pre class="terminal">
    /some_endpoint/:id/foos/bars/ # url template goes here
    </pre>

    <%= render_recording :sample_key %>

### JSON Responses

We use [response_mate](https://github.com/Zorbash/response_mate) gem
to record API responses.

To render a recording do:

```erb
<%= render_recording :category %>
```

This looks up in `output/responses/` for `categories.yml`

## Recording

  Consult [response_mate](https://github.com/Zorbash/response_mate) for
help with each command.

  We use a manifest that describes requests we need to have recorded.
  This file is not checked in git so you have to ask for it, shoot a
mail at [api@skroutz.gr](api@skroutz.gr) to get it.

  Most of the times you'll have to either tweak an existing key

## Deploy

    $ rake deploy
