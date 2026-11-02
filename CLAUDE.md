# CLAUDE.md

Personal site (Jekyll, based on the jekyll-TeXt theme). Skin: `_sass/skins/_darklucy.scss`.

## Content rules

- The site stays semi-anonymous: no LinkedIn, no past employers or job history. Recruiters reach it from the CV/LinkedIn, not the other way round.
- Writing on the site should be brief and to the point.
- `TODO.md` at the repo root tracks open site work; keep it updated.

## Dev server

- The user already runs `jekyll serve`. Do not start, stop or restart it.
- The Zed task "serve (fast, 3 newest posts only)" uses `--limit_posts 3`; if an older post 404s locally, that's why (check the scratch build instead).
- Changes to `_config.yml` are not picked up by a running `jekyll serve`; ask the user to restart it when you change that file.
- To check for build errors without touching the running server or `_site`, build into the scratchpad with the disk cache off:
  `bundle exec jekyll build -d <scratchpad>/site --disable-disk-cache --quiet`
  The Sass "slash-div" deprecation warnings are pre-existing and harmless.
- To see a page without touching the user's desktop: serve that scratch build on a temporary port
  (`python -m http.server 4789 --bind 127.0.0.1 --directory <scratchpad>/site`, stop it afterwards) and take a headless Edge screenshot
  (`msedge.exe --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 --screenshot=<png> --window-size=1100,420 <url>`).
  - Headless Edge has a minimum window width and crops narrow shots; for phone width, screenshot a page with `<iframe src="/" width="380">`.
  - This PC's OS is in dark mode; add `--blink-settings=preferredColorScheme=1` to render light.
- Light/dark: follows the OS by default; the header toggle sets `html[data-theme]` and saves it in localStorage (`_includes/head/custom.html`).
  Dark colors live in the `darklucy-dark-colors` mixin in `_sass/skins/_darklucy.scss`; any new dark-only CSS must apply under both
  `@media (prefers-color-scheme: dark) { :root:not([data-theme="light"]) … }` and `:root[data-theme="dark"] …`.

## Site structure

- `/` (`index.html`) is the showcase: intro text plus one card per entry in `_showcase_posts`.
  Cards read `cover`, `title`, `subtitle` and `highlights` (a list) from each entry's front matter. Styles: `_sass/layout/_showcase.scss`.
- Showcase project pages use `layout: showcase`, which renders a quick-facts panel (`_includes/showcase-facts.html`) from front matter:
  `facts: { status, timeline, role, tech: [..], links: [{label, url}], articles: [post permalinks] }`. Article titles are looked up from the posts.
- `/blog/` (`blog/index.html`) is the paginated blog feed (`paginate_path: /blog/page:num`, `paths.home: /blog/`).
- `/showcase.html` is only a redirect to `/` so old links keep working.
- Nav menu: `_data/navigation.yml`.

## Theme gotchas

- Page titles: to match other pages' title spacing, use the theme's markup `<div class="article__header"><header><h1>…</h1></header></div>` rather than a bare `<h1>`.
- The theme styles link hover via `.root[data-is-touch="false"] a:hover` (high specificity): it underlines and recolors. Block-level links (like the showcase cards) need `text-decoration: none !important` and their text colors set on child elements, not on the `<a>`.
- Theme Sass helpers: `map-get($spacers, 1..5)`, `map-get($base, border-radius)`, `map-get($animation, duration)`, breakpoint mixins `media-breakpoint-up/down(md|lg)`.
