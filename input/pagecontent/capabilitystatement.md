# CapabilityStatement

Denna IG definierar två formella CapabilityStatement för sin egen serverroll,
med en medveten exponeringsgräns mellan dem (stakeholder-beslut, REQ-EXP-1/2
— se [Mappning till profiler](mappings.html)):

| CapabilityStatement | Roll | Exponering | Beskriver |
|---|---|---|---|
| [Tjänstekatalogen: sök-API](CapabilityStatement-tk-search-api.html) | Server | **Externt**, via gateway | Läsande sökning (`read`/`search-type`) av [TKOrganization](StructureDefinition-tk-organization.html) och [TKEndpoint](StructureDefinition-tk-endpoint.html), inklusive sökparametern `listed-by`. |
| [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.html) | Server | **Endast internt** | Samma resurser som sök-API:et, plus skrivinteraktioner (`create`/`update`) och administratörsbehörigheter ([TKAdministratorRole](StructureDefinition-tk-administrator-role.html)). |

Denna IG definierar också ett prenumerationsämne för distribution till
lokala kataloger:
[SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.html)
— se "Distribution och synkronisering" i [REST-interaktioner](rest-interactions.html)
och REQ-DIST-*.

**Organization Endpoint Writer Capabilities** — CapabilityStatementet för
aktören Organization Endpoint Writer — är **inte** en artefakt i denna IG.
Den definieras och publiceras av E-hälsomyndigheten (EHM) i deras egen IG
([Swedish Medical Record Index And Endpoint Registry](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/),
canonical `http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er`).
Denna IG:s [Synkroniseringstjänst](ActorDefinition-tk-synkroniseringstjanst.html)
läser via vårt administrativa API och antar sedan den rollen mot EHM — se
[Roller och ansvar](roles-and-responsibilities.html) och
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html) för hur data
mappas mellan de två gränssnitten.

Fr.o.m. FHIR R5 kan `CapabilityStatement` uttrycka formella konformanskrav
per roll via elementet `obligations`, som ett maskinläsbart alternativ eller
komplement till de förväntningar som beskrivs under
[Roller och ansvar](roles-and-responsibilities.html) under Funktionellt.
Tjänstekatalogens administrativa API använder `kind = requirements`, i linje
med hur EHM:s eget CapabilityStatement för Organization Endpoint Writer är
definierat.
