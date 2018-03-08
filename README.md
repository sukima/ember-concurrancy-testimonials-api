# Ember Concurrency Testimonials API

This is a simple project to publish a CORS compatible JSON API via GitHub
Pages. The API is a list of user contributed testimonials on using
[ember-concurrency][1].

[1]: http://ember-concurrency.com/docs/introduction/

## How to contribute

Clone this repo and create a new testemonial in the `testimonials/` directory.
They are simply Markdown files with some front-matter.

A convinience command is available to make a new file for you ready to edit:

```console
$ make testimonial
```

When complete create a Pull Request with the new testimonial.

## Deployment

Once merged the repo admin can execute `make deploy` which will build a JSON
API as static files into the `dist/` directory. And then will push the `dist/`
directory into the `gh-pages` branch.

GitHub offers CORS out of the box for GitHub Pages.

This will allow other Ember applications to use this API easily.
