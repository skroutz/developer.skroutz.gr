# developer.skroutz.gr

This is the Skroutz developer platform built with [middleman][middleman].

[middleman]: http://middlemanapp.com/

Submissions are welcome.

## Contributing
Please read our ["getting started" section](http://developer.skroutz.gr/contribution/#getting-started)

TL;DR  
The following steps will get you started

1. `git pull`                     # make sure you get latest changes
* `bundle install`                # make sure dependencies are met
* `bundle exec middleman server`  # have changes auto-compiled (leave it running)
* Submit pull request

## Deploy

If you have deploy rights you may:

```bash
bundle exec cap "flavor" deploy
# "flavor" is one of skroutz, alve, scrooge
```

## API Recordings

Consult [response_mate](https://github.com/Zorbash/response_mate) for
help with each command.

We use a manifest that describes requests we need to have recorded.
This file is not checked in git so you have to ask for it, shoot a
mail at [api@skroutz.gr](mailto:api@skroutz.gr) to get it.


## License

[Creative Commons CC-BY license](http://creativecommons.org/licenses/by/3.0/us/)
