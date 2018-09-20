# Internal Docs

This is the internal documentation of skroutz API
build with [middleman](http://middlemanapp.com/)
and deployed on [github pages](https://pages.github.skroutz.gr/skroutz/internal_docs/)

Submissions are welcome.

## Usage

The following steps will get you started

1. `git pull`                     # make sure you get latest changes
* `bundle install`                # make sure dependencies are met
* `bundle exec middleman server`  # have changes auto-compiled (leave it running)
* Submit pull request

## Deploy on github pages
You have to deploy everytime you push on master branch

```bash
bundle exec middleman deploy
```

## API Recordings

Consult [response_mate](https://github.com/Zorbash/response_mate) for
help with each command.

We use a manifest that describes requests we need to have recorded.
This file is not checked in git so you have to ask for it, shoot a
mail at [api@skroutz.gr](mailto:api@skroutz.gr) to get it.

remember to create your enviroment.yml file from enviroment.yml.sample

Add your new endpoint in response_mate/requests.yml and run

```bash
response_mate record -k NEW_REQUEST -r response_mate/requests.yml -e response_mate/environment.yml -o resources/responses/

```
link the files generated with /api/v3/NEW_ENDPOINT.html.md.erb

Push and Deploy

Then check request results in resources/responses/NEW_REQUEST

## License

![cc-by-4.0](https://licensebuttons.net/l/by/3.0/88x31.png)

[Creative Commons CC-BY license](http://creativecommons.org/licenses/by/4.0)
