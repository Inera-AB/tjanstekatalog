'use strict';

// Run with:  node --test .github/scripts/*.test.js
//
// These tests exist because release-please writes "## [x.y.z]" release
// headings, which sit at the same level as the <h2> page title that
// fhir2.base.template renders and fail IG Publisher's WCAG heading check.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');

const { normalize } = require('./version-history.js');

const INTRO =
  'This page is maintained automatically by release-please.\n\n---\n\n';

test('new release-please entry is moved under the page title', () => {
  const input =
    INTRO +
    '## [0.2.0](https://github.com/x/y/compare/v0.1.0...v0.2.0) (2026-10-19)\n\n' +
    '\n### Features\n\n* HSA-id ([abc123](https://github.com/x/y/commit/abc123))\n\n' +
    '### Bug Fixes\n\n* rubriker\n\n' +
    '### [0.1.0] — 2026-09-08\n\n#### Features\n\n- Första utkastet\n';
  const expected =
    INTRO +
    '### [0.2.0](https://github.com/x/y/compare/v0.1.0...v0.2.0) (2026-10-19)\n\n' +
    '\n#### Features\n\n* HSA-id ([abc123](https://github.com/x/y/commit/abc123))\n\n' +
    '#### Bug Fixes\n\n* rubriker\n\n' +
    '### [0.1.0] — 2026-09-08\n\n#### Features\n\n- Första utkastet\n';
  assert.strictEqual(normalize(input), expected);
});

test('is idempotent', () => {
  const once = normalize(INTRO + '## [0.2.0] (2026-10-19)\n\n### Features\n\n* x\n');
  assert.strictEqual(normalize(once), once);
});

test('patch release written as ### and versions with a v prefix are both version headings', () => {
  assert.strictEqual(normalize('### [0.2.1] (2026-10-20)'), '### [0.2.1] (2026-10-20)');
  assert.strictEqual(normalize('## v1.0.0 (2027-01-01)'), '### v1.0.0 (2027-01-01)');
});

test('breaking-changes section is a sub-heading of its release', () => {
  assert.strictEqual(normalize('### ⚠ BREAKING CHANGES'), '#### ⚠ BREAKING CHANGES');
});

test('a "# Changelog" header written by release-please is dropped', () => {
  assert.strictEqual(
    normalize('# Changelog\n\n## [0.2.0] (2026-10-19)\n'),
    '\n### [0.2.0] (2026-10-19)\n'
  );
});

test('lines inside fenced code blocks are left alone', () => {
  const input = '```\n## not a heading\n```\n## [0.2.0]';
  assert.strictEqual(normalize(input), '```\n## not a heading\n```\n### [0.2.0]');
});

test('the committed page is already normalised', () => {
  const page = fs.readFileSync('input/pagecontent/version-history.md', 'utf8');
  assert.strictEqual(normalize(page), page);
});
