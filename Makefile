TESTIMONIALS := $(patsubst testimonials/%.md,dist/testimonials/%.json,$(shell ls -1t testimonials/*.md))

.PHONY: all deploy clean testimonial

all: node_modules dist dist/testimonials.json

node_modules: package.json yarn.lock
	yarn

dist:
	git worktree add dist gh-pages || mkdir -p dist

dist/testimonials.json: $(TESTIMONIALS)
	bin/build-indexes $@ $(TESTIMONIALS)

dist/testimonials/%.json: testimonials/%.md
	@mkdir -p dist/testimonials
	bin/convert-to-json testimonial $@ $<

deploy: all
	cd dist && \
	git add --all && \
	git commit -m "Deploy to gh-pages" && \
	git push origin gh-pages

clean:
	rm -rf dist

testimonial:
	bin/create-testimonial
