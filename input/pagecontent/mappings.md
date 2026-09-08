# Mappning till profiler

Denna sida dokumenterar vilka delar av informationsunderlaget (se
[Informationsunderlag](information-basis.html)) som denna IG realiserar,
eventuella avvikelser i FHIR-realiseringen, samt hur enskilda element mappas
till element i motsvarande FHIR-profiler. Den omvända vyn — vilket krav varje
element realiserar — finns i [Kravkatalog](requirements.html); kravnycklarna
(`REQ-*`) nedan länkar dit.

---

### Omfattade delar

Denna IG realiserar entiteterna **Ändpunkt** och **Organisation**, inklusive
båda relationerna mellan dem ("förvaltar" och "har"), fullt ut som FHIR-
resurser med tillhörande sökparameter och skrivoperationer. Entiteterna
**API**, **API-specifikation**, **Indexpost** och **Vård- och
omsorgstagare** är modellerade som logiska modeller för spårbarhet, men är
inte (ännu) REST-exponerade i det administrativa API:et — se
"Avvikelser och tillägg" nedan för respektive entitet och
[Kravkatalog](requirements.html) (REQ-MDL-*) för status.

---

### Avvikelser och tillägg

Detta avsnitt dokumenterar var denna IG:s FHIR-realisering avviker från,
eller lägger till utöver, en bokstavlig läsning av informationsunderlaget —
inklusive ställen där vi gjort andra modelleringsval än de som syns i det
bifogade underlaget, i enlighet med anvisningen att sådana val ska
dokumenteras tydligt.

- **`organization` räcker inte för "har".** Standardsökparametern
  `organization` på `Endpoint` är definierad som `Endpoint.managingOrganization`
  ("förvaltar"). Den täcker inte "har"-relationen
  (`Organization.endpoint`) — att en organisation *listar* en ändpunkt i sin
  katalogpost oavsett vem som tekniskt förvaltar den. Denna IG inför istället
  en egen sökparameter, [`listed-by`](SearchParameter-tk-endpoint-listed-by.html),
  för "har". Se REQ-SRCH-1.

- **`listed-by` saknar en `.expression`, avsiktligt.** FHIRPath i
  `SearchParameter.expression` evalueras mot instanser av resursen i
  `.base` (här: `Endpoint`) och kan inte uttrycka en omvänd/korsresurs-slagning
  in i `Organization.endpoint`. Servrar SKA implementera `listed-by`
  likvärdigt med standardmekanismen `_has:Organization:endpoint:_id=[org-id]`.
  Se motiveringen i `SearchParameter-tk-endpoint-listed-by.fsh` och
  [Kravkatalog](requirements.html) REQ-SRCH-1.

- **`Endpoint.payload.profile` finns inte i R5.** Interoperabilitetsspecifikationer
  ("API följer API-specifikation") ska enligt uppdraget listas under
  ändpunkten och kan med fördel realiseras med extensions, som motsvarighet
  till det kommande elementet `Endpoint.payload.profile` (planerat i en
  senare FHIR-version). Denna IG definierar
  [`TKEndpointPayloadProfile`](StructureDefinition-tk-endpoint-payload-profile.html)
  som en repeterbar `canonical`-extension på `Endpoint.payload` i väntan på
  det elementet. Se REQ-SRCH-3.

- **Entiteten "API" realiseras inte som en egen resurs.** Informationsunderlaget
  ger "API" en egen giltighetsperiod (giltigFrom/giltigTom), skild från
  Ändpunktens. FHIR:s `Endpoint.payload` är en backbone-struktur utan egen
  identitet/id och utan eget periodelement — den kan inte bära en sådan
  självständig livscykel. Vi har valt att **inte** införa en separat
  resurs eller logisk modell för "API": `Endpoint.payload` (typ + vår
  `TKEndpointPayloadProfile`-extension) räcker för att uttrycka "Ändpunkt
  tillgängliggör API" och "API följer API-specifikation". Konsekvensen är
  att denna IG **inte** bär en separat giltighetsperiod per API — endast
  `Endpoint.period` (Ändpunktens egen giltighetstid) används. Detta är ett
  medvetet avsteg, inte en försummelse: se REQ-MDL-3. Implementatörer som
  behöver oberoende livscykler per API bör registrera separata
  `Endpoint`-instanser (en per API) tills vidare, eller lyfta frågan som ett
  ändringsförslag mot en framtida version av denna IG.

