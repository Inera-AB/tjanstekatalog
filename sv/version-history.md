# Versionshistorik - Tjänstekatalogen v0.2.0

## Versionshistorik

Den här sidan beskriver vad som har ändrats i varje version. Listan över alla publicerade versioner nås via länken i bannern överst på varje sida.

-------

### [0.2.0] — 2026-11-17

Förberedelse för en fast version av sök-API:t och admin-API:t.

#### Features

* Felsvar bär anropets korrelations-id i varje `issue`, med standardextensionen `operationoutcome-instance-id` och anropets `traceparent` (W3C Trace Context) som värde. Ny profil [TKOperationOutcome](StructureDefinition-tk-operation-outcome.md), nytt krav REQ-ERR-1 och nytt avsnitt i [Felhantering](error-handling.md#korrelations-id). IG:n beror nu på `hl7.fhir.uv.extensions.r5` 5.4.0, där extensionen finns.
* `TKProvenance.agent.onBehalfOf` anger den organisation användaren företrädde, och `agent.who` användarens HSA-id från Inera IdP (REQ-TRC-3).

#### Borttaget

* Profilen `TKAdministratorRole` (PractitionerRole), värdemängden för administrationsnivåer, `PractitionerRole` i admin-API:t och kraven REQ-ADM-1–4. Skrivbehörighet avgörs i stället från claims från Inera IdP (nytt krav REQ-ADM-5), och på sikt från medarbetaruppdrag.
* Patientindexet: de logiska modellerna `TKIndexpost` och `TKVardOchOmsorgstagare`, kraven REQ-MDL-1 och REQ-MDL-2 samt mallprofilen `IneraPatient` med exempel.

#### Ändrat

* Synkroniseringen mot EHM (REQ-WRT-*, Synkroniseringstjänsten) och distributionen till lokala kataloger (REQ-DIST-*, prenumerationsämnet) är märkta som utkast. De ingår inte i den fasta versionen.

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

