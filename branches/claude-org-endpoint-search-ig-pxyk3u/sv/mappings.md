# Mappning till profiler - Tjänstekatalogen v0.1.0

## Mappning till profiler

# Mappning till profiler

Denna sida dokumenterar vilka delar av informationsunderlaget (se [Informationsunderlag](information-basis.md)) som denna IG realiserar, eventuella avvikelser i FHIR-realiseringen, samt hur enskilda element mappas till element i motsvarande FHIR-profiler. Den omvända vyn — vilket krav varje element realiserar — finns i [Kravkatalog](requirements.md); kravnycklarna (`REQ-*`) nedan länkar dit.

-------

### Omfattade delar

Denna IG realiserar entiteterna **Ändpunkt** och **Organisation**, inklusive båda relationerna mellan dem ("förvaltar" och "har"), fullt ut som FHIR- resurser med tillhörande sökparameter och skrivoperationer. Entiteterna **API**, **API-specifikation**, **Indexpost** och **Vård- och omsorgstagare** är modellerade som logiska modeller för spårbarhet, men är inte (ännu) REST-exponerade i det administrativa API:et — se "Avvikelser och tillägg" nedan för respektive entitet och [Kravkatalog](requirements.md) (REQ-MDL-*) för status.

-------

### Avvikelser och tillägg

Detta avsnitt dokumenterar var denna IG:s FHIR-realisering avviker från, eller lägger till utöver, en bokstavlig läsning av informationsunderlaget — inklusive ställen där vi gjort andra modelleringsval än de som syns i det bifogade underlaget, i enlighet med anvisningen att sådana val ska dokumenteras tydligt.

* **`organization` räcker inte för "har".** Standardsökparametern `organization` på `Endpoint` är definierad som `Endpoint.managingOrganization` ("förvaltar"). Den täcker inte "har"-relationen (`Organization.endpoint`) — att en organisation **listar** en ändpunkt i sin katalogpost oavsett vem som tekniskt förvaltar den. Denna IG inför istället en egen sökparameter, [`listed-by`](SearchParameter-tk-endpoint-listed-by.md), för "har". Se REQ-SRCH-1.
* **`listed-by` saknar en `.expression`, avsiktligt.** FHIRPath i `SearchParameter.expression` evalueras mot instanser av resursen i `.base` (här: `Endpoint`) och kan inte uttrycka en omvänd/korsresurs-slagning in i `Organization.endpoint`. Servrar SKA implementera `listed-by` likvärdigt med standardmekanismen `_has:Organization:endpoint:_id=[org-id]`. Se motiveringen i `SearchParameter-tk-endpoint-listed-by.fsh` och [Kravkatalog](requirements.md) REQ-SRCH-1.
* **`Endpoint.payload.profile` finns inte i R5.** Interoperabilitetsspecifikationer ("API följer API-specifikation") ska enligt uppdraget listas under ändpunkten och kan med fördel realiseras med extensions, som motsvarighet till det kommande elementet `Endpoint.payload.profile` (planerat i en senare FHIR-version). Denna IG definierar [`TKEndpointPayloadProfile`](StructureDefinition-tk-endpoint-payload-profile.md) som en repeterbar `canonical`-extension på `Endpoint.payload` i väntan på det elementet. Se REQ-SRCH-3.
* **Entiteten "API" realiseras inte som en egen resurs.** Informationsunderlaget ger "API" en egen giltighetsperiod (giltigFrom/giltigTom), skild från Ändpunktens. FHIR:s `Endpoint.payload` är en backbone-struktur utan egen identitet/id och utan eget periodelement — den kan inte bära en sådan självständig livscykel. Vi har valt att **inte** införa en separat resurs eller logisk modell för "API": `Endpoint.payload` (typ + vår `TKEndpointPayloadProfile`-extension) räcker för att uttrycka "Ändpunkt tillgängliggör API" och "API följer API-specifikation". Konsekvensen är att denna IG **inte** bär en separat giltighetsperiod per API — endast `Endpoint.period` (Ändpunktens egen giltighetstid) används. Detta är ett medvetet avsteg, inte en försummelse: se REQ-MDL-3. Implementatörer som behöver oberoende livscykler per API bör registrera separata `Endpoint`-instanser (en per API) tills vidare, eller lyfta frågan som ett ändringsförslag mot en framtida version av denna IG.
* **`säkerhetsmetod` och `urlTillAuktorisationsserver` saknar hemvist i basresursen `Endpoint`.** R5 `Endpoint` har inget element för vare sig säkerhetsmetod eller URL till auktorisationsserver. Denna IG inför två extensions för detta: [`TKEndpointSecurityMethod`](StructureDefinition-tk-endpoint-security-method.md) och [`TKEndpointAuthorizationServerUrl`](StructureDefinition-tk-endpoint-authorization-server-url.md). Kodverket för säkerhetsmetod ([TKEndpointSecurityMethodVS](ValueSet-tk-endpoint-security-method.md)) är vårt eget preliminära förslag (example-bindning) — informationsunderlaget definierar ingen kontrollerad vokabulär för attributet. Se REQ-END-6, REQ-END-7.
* **Organisationsnummer-systemets URI är ett antagande.** Identifierarsystemet som används för `Organisation.organisationsnummer` (`urn:oid:1.2.752.29.4.13`, se `aliases.fsh`) är **inte verifierat** mot Ineras auktoritativa OID/URI-register i denna omgång. Det ska bekräftas — eller ersättas — innan implementation påbörjas. Se REQ-ORG-2.
* **"Vård- och omsorgstagare" ges ingen egen FHIR-profil.** Informationsunderlaget ger entiteten ett enda attribut (id) utan ytterligare persondata — den fungerar som en opak pekare i modellen, inte som en plats för persondata. Vi har därför avstått från att införa en egen FHIR-resursprofil och representerar den enbart med en tunn logisk modell, [`TKVardOchOmsorgstagare`](StructureDefinition-tk-vard-och-omsorgstagare.md), som `Indexpost.avser` kan referera. Implementatörer som behöver faktiska persondata om en vård- och omsorgstagare får slå upp identifieraren mot Ineras patientvända tjänster, t.ex. en profil som [IneraPatient](StructureDefinition-IneraPatient.md) — vilket ligger utanför denna IG:s scope. Se REQ-MDL-2.
* **Indexpost, Vård- och omsorgstagare och API-specifikation exponeras inte via REST i detta utkast.** Det administrativa API:ets uppdrag i denna version är teknisk ändpunkts-/organisationsmetadata (Ändpunkt, Organisation och kopplingen dem emellan), inte personidentitet eller katalogisering av specifikationer i sig. En indexpost förväntas dessutom vara en serverhärledd sidoeffekt av att registrera en Organisation eller en Vård- och omsorgstagare, snarare än något en klient skapar direkt. Dessa tre entiteter är modellerade som logiska modeller för spårbarhet (se nedan), men REST-exponering (t.ex. API-specifikation som en profil på `Basic`) skjuts medvetet upp till en framtida version. Se REQ-MDL-1, REQ-MDL-2, REQ-MDL-4.

