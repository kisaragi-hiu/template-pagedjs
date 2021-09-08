.PHONY: dev-hugo dev-tailwind dev

dev-hugo:
	hugo server

dev-tailwind:
	npx tailwindcss --postcss -i src/index.css -o static/css/built.css --watch

dev: static/js/paged.polyfill.js static/css/interface.css
	npx concurrently "make dev-hugo" "make dev-tailwind"

static/css/built.css: src/index.css
	npx tailwindcss --postcss -i "$<" -o "$@" --minify

static/css/interface.css:
	curl "https://gitlab.pagedmedia.org/tools/interface-polyfill/raw/master/interface.css" > "$@"

node_modules/pagedjs/dist/paged.polyfill.js:
	npm install

static/js/paged.polyfill.js: node_modules/pagedjs/dist/paged.polyfill.js
	cp "$<" "$@"

public: static/css/built.css static/js/paged.polyfill.js
	hugo --minify
	@touch public
