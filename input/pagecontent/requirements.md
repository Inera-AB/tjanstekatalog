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
relationer på Organisation, `REQ-WRT-*` Organization Endpoint Writer, och
`REQ-MDL-*` övriga entiteter i informationsunderlaget och avgränsningar.

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
| REQ-ORG-2 | BÖR | Organisationsnumret BÖR anges som identifierare. Identifierarsystemets URI är i detta utkast ett antagande — se `aliases.fsh`. | [TKOrganization](StructureDefinition-tk-organization.html)`.identifier` |
| REQ-ORG-3 | SKA | En organisation SKA kunna lista ("har") de ändpunkter den listar i tjänstekatalogen. | [TKOrganization](StructureDefinition-tk-organization.html)`.endpoint`, [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) |
| REQ-ORG-4 | SKA | Varje ändpunkt SKA ange sin förvaltande organisation ("förvaltar"). | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.managingOrganization` |

### REQ-WRT — Organization Endpoint Writer

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-WRT-1 | FÅR | En Organization Endpoint Writer FÅR koppla en organisation till en ändpunkt via `$add-organization-to-endpoint`. | [OperationDefinition: add-organization-to-endpoint](OperationDefinition-tk-endpoint-add-organization-to-endpoint.html) |
| REQ-WRT-2 | FÅR | En Organization Endpoint Writer FÅR koppla loss en organisation från en ändpunkt via `$remove-organization-from-endpoint`. | [OperationDefinition: remove-organization-from-endpoint](OperationDefinition-tk-endpoint-remove-organization-from-endpoint.html) |
| REQ-WRT-3 | SKA | Det administrativa API:et och Organization Endpoint Writer-gränssnittet SKA använda FHIR R5 (5.0.0) och JSON. | [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html), [CapabilityStatement: Organization Endpoint Writer](CapabilityStatement-tk-organization-endpoint-writer.html) |

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
