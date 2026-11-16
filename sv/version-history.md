# Versionshistorik - Tjänstekatalogen v0.1.1

## Versionshistorik

Den här sidan beskriver vad som har ändrats i varje version. Listan över alla publicerade versioner nås via länken i bannern överst på varje sida.

-------

### [0.1.1] — 2026-11-16

#### Features

* Kodsystemet och värdemängden `tk-api-specification-category` med koderna `fhir`, `rest-openapi` och `soap-rivta`. Extensionen `tk-api-specification-category` (API-specifikation.kategori) är nu bunden till värdemängden med extensible-bindning; tidigare saknade den bindning helt. Exemplet för API-specifikation använder nu en kod i stället för enbart text.

-------

### [0.1.0] — 2026-09-08

#### Features

* Första utkastet av tjänstekatalogens IG: sökparametern `listed-by` på `Endpoint` för att slå upp en organisations ändpunkter via `Organization.endpoint` ("har"), skild från standardparametern `organization` ("förvaltar")
* Profilerna `TKOrganization` och `TKEndpoint`, med extensions för stödda interoperabilitetsspecifikationer (`tk-endpoint-payload-profile`), säkerhetsmetod och URL till auktorisationsserver
* Aktören Synkroniseringstjänst, som läser via tjänstekatalogens administrativa API och separat antar rollen Organization Endpoint Writer hos E-hälsomyndigheten (EHM) — se "Mappning mot EHM:s Organization Endpoint Writer" i mappings.html för element-för-element-mappningen mot EHM:s `$add-organization`/`$remove-organization`
* Ett CapabilityStatement för tjänstekatalogens egen administrativa API (server)
* Formell kravkatalog (`Requirements`) som spårar varje krav till realiserande FHIR-artefakter
* Logiska modeller för Indexpost, Vård- och omsorgstagare och API-specifikation, för spårbarhet mot det bifogade informationsunderlaget

