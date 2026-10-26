# Tjänstekatalogen – FHIR Implementation Guide

[![Build and publish IG](https://github.com/Inera-AB/tjanstekatalog/actions/workflows/publish.yml/badge.svg)](https://github.com/Inera-AB/tjanstekatalog/actions/workflows/publish.yml)
[![Validate FSH](https://github.com/Inera-AB/tjanstekatalog/actions/workflows/validate.yml/badge.svg)](https://github.com/Inera-AB/tjanstekatalog/actions/workflows/validate.yml)
[![FHIR R5](https://img.shields.io/badge/FHIR-R5-blue)](https://hl7.org/fhir/R5/)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

FHIR R5 Implementation Guide for Inera's tjänstekatalog: an external search API for organisations' technical endpoints, an internal administrative API for registering organisations, endpoints, their links and administrator authorisations, and the Synkroniseringstjänst actor that keeps E-hälsomyndigheten's Organization Endpoint Writer register in sync.

| | |
|---|---|
| Package id | `inera.infra.tjanstekatalog` |
| Canonical | `https://fhir.inera.se/ig/tjanstekatalog` |
| Releases | `https://fhir.inera.se/ig/tjanstekatalog/` (none yet) |
| CI build (`main`) | `https://inera-ab.github.io/tjanstekatalog/` |

The repository is made from [IneraFHIRTemplate](https://github.com/Inera-AB/IneraFHIRTemplate) and follows its build and release flow.

---

## How publishing works

| Build | Trigger | Published to |
|---|---|---|
| Branch build | Push to `main`, `develop`, `feature/**`, `support/**` (`publish.yml`) | This repo's GitHub Pages: `https://inera-ab.github.io/tjanstekatalog/` (`main`), `…/branches/<branch>/` (other branches) |
| Release | Push of a release tag such as `0.1.0` (`release.yml`) | `https://fhir.inera.se/ig/tjanstekatalog/<version>/`, with the latest milestone also at `https://fhir.inera.se/ig/tjanstekatalog/` |
| Test publication | Manual run of `release.yml` on a branch | The test web root [inera-ab/fhir-portal-test](https://github.com/Inera-AB/fhir-portal-test) |

The workflows in `.github/workflows/` call the shared workflows in [Inera-AB/fhir-ig-workflows](https://github.com/Inera-AB/fhir-ig-workflows) at `@v1`. This IG is R5, so `publish.yml` and `release.yml` set `tx-server: https://tx.fhir.org/r5`.

Releases use IG Publisher's publication mode (`-go-publish`). The publisher keeps the version history (`package-list.json`, `history.html`) in the web root on fhir.inera.se, so this repository has no `package-list.json`.

The full process, in Swedish, is in the template's [`docs/`](https://github.com/Inera-AB/IneraFHIRTemplate/tree/main/docs):

- [Versionshantering, brancher och releaser](https://github.com/Inera-AB/IneraFHIRTemplate/blob/main/docs/versionshantering-och-release.md)
- [Förbereda en IG för publicering och göra en release](https://github.com/Inera-AB/IneraFHIRTemplate/blob/main/docs/forbereda-och-releasa-ig.md)

---

## Publish a release

On `main` (or `support/<major>.x` for a patch to an older major version), via a pull request:

1. Set `version` in `sushi-config.yaml` and add an entry `## [X.Y.Z] — YYYY-MM-DD` with `###` sections to `input/pagecontent/version-history.md`. Keep its first line, `{::options header_offset="1" /}`.
2. Update `publication-request.json`: a new `desc` that differs from every earlier release, and `mode` (`milestone`, or `working` for a release candidate or a patch to an older major version). Set `"first": false` after the first release.
3. Pin dependencies to published versions, never `current`.
4. Optionally run *Publish release* manually on the branch to publish to the test web root.

Then tag the merged commit. The tag has no `v` prefix and equals `version`:

```bash
git fetch origin
git tag -a 0.1.0 -m "0.1.0" origin/main
git push origin 0.1.0
```

After the release, open a pull request to [FHIR/ig-registry](https://github.com/FHIR/ig-registry) with the change in the run's `fhir-ig-list.diff` artifact.

---

## Daily workflow

1. Create a feature branch from `develop`, e.g. `feature/hsa-id`.
2. Push. `validate.yml` runs SUSHI and `publish.yml` builds the branch to `https://inera-ab.github.io/tjanstekatalog/branches/feature-hsa-id/`.
3. Open a pull request against `develop`. `pr-qa.yml` posts the IG Publisher QA report as a comment.
4. Merge when QA is green. The feature branch's build is removed when the branch is deleted (`cleanup.yml`).

Use [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `chore:` …). `git log --oneline <previous version>..HEAD` lists the changes for the next version history entry.

---

## Local development

Prerequisites: Node.js 20+, Java 17+, Ruby and Jekyll.

```bash
npm install -g fsh-sushi
gem install jekyll
mkdir -p input-cache
curl -sL https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o input-cache/publisher.jar

sushi .                                      # check the FSH
java -jar input-cache/publisher.jar -ig ig.ini   # build the whole IG
```

The result is in `output/index.html`. `output/`, `temp/`, `template/`, `input-cache/` and `fsh-generated/` are git-ignored.

---

## Repository structure

```
.github/workflows/         Callers of the shared workflows in Inera-AB/fhir-ig-workflows
publication-request.json   What the next release is (desc, mode, status, sequence)
sushi-config.yaml          IG metadata, dependencies, pages and menu
ig.ini                     IG Publisher configuration
input/
  fsh/                     Profiles, extensions, search parameters, CapabilityStatements, examples, requirements
  pagecontent/             Narrative pages (.md); no leading "# Title", the template renders the page title
  images/                  Inera CSS and logos
  includes/                Fragment overrides (CSS, header) and menu.xml (only the <ul>)
  ignoreWarnings.txt       Suppressed IG Publisher messages (registered via path-suppressed-warnings)
```

---

## Governance

Maintained by Inera AB. See the [Inera FHIR Landing Page](https://www.inera.se/fhir) for conformance requirements that apply to all Inera FHIR IGs.
