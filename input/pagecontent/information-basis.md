# Informationsunderlag

Denna sida beskriver informationsunderlaget som denna Implementation Guide
bygger på. Detaljerade begrepps- och informationsmodeller, samt fullständiga
processbeskrivningar, återfinns i den informationsspecifikation som anges
nedan — de upprepas inte här för att undvika dubbeldokumentation som kan
glida isär över tid.

| | |
|---|---|
| **Informationsspecifikation** | Tjänstekatalogens informationsmodell (bifogad ER-modell: Indexpost, Organisation, Vård- och omsorgstagare, Ändpunkt, API, API-specifikation) |
| **Version** | Utkast, mottaget 2026-09-08 |

**Länkar:**

- *Länk till publicerad informationsspecifikation — läggs till när
  informationsmodellen publiceras separat från denna IG.*

Modellen består av sex entiteter:

| Entitet | Roll i modellen |
|---|---|
| **Indexpost** | Registrerar en tidpunkt och "avser" (pekar på) antingen en Organisation eller en Vård- och omsorgstagare. |
| **Organisation** | En organisation, med organisationsnummer. "Förvaltar" ändpunkter (driftansvar) och "har" ändpunkter (listar dem i sin katalogpost) — två skilda relationer till Ändpunkt. |
| **Vård- och omsorgstagare** | En part som en indexpost kan avse. Modellen ger denna entitet endast ett id. |
| **Ändpunkt** | En teknisk ändpunkt: adress, giltighetstid, protokoll, säkerhetsmetod och URL till auktorisationsserver. |
| **API** | Kopplingen mellan en Ändpunkt och den/de API-specifikationer den följer, med egen giltighetstid. |
| **API-specifikation** | Metadata om en interoperabilitetsspecifikation: kanonisk URL, status, version, kategori, titel, beskrivning, ansvarig utgivare m.m. |

Se [Mappning till profiler](mappings.html) för vilka delar av
informationsspecifikationen som denna IG realiserar och eventuella
avvikelser eller tillägg i FHIR-realiseringen, och
[Kravkatalog](requirements.html) för de formella krav som härletts från
modellen.

Utöver dessa sex entiteter innehåller denna IG tre stakeholder-beslutade
tillägg som inte kommer från informationsunderlaget: administratörsbehörighet
([TKAdministratorRole](StructureDefinition-tk-administrator-role.html),
REQ-ADM-*), distribution/federering till lokala kataloger
([SubscriptionTopic](SubscriptionTopic-tk-organization-endpoint-changes.html),
REQ-DIST-*) och en explicit gräns för vilka API:er som exponeras externt
respektive endast internt (REQ-EXP-*). Se
[Mappning till profiler](mappings.html) för motivering av respektive
tillägg.

---

> **Vägledning för författare:** Håll denna sida kort. Användningsfall samt
> roller och ansvar beskrivs under [Användningsfall](use-cases.html) och
> [Roller och ansvar](roles-and-responsibilities.html).
