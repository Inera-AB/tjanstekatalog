# Versionshistorik - Tjänstekatalogen v0.1.0

## Versionshistorik

This page is maintained automatically by [release-please](https://github.com/googleapis/release-please). Entries are generated from commit messages that follow [Conventional Commits](https://www.conventionalcommits.org/).

-------

## [0.1.0] — 2026-09-08

### Features

* Första utkastet av tjänstekatalogens IG: sökparametern `listed-by` på `Endpoint` för att slå upp en organisations ändpunkter via `Organization.endpoint` ("har"), skild från standardparametern `organization` ("förvaltar")
* Profilerna `TKOrganization` och `TKEndpoint`, med extensions för stödda interoperabilitetsspecifikationer (`tk-endpoint-payload-profile`), säkerhetsmetod och URL till auktorisationsserver
* Aktören Organization Endpoint Writer, med operationerna `$add-organization-to-endpoint` och `$remove-organization-from-endpoint`
* Två CapabilityStatements: tjänstekatalogens administrativa API (server) och Organization Endpoint Writer Capabilities (klient)
* Formell kravkatalog (`Requirements`) som spårar varje krav till realiserande FHIR-artefakter
* Logiska modeller för Indexpost, Vård- och omsorgstagare och API-specifikation, för spårbarhet mot det bifogade informationsunderlaget

