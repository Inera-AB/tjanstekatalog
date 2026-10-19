'use strict';

/**
 * Normalise heading levels in the release-please changelog page before the
 * IG is built.
 *
 * release-please writes each release as "## [x.y.z](…) (date)" (or "###" for
 * some patch releases) with "### Features"-style sections beneath it, and
 * offers no setting to change those levels. fhir2.base.template already
 * renders the page title as <h2>, so release-please's "##" entries become a
 * second top-level heading and fail IG Publisher's WCAG heading check.
 *
 * The rewrite is structural, not a blind shift, so it is idempotent and can
 * run on every build:
 *   - a version heading ("[0.2.0]", "0.2.0", "v0.2.0") becomes "###"
 *   - any other heading under a version ("Features", "Bug Fixes",
 *     "⚠ BREAKING CHANGES") becomes "####"
 *   - a "#" heading (release-please's "# Changelog" header, written when it
 *     recreates the file) is dropped; the template supplies the page title
 * Lines inside fenced code blocks are left alone.
 *
 * Usage:  node .github/scripts/version-history.js [file]
 */

const fs = require('node:fs');

const DEFAULT_FILE = 'input/pagecontent/version-history.md';
const HEADING = /^(#{1,6})\s+(.*)$/;
const VERSION_TEXT = /^\[?v?\d+\.\d+/;
const FENCE = /^\s*(```|~~~)/;

/**
 * @param {string} text  changelog page markdown
 * @returns {string}     the same page with normalised heading levels
 */
function normalize(text) {
  let inFence = false;
  const out = [];
  for (const line of text.split('\n')) {
    if (FENCE.test(line)) inFence = !inFence;
    const m = inFence ? null : HEADING.exec(line);
    if (!m) {
      out.push(line);
    } else if (m[1].length === 1) {
      // Dropped: the page title comes from the template.
    } else if (VERSION_TEXT.test(m[2])) {
      out.push(`### ${m[2]}`);
    } else {
      out.push(`#### ${m[2]}`);
    }
  }
  return out.join('\n');
}

function main(file = DEFAULT_FILE) {
  const before = fs.readFileSync(file, 'utf8');
  const after = normalize(before);
  if (after !== before) {
    fs.writeFileSync(file, after);
    console.log(`Normalised heading levels in ${file}`);
  } else {
    console.log(`${file} already has normalised heading levels`);
  }
}

if (require.main === module) main(process.argv[2]);

module.exports = { normalize, main };
