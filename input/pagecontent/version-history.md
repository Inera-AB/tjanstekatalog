This page is maintained automatically by [release-please](https://github.com/googleapis/release-please).
Entries are generated from commit messages that follow [Conventional Commits](https://www.conventionalcommits.org/).

---

## [0.1.0] — 2026-09-08

### Features

- Första utkastet av tjänstekatalogens IG: sökparametern `listed-by` på
  `Endpoint` för att slå upp en organisations ändpunkter via
  `Organization.endpoint` ("har"), skild från standardparametern
  `organization` ("förvaltar")
- Profilerna `TKOrganization` och `TKEndpoint`, med extensions för stödda
  interoperabilitetsspecifikationer (`tk-endpoint-payload-profile`),
  säkerhetsmetod och URL till auktorisationsserver
- Aktören Synkroniseringstjänst, som läser via tjänstekatalogens
  administrativa API och separat antar rollen Organization Endpoint Writer
  hos E-hälsomyndigheten (EHM) — se "Mappning mot EHM:s Organization
  Endpoint Writer" i mappings.html för element-för-element-mappningen mot
  EHM:s `$add-organization`/`$remove-organization`
- Ett CapabilityStatement för tjänstekatalogens egen administrativa API
  (server)
- Formell kravkatalog (`Requirements`) som spårar varje krav till
  realiserande FHIR-artefakter
- Logiska modeller för Indexpost, Vård- och omsorgstagare och
  API-specifikation, för spårbarhet mot det bifogade informationsunderlaget
