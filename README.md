# GEMS tests website

Quarto website for the GEMS family of open-access cognitive screenings: **GEMS**, **Tele-GEMS** and **Auto-GEMS**.

Live site: https://giorgioarcara.github.io/gems-tests/

## Build locally

```bash
quarto preview   # live preview
quarto render    # build into _site/
```

## Structure

- `index.qmd`: home page with the three test modules
- `tests/<test>/index.qmd`: test overview and language selector
- `tests/<test>/<lang>.qmd`: main characteristics and downloads for one language
- `about.qmd`, `project.qmd`, `group.qmd`, `contact.qmd`
- `custom.scss`: theme and styles
- `images/flags/`: flag SVGs

## Adding a language

1. Add a flag SVG to `images/flags/` (e.g. `es.svg`).
2. Copy an existing language page, e.g. `tests/gems/en.qmd` → `tests/gems/es.qmd`, then translate the text and update the download links.
3. Add the flag to the test card in `index.qmd` and a language card in `tests/gems/index.qmd`.

## Publishing

Pushing to `main` triggers `.github/workflows/publish.yml`, which renders the site and publishes it to the `gh-pages` branch.
