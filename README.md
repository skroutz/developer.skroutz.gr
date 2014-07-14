# developer.skroutz.gr

This is the Skroutz developer platform built with [middleman][middleman].

Submissions are welcome.

## Contributing
The following steps will get you started

1. `git pull`                     # make sure you get latest changes
* `bundle install`                # make sure dependencies are met
* `bundle exec middleman server`  # have changes auto-compiled (leave it running)
* Submit pull request

If you have deploy rights you may:
* `bundle exec rake deploy` # deploy changes

[middleman]: http://middlemanapp.com/

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

### API Responses

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

## Deploy

    $ rake deploy
