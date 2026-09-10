# CapabilityStatement - Tjänstekatalogen v0.1.0

## CapabilityStatement

# CapabilityStatement

Denna IG definierar två formella CapabilityStatement för sin egen serverroll, med en medveten exponeringsgräns mellan dem (stakeholder-beslut, REQ-EXP-1/2 — se [Mappning till profiler](mappings.md)):

| | | | |
| :--- | :--- | :--- | :--- |
| [Tjänstekatalogen: sök-API](CapabilityStatement-tk-search-api.md) | Server | **Externt**, via gateway | Läsande sökning (`read`/`search-type`) av[TKOrganization](StructureDefinition-tk-organization.md),[TKEndpoint](StructureDefinition-tk-endpoint.md)och`CapabilityStatement`(API-specifikationer/API-instanser), inklusive sökparametrarna`listed-by`och`implements`. |
| [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md) | Server | **Endast internt** | Samma resurser som sök-API:et, plus skrivinteraktioner (`create`/`update`), systeminteraktionen`transaction`(REQ-TRC-2),`Provenance`och administratörsbehörigheter ([TKAdministratorRole](StructureDefinition-tk-administrator-role.md)). |

**Notera den dubbla användningen av `CapabilityStatement`.** Tabellen ovan beskriver `CapabilityStatement`-resurser som beskriver **denna IG:s egna API:er** (metaanvändning, standard FHIR-praxis). Denna IG lagrar dessutom `CapabilityStatement`-resurser som **katalogens innehåll** — API-specifikationer ([TKAPISpecificationCapability](StructureDefinition-tk-api-specification-capability.md), kind=requirements) och API-instanser ([TKAPIInstance](StructureDefinition-tk-api-instance.md), kind=instance) — sökbara via sök-/admin-API:et ovan. Se REQ-MDL-4/6/7 och [Mappning till profiler](mappings.md) för motiveringen till detta modelleringsval.

Denna IG definierar också ett prenumerationsämne för distribution till lokala kataloger: [SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.md) — se "Distribution och synkronisering" i [REST-interaktioner](rest-interactions.md) och REQ-DIST-*.

**Organization Endpoint Writer Capabilities** — CapabilityStatementet för aktören Organization Endpoint Writer — är **inte** en artefakt i denna IG. Den definieras och publiceras av E-hälsomyndigheten (EHM) i deras egen IG ([Swedish Medical Record Index And Endpoint Registry](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/), canonical `http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er`). Denna IG:s [Synkroniseringstjänst](ActorDefinition-tk-synkroniseringstjanst.md) läser via vårt administrativa API och antar sedan den rollen mot EHM — se [Roller och ansvar](roles-and-responsibilities.md) och [Mappning mot EHM:s Organization Endpoint Writer](mappings.md) för hur data mappas mellan de två gränssnitten.

Fr.o.m. FHIR R5 kan `CapabilityStatement` uttrycka formella konformanskrav per roll via elementet `obligations`, som ett maskinläsbart alternativ eller komplement till de förväntningar som beskrivs under [Roller och ansvar](roles-and-responsibilities.md) under Funktionellt. Tjänstekatalogens administrativa API använder `kind = requirements`, i linje med hur EHM:s eget CapabilityStatement för Organization Endpoint Writer är definierat.