-------

### Syfte med mappningarna

Mappningarna nedan spårar varje element i informationsmodellen till det FHIR-profilelement (eller den logiska modell) som bär den informationen. Detta gör det möjligt att verifiera täckning och vägleder implementatörer som behöver förstå sambandet mellan verksamhetskrav och deras tekniska representation. Se [Kravkatalog](requirements.md) för den formella, maskinläsbara motsvarigheten (`Requirements.statement.satisfiedBy`).

-------

### Mappningstabeller

#### Ändpunkt → TKEndpoint

| | | | |
| :--- | :--- | :--- | :--- |
| id | 1..1 | [TKEndpoint.id](StructureDefinition-tk-endpoint.md) | REQ-END-1 |
| status | 1..1 | [TKEndpoint.status](StructureDefinition-tk-endpoint.md) | REQ-END-2 |
| namn | 1..1 | [TKEndpoint.name](StructureDefinition-tk-endpoint.md) | REQ-END-3 |
| adress | 1..1 | [TKEndpoint.address](StructureDefinition-tk-endpoint.md) | Ändpunktens URL. REQ-END-4, REQ-SRCH-2 |
| giltigFrom | 0..1 | [TKEndpoint.period.start](StructureDefinition-tk-endpoint.md) | REQ-END-5 |
| giltigTom | 0..1 | [TKEndpoint.period.end](StructureDefinition-tk-endpoint.md) | REQ-END-5 |
| protokoll | 1..* | [TKEndpoint.connectionType](StructureDefinition-tk-endpoint.md) | REQ-END-8 |
| säkerhetsmetod | 0..1 | [TKEndpointSecurityMethod](StructureDefinition-tk-endpoint-security-method.md)(extension) | Preliminärt kodverk. REQ-END-6 |
| urlTillAuktorisationsserver | 0..1 | [TKEndpointAuthorizationServerUrl](StructureDefinition-tk-endpoint-authorization-server-url.md)(extension) | REQ-END-7 |
| **(förvaltar)** | 1..1 | [TKEndpoint.managingOrganization](StructureDefinition-tk-endpoint.md) | Relation till Organisation. REQ-ORG-4 |
| **(tillgängliggör → API → följer → API-specifikation)** | 0..* | [TKEndpoint.payload](StructureDefinition-tk-endpoint.md)+[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.md) | Se avsteg ovan. REQ-MDL-3, REQ-SRCH-3 |