- **`säkerhetsmetod` och `urlTillAuktorisationsserver` saknar hemvist i
  basresursen `Endpoint`.** R5 `Endpoint` har inget element för vare sig
  säkerhetsmetod eller URL till auktorisationsserver. Denna IG inför två
  extensions för detta: [`TKEndpointSecurityMethod`](StructureDefinition-tk-endpoint-security-method.html)
  och [`TKEndpointAuthorizationServerUrl`](StructureDefinition-tk-endpoint-authorization-server-url.html).
  Kodverket för säkerhetsmetod ([TKEndpointSecurityMethodVS](ValueSet-tk-endpoint-security-method.html))
  är vårt eget preliminära förslag (example-bindning) — informationsunderlaget
  definierar ingen kontrollerad vokabulär för attributet. Se REQ-END-6,
  REQ-END-7.

- **Organisationsnummer-systemets URI är valt för att matcha EHM.**
  Identifierarsystemet för `Organisation.organisationsnummer`
  (`urn:oid:2.5.4.97`, se `aliases.fsh`) är hämtat från
  E-hälsomyndighetens (EHM) publicerade krav för sin Organization Endpoint
  Writer-operation (se "Mappning mot EHM:s Organization Endpoint Writer"
  nedan) — inte från ett internt Inera-beslut. En tidigare, ej verifierad
  gissning (`urn:oid:1.2.752.29.4.13`) är ersatt. Att återanvända samma
  system som EHM kräver innebär att `Organization.identifier`-värden inte
  behöver systemöversättas vid synkronisering, bara formatteras om
  (bindestreck bort). Inera bör ändå separat bekräfta att detta även är
  Ineras egna föredragna kanoniska system. Se REQ-ORG-2.

- **Ny identifierare för korrelation med EHM, utanför informationsunderlaget.**
  `TKEndpoint.identifier` har en tillagd slice, `ehmEndpointId`, som bär
  EHM:s eget logiska id för samma ändpunkt i deras register. Detta element
  finns inte i det ursprungliga informationsunderlaget, men krävs eftersom
  EHM:s `$add-organization`/`$remove-organization` adresserar ändpunkten via
  EHM:s eget id (se REQ-WRT-4 och mappningen mot EHM nedan). Systemet
  `http://electronichealth.se/fhir/NDI/Endpoint` är ett ANTAGET värde i
  väntan på bekräftelse av EHM:s faktiska bas-URL.

- **"Vård- och omsorgstagare" ges ingen egen FHIR-profil.** Informationsunderlaget
  ger entiteten ett enda attribut (id) utan ytterligare persondata — den
  fungerar som en opak pekare i modellen, inte som en plats för
  persondata. Vi har därför avstått från att införa en egen FHIR-resursprofil
  och representerar den enbart med en tunn logisk modell,
  [`TKVardOchOmsorgstagare`](StructureDefinition-tk-vard-och-omsorgstagare.html),
  som `Indexpost.avser` kan referera. Implementatörer som behöver faktiska
  persondata om en vård- och omsorgstagare får slå upp identifieraren mot
  Ineras patientvända tjänster, t.ex. en profil som
  [IneraPatient](StructureDefinition-IneraPatient.html) — vilket ligger
  utanför denna IG:s scope. Se REQ-MDL-2.

- **Indexpost, Vård- och omsorgstagare och API-specifikation exponeras inte
  via REST i detta utkast.** Det administrativa API:ets uppdrag i denna
  version är teknisk ändpunkts-/organisationsmetadata (Ändpunkt, Organisation
  och kopplingen dem emellan), inte personidentitet eller katalogisering av
  specifikationer i sig. En indexpost förväntas dessutom vara en
  serverhärledd sidoeffekt av att registrera en Organisation eller en Vård-
  och omsorgstagare, snarare än något en klient skapar direkt. Dessa tre
  entiteter är modellerade som logiska modeller för spårbarhet
  (se nedan), men REST-exponering (t.ex. API-specifikation som en profil på
  `Basic`) skjuts medvetet upp till en framtida version. Se REQ-MDL-1,
  REQ-MDL-2, REQ-MDL-4.

---

### Syfte med mappningarna

Mappningarna nedan spårar varje element i informationsmodellen till det
FHIR-profilelement (eller den logiska modell) som bär den informationen.
Detta gör det möjligt att verifiera täckning och vägleder implementatörer
som behöver förstå sambandet mellan verksamhetskrav och deras tekniska
representation. Se [Kravkatalog](requirements.html) för den formella,
maskinläsbara motsvarigheten (`Requirements.statement.satisfiedBy`).

