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

## Materials (downloads)

Downloadable files (record forms, instructions, scoring sheets, R code, Shiny apps, JATOS archives) are **not committed**. They are GitHub Release assets of the release [`materials-v1`](https://github.com/giorgioarcara/gems-tests/releases/tag/materials-v1) and are linked from the language pages as:

```
https://github.com/giorgioarcara/gems-tests/releases/download/materials-v1/<asset>
```

They were migrated from the OSF projects 4t5a8 (GEMS), t3bma (Tele-GEMS) and fq8g7 (Auto-GEMS). `scripts/materials.tsv` lists each asset, its original OSF id and path, and a description. Naming scheme: `<test>-<lang>-<item>.<ext>`, e.g. `gems-en-record-form-A.pdf`.

To add or replace a file:

1. Put it in `materials/` (git-ignored) with the asset name, and add or update its row in `scripts/materials.tsv`.
2. Run `scripts/upload-materials.sh` (needs `gh` logged in). Existing assets with the same name are overwritten, so links stay valid.
3. Link it from the page with the URL above.

Online calculators (Shiny): GEMS https://giorgioarcara.shinyapps.io/GEMS_app/, Tele-GEMS https://sonia-montemurro.shinyapps.io/Tele-GEMS_Shiny/. Auto-GEMS has no online app; its Shiny app is downloaded and run locally in R.

## Publishing

Pushing to `main` triggers `.github/workflows/publish.yml`, which renders the site and publishes it to the `gh-pages` branch.