#### Organisation → TKOrganization

| | | | |
| :--- | :--- | :--- | :--- |
| id | 1..1 | [TKOrganization.id](StructureDefinition-tk-organization.md) | REQ-ORG-1 |
| namn | 1..1 | [TKOrganization.name](StructureDefinition-tk-organization.md) | REQ-ORG-1 |
| organisationsnummer | 0..1 | [TKOrganization.identifier](StructureDefinition-tk-organization.md)(slice`organisationsnummer`) | Identifierarsystem antaget, se avsteg ovan. REQ-ORG-2 |
| **(har)** | 0..* | [TKOrganization.endpoint](StructureDefinition-tk-organization.md) | Sökbar via`listed-by`. REQ-ORG-3, REQ-SRCH-1 |

#### Indexpost → TKIndexpost (logisk modell, ej REST-exponerad)

| | | | |
| :--- | :--- | :--- | :--- |
| id | 1..1 | [TKIndexpost.id](StructureDefinition-tk-indexpost.md) | REQ-MDL-1 |
| registreringstidpunkt | 1..1 | [TKIndexpost.registreringstidpunkt](StructureDefinition-tk-indexpost.md) | REQ-MDL-1 |
| avser | 1..1 | [TKIndexpost.avser](StructureDefinition-tk-indexpost.md) | Reference(TKOrganization | TKVardOchOmsorgstagare). REQ-MDL-1, REQ-MDL-2 |

#### Vård- och omsorgstagare → TKVardOchOmsorgstagare (logisk modell, ej REST-exponerad)

| | | | |
| :--- | :--- | :--- | :--- |
| id | 1..1 | [TKVardOchOmsorgstagare.id](StructureDefinition-tk-vard-och-omsorgstagare.md) | REQ-MDL-2 |

#### API-specifikation → TKAPISpecification (logisk modell, ej REST-exponerad)

| | | | |
| :--- | :--- | :--- | :--- |
| id | 1..1 | [TKAPISpecification.id](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |
| kanoniskUrl | 1..1 | [TKAPISpecification.kanoniskUrl](StructureDefinition-tk-api-specification.md) | Förväntas matcha värdet i`TKEndpointPayloadProfile`. REQ-MDL-4, REQ-SRCH-3 |
| status | 1..1 | [TKAPISpecification.status](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |
| maskinläsbartNamn | 0..1 | [TKAPISpecification.maskinlasbartNamn](StructureDefinition-tk-api-specification.md) | ASCII-elementnamn i FSH, se profilen. REQ-MDL-4 |
| version | 0..1 | [TKAPISpecification.version](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |
| referensTillKälla | 0..1 | [TKAPISpecification.referensTillKalla](StructureDefinition-tk-api-specification.md) | ASCII-elementnamn i FSH, se profilen. REQ-MDL-4 |
| kategori | 0..1 | [TKAPISpecification.kategori](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |
| titel | 1..1 | [TKAPISpecification.titel](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |
| beskrivning | 0..1 | [TKAPISpecification.beskrivning](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |
| ansvarigUtgivare | 0..1 | [TKAPISpecification.ansvarigUtgivare](StructureDefinition-tk-api-specification.md) | Reference(TKOrganization). REQ-MDL-4 |
| utgivningsdatum | 0..1 | [TKAPISpecification.utgivningsdatum](StructureDefinition-tk-api-specification.md) | REQ-MDL-4 |

#### API (join-entitet) → ingen egen resurs

| | | | |
| :--- | :--- | :--- | :--- |
| giltigFrom | — | **Ej separat realiserat** | Se avsteg ovan —`Endpoint.period`används istället. REQ-MDL-3 |
| giltigTom | — | **Ej separat realiserat** | Se avsteg ovan —`Endpoint.period`används istället. REQ-MDL-3 |
| **(tillgängliggörs av Ändpunkt)** | 0..* | [TKEndpoint.payload](StructureDefinition-tk-endpoint.md) | REQ-MDL-3 |
| **(följer API-specifikation)** | 0..* | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.md) | REQ-MDL-3, REQ-SRCH-3 |

-------

### Omappade element

| | |
| :--- | :--- |
| API.id | Modellen ger inte "API" ett eget id-attribut — se avsteg ovan; entiteten realiseras helt via`Endpoint.payload`, som saknar egen identitet. |

-------

> **Vägledning för författare:** Håll mappningarna uppdaterade i takt med att profilerna utvecklas. Mappningar kan också uttryckas med FHIR `ConceptMap`-resurser om maskinbearbetningsbar representation behövs.

