# Kravkatalog

Denna sida är den läsbara vyn av den formella kravkatalogen, uttryckt som en
FHIR R5 [`Requirements`](Requirements-tk-tjanstekatalog-requirements.html)-resurs.
Varje krav har en stabil nyckel (t.ex. `REQ-SRCH-1`) och en konformansnivå
(SKA/BÖR/FÅR, motsvarande SHALL/SHOULD/MAY) och spåras via `satisfiedBy` till
den eller de FHIR-artefakter (profilelement, extension, sökparameter,
operation) som realiserar kravet — se länkarna i tabellerna nedan. Den
omvända vyn, från attribut/profilelement till krav, finns i
[Mappning till profiler](mappings.html).

Krav grupperas efter ämne: `REQ-SRCH-*` sökning av ändpunkter per
organisation, `REQ-END-*` attribut på Ändpunkt, `REQ-ORG-*` attribut och
relationer på Organisation, `REQ-WRT-*` synkronisering mot EHM:s Organization
Endpoint Writer, och `REQ-MDL-*` övriga entiteter i informationsunderlaget
och avgränsningar.

---

### REQ-SRCH — Sökning av ändpunkter per organisation

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-SRCH-1 | SKA | Servern SKA stödja sökning av `Endpoint` via en sökparameter som returnerar samtliga ändpunkter en organisation listar via `Organization.endpoint` ("har"), skild från `managingOrganization`. | [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) |
| REQ-SRCH-2 | SKA | Ändpunktens URL SKA anges i `Endpoint.address`. | [TKEndpoint](StructureDefinition-tk-endpoint.html) |
| REQ-SRCH-3 | BÖR | Servern BÖR, per nyttolast, ange vilka interoperabilitetsspecifikationer ändpunkten stödjer. | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) |

### REQ-END — Attribut på Ändpunkt

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-END-1 | SKA | Varje ändpunkt SKA ha ett unikt id. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.id` |
| REQ-END-2 | SKA | Ändpunktens status SKA anges. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.status` |
| REQ-END-3 | SKA | Ändpunktens namn SKA anges. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.name` |
| REQ-END-4 | SKA | Ändpunktens URL SKA anges. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.address` |
| REQ-END-5 | BÖR | Ändpunktens giltighetsperiod BÖR anges. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.period` |
| REQ-END-6 | BÖR | Ändpunktens säkerhetsmetod BÖR anges. Kodverket är preliminärt (example-bindning). | [TKEndpointSecurityMethod](StructureDefinition-tk-endpoint-security-method.html) |
| REQ-END-7 | BÖR (villkorat) | Om säkerhetsmetoden är OAuth 2.0-baserad BÖR URL till auktorisationsserverns token-endpoint anges. | [TKEndpointAuthorizationServerUrl](StructureDefinition-tk-endpoint-authorization-server-url.html) |
| REQ-END-8 | SKA | Minst ett protokoll ändpunkten stödjer SKA anges. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.connectionType` |

### REQ-ORG — Attribut och relationer på Organisation

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-ORG-1 | SKA | Varje organisation SKA ha ett unikt id och namn. | [TKOrganization](StructureDefinition-tk-organization.html) |
| REQ-ORG-2 | BÖR | Organisationsnumret BÖR anges som identifierare, med systemet `urn:oid:2.5.4.97` (valt för att matcha vad EHM:s Organization Endpoint Writer kräver — se mappings.html). Inera bör separat bekräfta att detta även är Ineras eget föredragna system. | [TKOrganization](StructureDefinition-tk-organization.html)`.identifier` |
| REQ-ORG-3 | SKA | En organisation SKA kunna lista ("har") de ändpunkter den listar i tjänstekatalogen. | [TKOrganization](StructureDefinition-tk-organization.html)`.endpoint`, [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) |
| REQ-ORG-4 | SKA | Varje ändpunkt SKA ange sin förvaltande organisation ("förvaltar"). | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.managingOrganization` |

### REQ-WRT — Synkronisering mot EHM:s Organization Endpoint Writer

Organization Endpoint Writer är E-hälsomyndighetens (EHM) egen aktörsroll,
inte en roll tjänstekatalogens administrativa API implementerar — se
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html).

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-WRT-1 | SKA | Synkroniseringstjänsten SKA läsa organisationer/ändpunkter via tjänstekatalogens admin-API, särskilt `listed-by`. | [ActorDefinition: Synkroniseringstjänst](ActorDefinition-tk-synkroniseringstjanst.html), [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html) |
| REQ-WRT-2 | FÅR | Synkroniseringstjänsten FÅR, som Organization Endpoint Writer hos EHM, anropa EHM:s `$add-organization`. | EHM:s [CapabilityStatement](http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er) och OperationDefinition (extern, ej del av denna IG) |
| REQ-WRT-3 | FÅR | Synkroniseringstjänsten FÅR anropa EHM:s `$remove-organization` analogt. | Som REQ-WRT-2 |
| REQ-WRT-4 | SKA | Ändpunkter SKA kunna korreleras med EHM:s eget Endpoint-id, eftersom EHM:s operationer adresserar via deras id. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.identifier` (slice `ehmEndpointId`) |
| REQ-WRT-5 | SKA | Organisationsidentifierare till EHM SKA vara i EHM:s format (rätt system, siffror utan bindestreck) — se mappningstabellen. | [TKOrganization](StructureDefinition-tk-organization.html)`.identifier` |
| REQ-WRT-6 | SKA | Tjänstekatalogens admin-API SKA använda FHIR R5 (5.0.0) och JSON, liksom EHM:s gränssnitt. | [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html) |

### REQ-MDL — Övriga entiteter i informationsunderlaget och avgränsningar

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-MDL-1 | BÖR | Indexpost BÖR modelleras för spårbarhet. REST-exponering ligger utanför detta utkast. | [TKIndexpost](StructureDefinition-tk-indexpost.html) (logisk modell) |
| REQ-MDL-2 | BÖR | Vård- och omsorgstagare BÖR modelleras för spårbarhet i förhållande till `Indexpost.avser`. Personuppgifter omfattas inte av detta API. | [TKVardOchOmsorgstagare](StructureDefinition-tk-vard-och-omsorgstagare.html) (logisk modell) |
| REQ-MDL-3 | SKA | Kopplingen Ändpunkt → API → API-specifikation SKA kunna uttryckas. Realiseras via `Endpoint.payload` + extension, inte som egen resurs. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.payload`, [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) |
| REQ-MDL-4 | BÖR | API-specifikation BÖR modelleras för spårbarhet. Beslut om REST-exponering skjuts upp till en framtida version. | [TKAPISpecification](StructureDefinition-tk-api-specification.html) (logisk modell) |

---

> **Vägledning för författare:** Håll krav atomära och spårbara — ett krav
> per rad, med en stabil nyckel som aldrig återanvänds även om kravet senare
> utgår (markera det då som `retired` i `Requirements`-resursen istället).
> Uppdatera `satisfiedBy` när en artefakt som realiserar ett krav byter namn
> eller id.
