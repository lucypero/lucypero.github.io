# CLAUDE.md

Personal site (Jekyll, based on the jekyll-TeXt theme). Skin: `_sass/skins/_darklucy.scss`.

## Dev server

- The user already runs `jekyll serve`. Do not start, stop or restart it.
- The Zed task "serve (fast, 3 newest posts only)" uses `--limit_posts 3`; if an older post 404s locally, that's why (check the scratch build instead).
- Changes to `_config.yml` are not picked up by a running `jekyll serve`; ask the user to restart it when you change that file.
- To check for build errors without touching the running server or `_site`, build into the scratchpad with the disk cache off:
  `bundle exec jekyll build -d <scratchpad>/site --disable-disk-cache --quiet`
  The Sass "slash-div" deprecation warnings are pre-existing and harmless.

## Site structure

- `/` (`index.html`) is the showcase: intro text plus one card per entry in `_showcase_posts`.
  Cards read `cover`, `title`, `subtitle` and `highlights` (a list) from each entry's front matter. Styles: `_sass/layout/_showcase.scss`.
- `/blog/` (`blog/index.html`) is the paginated blog feed (`paginate_path: /blog/page:num`, `paths.home: /blog/`).
- `/showcase.html` is only a redirect to `/` so old links keep working.
- Nav menu: `_data/navigation.yml`.

## Theme gotchas

- Page titles: to match other pages' title spacing, use the theme's markup `<div class="article__header"><header><h1>…</h1></header></div>` rather than a bare `<h1>`.
- The theme styles link hover via `.root[data-is-touch="false"] a:hover` (high specificity): it underlines and recolors. Block-level links (like the showcase cards) need `text-decoration: none !important` and their text colors set on child elements, not on the `<a>`.
- Theme Sass helpers: `map-get($spacers, 1..5)`, `map-get($base, border-radius)`, `map-get($animation, duration)`, breakpoint mixins `media-breakpoint-up/down(md|lg)`.
