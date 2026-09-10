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
Endpoint Writer, `REQ-MDL-*` övriga entiteter i informationsunderlaget och
avgränsningar, `REQ-EXP-*` exponering (externt sök-API vs. internt admin-API),
`REQ-ADM-*` administratörsbehörighet, `REQ-DIST-*` distribution/federering
till lokala kataloger, och `REQ-TRC-*` spårbarhet och transaktionell
registrering. De fyra sistnämnda grupperna är tillägg utöver det
ursprungliga informationsunderlaget — se [Mappning till profiler](mappings.html)
för respektive motivering, inklusive vilka som är stakeholder-beslutade och
vilka som tillkom efter jämförelse med en annan implementation av samma
problem.

---

### REQ-SRCH — Sökning av ändpunkter per organisation

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-SRCH-1 | SKA | Servern SKA stödja sökning av `Endpoint` via en sökparameter som returnerar samtliga ändpunkter en organisation listar via `Organization.endpoint` ("har"), skild från `managingOrganization`. | [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) |
| REQ-SRCH-2 | SKA | Ändpunktens URL SKA anges i `Endpoint.address`. | [TKEndpoint](StructureDefinition-tk-endpoint.html) |
| REQ-SRCH-3 | BÖR | Servern BÖR, per nyttolast, ange vilka interoperabilitetsspecifikationer ändpunkten stödjer. | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) |
| REQ-SRCH-4 | BÖR | Servern BÖR stödja sökning av `Endpoint` efter stödd interoperabilitetsspecifikation (`implements`). | [SearchParameter: implements](SearchParameter-tk-endpoint-implements.html) |

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
| REQ-ORG-5 | SKA | `Organization.identifier` SKA fungera som den "logiska adress" tjänstesökning slår upp. Ingen separat identifierare för detta införs. | [TKOrganization](StructureDefinition-tk-organization.html)`.identifier`, [TKSearchAPI](CapabilityStatement-tk-search-api.html) |

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
| REQ-WRT-5 | SKA | Organisationsidentifierare till EHM SKA vara organisationsnummer i EHM:s format (`urn:oid:2.5.4.97`, siffror utan bindestreck). Personnummer/samordningsnummer SKA INTE användas här — de hör till EHM:s patientindex, inte till denna IG:s scope. Se mappningstabellen. | [TKOrganization](StructureDefinition-tk-organization.html)`.identifier` |
| REQ-WRT-6 | SKA | Tjänstekatalogens admin-API SKA använda FHIR R5 (5.0.0) och JSON, liksom EHM:s gränssnitt. | [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html) |
| REQ-WRT-7 | SKA | Innan koppling till EHM SKA motsvarande `Endpoint` finnas hos EHM, mappad enligt EHM:s profil `endpoint-er`. | [TKEndpoint](StructureDefinition-tk-endpoint.html), EHM:s [Endpoint-profil](http://electronichealth.se/fhir/NDI/StructureDefinition/endpoint-er) |
| REQ-WRT-8 | SKA | Organisationen SKA finnas hos EHM, mappad enligt EHM:s profil `organization-er`. `Organization.type` saknar källa — se öppen fråga i mappings.html. | [TKOrganization](StructureDefinition-tk-organization.html), EHM:s [Organization-profil](http://electronichealth.se/fhir/NDI/StructureDefinition/organization-er) |

### REQ-MDL — Övriga entiteter i informationsunderlaget och avgränsningar

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-MDL-1 | BÖR | Indexpost BÖR modelleras för spårbarhet. REST-exponering ligger utanför detta utkast. | [TKIndexpost](StructureDefinition-tk-indexpost.html) (logisk modell) |
| REQ-MDL-2 | BÖR | Vård- och omsorgstagare BÖR modelleras för spårbarhet i förhållande till `Indexpost.avser`. Personuppgifter omfattas inte av detta API. | [TKVardOchOmsorgstagare](StructureDefinition-tk-vard-och-omsorgstagare.html) (logisk modell) |
| REQ-MDL-3 | SKA | Kopplingen Ändpunkt → API → API-specifikation SKA kunna uttryckas — dels via `Endpoint.payload` + extension (snabb sökbarhet), dels via en egen resurs, TKAPIInstance, som ger "API" egen identitet. | [TKEndpoint](StructureDefinition-tk-endpoint.html)`.payload`, [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html), [TKAPIInstance](StructureDefinition-tk-api-instance.html) |
| REQ-MDL-4 | SKA | API-specifikation SKA kunna registreras och sökas som en egen resurs — `CapabilityStatement` (kind=requirements), sökbar på kanonisk url. Ersätter denna IG:s tidigare `ImplementationGuide`-rekommendation; fortfarande inte `ActorDefinition` (EHM:s val, avvisat) eller `Basic`. | [TKAPISpecificationCapability](StructureDefinition-tk-api-specification-capability.html) |
| REQ-MDL-5 | SKA | Spårbarhet (vem skapade/senast uppdaterade en post) SKA finnas — löst via en obligatorisk Provenance-post per registrering (tidigare uppskjutet). | [TKProvenance](StructureDefinition-tk-provenance.html), REQ-TRC-1/2 |
| REQ-MDL-6 | BÖR | En API-instans (TKAPIInstance) BÖR kunna ange sin egen giltighetsperiod, oberoende av ändpunktens. | [TKAPIInstancePeriod](StructureDefinition-tk-api-instance-period.html) |
| REQ-MDL-7 | SKA | Varje TKAPIInstance SKA referera den ändpunkt som tillgängliggör den och den/de API-specifikationer den följer, sökbart via en egen sökparameter. | [TKAPIInstance](StructureDefinition-tk-api-instance.html), [SearchParameter: instantiates](SearchParameter-tk-capabilitystatement-instantiates.html) |

### REQ-EXP — Exponering: sök-API externt vs. admin-API internt

Stakeholder-beslut, inte del av det ursprungliga informationsunderlaget —
se "Avvikelser och tillägg" i [Mappning till profiler](mappings.html).

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-EXP-1 | SKA | Läsande sökning SKA exponeras externt, via gateway, för sökande konsumenter. | [TKSearchAPI](CapabilityStatement-tk-search-api.html) |
| REQ-EXP-2 | SKA | Skrivande interaktioner SKA vara internt exponerade endast, inte nåbara via den externa gatewayen. | [TKAdminAPI](CapabilityStatement-tk-admin-api.html) |

### REQ-ADM — Administratörsbehörighet

Stakeholder-beslut, inte del av det ursprungliga informationsunderlaget —
se "Avvikelser och tillägg" i [Mappning till profiler](mappings.html).

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-ADM-1 | SKA | Varje administratörsbehörighet SKA ange en administrationsnivå (`local-admin`/`central-admin`). | [TKAdministratorRole](StructureDefinition-tk-administrator-role.html)`.code` |
| REQ-ADM-2 | SKA (villkorat) | En `local-admin`-behörighet SKA ange representerad organisation, analogt med `Endpoint.managingOrganization`. `central-admin` utelämnar detta medvetet (= alla organisationer). | [TKAdministratorRole](StructureDefinition-tk-administrator-role.html)`.organization` |
| REQ-ADM-3 | BÖR | En administratörsbehörighet BÖR ange innehavare. | [TKAdministratorRole](StructureDefinition-tk-administrator-role.html)`.practitioner` |

### REQ-DIST — Distribution/federering till lokala kataloger

Stakeholder-beslut, inte del av det ursprungliga informationsunderlaget —
se "Avvikelser och tillägg" i [Mappning till profiler](mappings.html) och
"Distribution och synkronisering" i [REST-interaktioner](rest-interactions.html).

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-DIST-1 | BÖR | Servern BÖR stödja R5 topic-baserad `Subscription` mot ämnet `tk-organization-endpoint-changes`. | [SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.html) |
| REQ-DIST-2 | BÖR | Servern BÖR stödja grundladdning/återsynk via `_lastUpdated`. | [TKAdminAPI](CapabilityStatement-tk-admin-api.html) |
| REQ-DIST-3 | FÅR | Ett ursprungsmärke FÅR användas för att undvika rundgång i en dubbelriktad federerad miljö. Inte löst i detta utkast. | *(öppen fråga, se mappings.html)* |

### REQ-TRC — Spårbarhet och transaktionell registrering

Inte del av det ursprungliga informationsunderlaget — tillagt efter
jämförelse med en annan implementation av samma problem, som löser detta
med en obligatorisk Provenance-post i en transaction-Bundle. Se
"Avvikelser och tillägg" i [Mappning till profiler](mappings.html).

| Krav | Konformans | Beskrivning | Realiseras av |
|------|------------|-------------|----------------|
| REQ-TRC-1 | SKA | Varje transaction-Bundle som registrerar en Organization, Endpoint eller CapabilityStatement SKA innehålla minst en Provenance-post som pekar ut den/de registrerade resurserna. | [TKProvenance](StructureDefinition-tk-provenance.html) |
| REQ-TRC-2 | SKA | Tjänstekatalogens administrativa API SKA stödja systeminteraktionen `transaction`, så att en registrerad resurs och dess Provenance-post skapas/uppdateras atomiskt tillsammans. | [TKAdminAPI](CapabilityStatement-tk-admin-api.html) |

---

> **Vägledning för författare:** Håll krav atomära och spårbara — ett krav
> per rad, med en stabil nyckel som aldrig återanvänds även om kravet senare
> utgår (markera det då som `retired` i `Requirements`-resursen istället).
> Uppdatera `satisfiedBy` när en artefakt som realiserar ett krav byter namn
> eller id.