---

### Mappningstabeller

#### Ändpunkt → [TKEndpoint](StructureDefinition-tk-endpoint.html)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKEndpoint.id](StructureDefinition-tk-endpoint.html) | REQ-END-1 |
| status | 1..1 | [TKEndpoint.status](StructureDefinition-tk-endpoint.html) | REQ-END-2 |
| namn | 1..1 | [TKEndpoint.name](StructureDefinition-tk-endpoint.html) | REQ-END-3 |
| adress | 1..1 | [TKEndpoint.address](StructureDefinition-tk-endpoint.html) | Ändpunktens URL. REQ-END-4, REQ-SRCH-2 |
| giltigFrom | 0..1 | [TKEndpoint.period.start](StructureDefinition-tk-endpoint.html) | REQ-END-5 |
| giltigTom | 0..1 | [TKEndpoint.period.end](StructureDefinition-tk-endpoint.html) | REQ-END-5 |
| protokoll | 1..* | [TKEndpoint.connectionType](StructureDefinition-tk-endpoint.html) | REQ-END-8 |
| säkerhetsmetod | 0..1 | [TKEndpointSecurityMethod](StructureDefinition-tk-endpoint-security-method.html) (extension) | Preliminärt kodverk. REQ-END-6 |
| urlTillAuktorisationsserver | 0..1 | [TKEndpointAuthorizationServerUrl](StructureDefinition-tk-endpoint-authorization-server-url.html) (extension) | REQ-END-7 |
| *(förvaltar)* | 1..1 | [TKEndpoint.managingOrganization](StructureDefinition-tk-endpoint.html) | Relation till Organisation. REQ-ORG-4 |
| *(tillgängliggör → API → följer → API-specifikation)* | 0..* | [TKEndpoint.payload](StructureDefinition-tk-endpoint.html) + [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) | Se avsteg ovan. REQ-MDL-3, REQ-SRCH-3 |

#### Organisation → [TKOrganization](StructureDefinition-tk-organization.html)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKOrganization.id](StructureDefinition-tk-organization.html) | REQ-ORG-1 |
| namn | 1..1 | [TKOrganization.name](StructureDefinition-tk-organization.html) | REQ-ORG-1 |
| organisationsnummer | 0..1 | [TKOrganization.identifier](StructureDefinition-tk-organization.html) (slice `organisationsnummer`) | Identifierarsystem valt för EHM-kompatibilitet, se avsteg ovan. REQ-ORG-2 |
| *(har)* | 0..* | [TKOrganization.endpoint](StructureDefinition-tk-organization.html) | Sökbar via `listed-by`. REQ-ORG-3, REQ-SRCH-1 |

