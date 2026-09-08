# CapabilityStatement

Denna IG definierar ett formellt CapabilityStatement för sin egen serverroll:

| CapabilityStatement | Roll | Beskriver |
|---|---|---|
| [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.html) | Server | Tjänstekatalogens egna REST-förmågor: registrering och sökning av [TKOrganization](StructureDefinition-tk-organization.html) och [TKEndpoint](StructureDefinition-tk-endpoint.html), inklusive sökparametern `listed-by`. |

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