#### Indexpost → [TKIndexpost](StructureDefinition-tk-indexpost.html) (logisk modell, ej REST-exponerad)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKIndexpost.id](StructureDefinition-tk-indexpost.html) | REQ-MDL-1 |
| registreringstidpunkt | 1..1 | [TKIndexpost.registreringstidpunkt](StructureDefinition-tk-indexpost.html) | REQ-MDL-1 |
| avser | 1..1 | [TKIndexpost.avser](StructureDefinition-tk-indexpost.html) | Reference(TKOrganization &#124; TKVardOchOmsorgstagare). REQ-MDL-1, REQ-MDL-2 |

#### Vård- och omsorgstagare → [TKVardOchOmsorgstagare](StructureDefinition-tk-vard-och-omsorgstagare.html) (logisk modell, ej REST-exponerad)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKVardOchOmsorgstagare.id](StructureDefinition-tk-vard-och-omsorgstagare.html) | REQ-MDL-2 |

#### API-specifikation → [TKAPISpecification](StructureDefinition-tk-api-specification.html) (logisk modell, ej REST-exponerad)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKAPISpecification.id](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |
| kanoniskUrl | 1..1 | [TKAPISpecification.kanoniskUrl](StructureDefinition-tk-api-specification.html) | Förväntas matcha värdet i `TKEndpointPayloadProfile`. REQ-MDL-4, REQ-SRCH-3 |
| status | 1..1 | [TKAPISpecification.status](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |
| maskinläsbartNamn | 0..1 | [TKAPISpecification.maskinlasbartNamn](StructureDefinition-tk-api-specification.html) | ASCII-elementnamn i FSH, se profilen. REQ-MDL-4 |
| version | 0..1 | [TKAPISpecification.version](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |
| referensTillKälla | 0..1 | [TKAPISpecification.referensTillKalla](StructureDefinition-tk-api-specification.html) | ASCII-elementnamn i FSH, se profilen. REQ-MDL-4 |
| kategori | 0..1 | [TKAPISpecification.kategori](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |
| titel | 1..1 | [TKAPISpecification.titel](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |
| beskrivning | 0..1 | [TKAPISpecification.beskrivning](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |
| ansvarigUtgivare | 0..1 | [TKAPISpecification.ansvarigUtgivare](StructureDefinition-tk-api-specification.html) | Reference(TKOrganization). REQ-MDL-4 |
| utgivningsdatum | 0..1 | [TKAPISpecification.utgivningsdatum](StructureDefinition-tk-api-specification.html) | REQ-MDL-4 |

#### API (join-entitet) → *ingen egen resurs*

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| giltigFrom | — | *Ej separat realiserat* | Se avsteg ovan — `Endpoint.period` används istället. REQ-MDL-3 |
| giltigTom | — | *Ej separat realiserat* | Se avsteg ovan — `Endpoint.period` används istället. REQ-MDL-3 |
| *(tillgängliggörs av Ändpunkt)* | 0..* | [TKEndpoint.payload](StructureDefinition-tk-endpoint.html) | REQ-MDL-3 |
| *(följer API-specifikation)* | 0..* | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) | REQ-MDL-3, REQ-SRCH-3 |

---

### Mappning mot EHM:s Organization Endpoint Writer

Detta avsnitt är inte en mappning mellan informationsunderlaget och denna
IG:s egna profiler (som avsnitten ovan) — det är en mappning mellan **denna
IG:s** data och **E-hälsomyndighetens (EHM)** API-struktur, för den aktör
som läser härifrån och skriver dit.

#### Roller och flöde

"Organization Endpoint Writer" är **EHM:s egen aktörsroll**, definierad i
deras IG ([Swedish Medical Record Index And Endpoint Registry](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/)),
inte en roll tjänstekatalogens administrativa API själv implementerar eller
tar emot anrop som. Rollen antas av en fristående
**Synkroniseringstjänst** (se [ActorDefinition](ActorDefinition-tk-synkroniseringstjanst.html)
och [Roller och ansvar](roles-and-responsibilities.html)), som:

1. läser organisationer och ändpunkter från tjänstekatalogens administrativa
   API (se [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html)),
   särskilt vilka ändpunkter en organisation listar via
   [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html);
2. säkerställer att motsvarande `Endpoint`-resurs finns hos EHM (skapande/
   uppdatering av själva ändpunkten hos EHM via deras generella FHIR REST-
   gränssnitt — **ej detaljerat mappat här ännu**, se öppen fråga nedan);
3. anropar EHM:s `$add-organization`/`$remove-organization`, i rollen
   Organization Endpoint Writer, för att koppla/koppla loss en organisation
   till/från den ändpunkten hos EHM.

EHM:s artefakter (definierade i deras IG, **inte omdefinierade i denna IG**
— vi återpublicerar aldrig någon annans canonical-resurser under vår egen
namnrymd):

| Artefakt | Kanonisk URL (EHM) |
|---|---|
| ActorDefinition: Organization Endpoint Writer Actor | `http://electronichealth.se/fhir/NDI/ActorDefinition/organization-endpoint-writer-actor-er` |
| CapabilityStatement: Organization Endpoint Writer Capabilities | `http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er` |
| OperationDefinition (id/canonical) | `http://electronichealth.se/fhir/NDI/OperationDefinition/AddOrganizationToEndpoint` / `.../RemoveOrganizationFromEndpoint` |
| Faktisk anropsväg ($-kod, bekräftad separat från canonical ovan) | `POST [base]/Endpoint/[id]/$add-organization` / `$remove-organization` |

EHM:s CapabilityStatement använder `kind = requirements` och konformansnivå
MAY på både resursen och båda operationerna (`capabilitystatement-expectation`)
— samma mönster som denna IG:s [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html)
använder.

#### Mappningstabell: `$add-organization` / `$remove-organization`

Båda operationerna har samma parameterstruktur (skillnaden är bara om
organisationen läggs till eller tas bort).

| EHM-parameter | Kard. | Typ | Källa i tjänstekatalogen | Transformation |
|---|---|---|---|---|
| `id` (URL-segment, EHM:s Endpoint-id) | 1..1 | `string` (UUID) | [TKEndpoint.identifier](StructureDefinition-tk-endpoint.html)\[`ehmEndpointId`\] | Ingen — värdet SKA redan vara EHM:s tilldelade id (se REQ-WRT-4). Om det saknas kan operationen inte anropas — ändpunkten måste först finnas hos EHM (steg 2 i flödet ovan). |
| `organization` (body, `Parameters`) | 1..1 | `Identifier` (system + value) | [TKOrganization.identifier](StructureDefinition-tk-organization.html)\[`organisationsnummer`\] | Systemet `urn:oid:2.5.4.97` matchar redan (se avsteg ovan) — bara bindestrecket i värdet ("232100-0016" → "2321000016") behöver tas bort. Alternativt kan personnummer/samordningsnummer användas om organisationen identifieras så istället (samma system som `$personnummer`/`$samordningsnummer` i `aliases.fsh`, redan matchande). |
| *(retur)* `return` | 1..1 | `OperationOutcome` | — | Ingen resurs returneras (varken uppdaterad Organization eller Endpoint) — bara en `OperationOutcome` med en framgångs-, informations- eller felkod. Se svarshantering nedan. |

Exempel på anropskropp (organisationsnummer, bindestreck borttaget):

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "organization",
      "valueIdentifier": {
        "system": "urn:oid:2.5.4.97",
        "value": "2321000016"
      }
    }
  ]
}
```

#### Svarshantering

EHM:s operationer är idempotenta och signalerar det via `OperationOutcome`,
inte via HTTP-statuskod ensam:

| EHM-kod | Severity | Betydelse | Hur synkroniseringstjänsten bör agera |
|---|---|---|---|
| `4-38-301` | success | Organisationen lades till | Klart. |
| `4-38-302` | success | Organisationen togs bort | Klart. |
| `4-38-303` | information | Organisationen fanns redan kopplad | Behandla som lyckat (idempotent) — inte ett fel. |
| `4-38-304` | information | Organisationen var redan bortkopplad | Behandla som lyckat (idempotent) — inte ett fel. |
| `2-38-1`, `2-38-8`, `2-38-9`, `2-38-4`, `2-38-2`, `2-44-X`, `2-38-7` | error | Se EHM:s fullständiga felkodskatalog | Verkligt fel — vanligast: fel identifierarsystem/format (`2-38-4`/`2-38-2`/`2-38-7`/`2-44-X`) eller okänt `id` (`2-38-8`). Kontrollera mappningen ovan innan omförsök. |

Se [Felhantering](error-handling.html) för tjänstekatalogens egen
felhantering — EHM:s felkodskatalog är separat och dokumenteras i sin helhet
i deras egen IG.

#### Öppna frågor

- **Hur EHM:s egen `Endpoint`-resurs ska skapas/uppdateras** (steg 2 i
  flödet ovan) — dvs. mappningen av `TKEndpoint.address`, `.period`,
  `.connectionType`, `.payload` m.fl. mot EHM:s `Endpoint`-profil — är inte
  dokumenterad här ännu. EHM:s "Query operations"-sida bekräftar generell
  `GET [base]/Endpoint`-sökning (inklusive `_revinclude=Organization:endpoint`
  och en `actor`-sökparameter för interoperabilitetsspecifikation, ett annat
  mönster än denna IG:s `payload`-extension), men inte den fullständiga
  skrivkontraktet. Behövs för att slutföra flödet.
- **Bas-URL:en för `identifier[ehmEndpointId].system`**
  (`http://electronichealth.se/fhir/NDI/Endpoint`) är ett antagande baserat
  på mönstret i EHM:s övriga canonical-URL:er, inte bekräftat mot EHM:s
  faktiska serveradress.
- **Om Inera bekräftar `urn:oid:2.5.4.97`** som sitt eget föredragna system
  för organisationsnummer, kan noteringen om att det är "valt för
  EHM-kompatibilitet" tas bort — se REQ-ORG-2.

---

### Omappade element

| Modellelement | Orsak till att det inte mappas |
|----------------|-------------------------------|
| API.id | Modellen ger inte "API" ett eget id-attribut — se avsteg ovan; entiteten realiseras helt via `Endpoint.payload`, som saknar egen identitet. |

---

> **Vägledning för författare:** Håll mappningarna uppdaterade i takt med
> att profilerna utvecklas. Mappningar kan också uttryckas med FHIR
> `ConceptMap`-resurser om maskinbearbetningsbar representation behövs.
