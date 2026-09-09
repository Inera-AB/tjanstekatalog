# Mappning till profiler

Denna sida dokumenterar vilka delar av informationsunderlaget (se
[Informationsunderlag](information-basis.html)) som denna IG realiserar,
eventuella avvikelser i FHIR-realiseringen, samt hur enskilda element mappas
till element i motsvarande FHIR-profiler. Den omvända vyn — vilket krav varje
element realiserar — finns i [Kravkatalog](requirements.html); kravnycklarna
(`REQ-*`) nedan länkar dit.

---

### Omfattade delar

Denna IG realiserar entiteterna **Ändpunkt**, **Organisation**, **API** och
**API-specifikation** fullt ut som FHIR-resurser med tillhörande
sökparameter och skrivoperationer, inklusive båda relationerna mellan
Ändpunkt och Organisation ("förvaltar" och "har"). Entiteterna **Indexpost**
och **Vård- och omsorgstagare** är modellerade som logiska modeller för
spårbarhet, men är inte (ännu) REST-exponerade i det administrativa API:et
— se "Avvikelser och tillägg" nedan och [Kravkatalog](requirements.html)
(REQ-MDL-1/2) för status.

API och API-specifikation var tidigare också logisk-modell-/extension-
endast (REST-exponering uppskjuten respektive helt utelämnad); båda
uppgraderades efter jämförelse med en annan implementation av samma
problem — se "Avvikelser och tillägg" nedan.

Utöver informationsunderlagets sex entiteter realiserar denna IG ytterligare
tillägg (se respektive punkt nedan under "Avvikelser och tillägg"):
**administratörsbehörighet**
([TKAdministratorRole](StructureDefinition-tk-administrator-role.html)),
**distribution/federering**
([SubscriptionTopic](SubscriptionTopic-tk-organization-endpoint-changes.html)),
en **exponeringsgräns** mellan externt sök-API och internt admin-API
([TKSearchAPI](CapabilityStatement-tk-search-api.html) /
[TKAdminAPI](CapabilityStatement-tk-admin-api.html)), och **spårbarhet vid
registrering** ([TKProvenance](StructureDefinition-tk-provenance.html) +
transaction-Bundle).

---

### Avvikelser och tillägg

Detta avsnitt dokumenterar var denna IG:s FHIR-realisering avviker från,
eller lägger till utöver, en bokstavlig läsning av informationsunderlaget —
inklusive ställen där vi gjort andra modelleringsval än de som syns i det
bifogade underlaget, i enlighet med anvisningen att sådana val ska
dokumenteras tydligt.

Flera punkter nedan (märkta "efter jämförelse med en annan implementation
av samma problem") tillkom efter att denna IG:s design jämfördes mot en
annan, oberoende genomförd implementation av samma problemställning
(OpenAPI-spec + CapabilityStatement). Där den implementationen löste ett
problem denna IG lämnat öppet eller löst svagare, har mönstret medvetet
anpassats och adopterats här.

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

- ~~Entiteten "API" realiseras inte som en egen resurs~~ **— ändrat, se
  nedan.** Informationsunderlaget ger "API" en egen giltighetsperiod
  (giltigFrom/giltigTom), skild från Ändpunktens. `Endpoint.payload` är en
  backbone-struktur utan egen identitet/id och utan eget periodelement, så
  den kunde inte ensam bära en sådan självständig livscykel. Tidigare löste
  denna IG detta genom att **inte** införa en separat resurs — `Endpoint.payload`
  + `TKEndpointPayloadProfile` fick räcka, med den dokumenterade konsekvensen
  att ingen separat giltighetsperiod per API bars. Det avstegets grundorsak
  är nu åtgärdat genom [TKAPIInstance](StructureDefinition-tk-api-instance.html)
  — se nästa punkt — men `Endpoint.payload`/`TKEndpointPayloadProfile`
  behålls oförändrat vid sidan av, som den snabba sökvägen. Se REQ-MDL-3.

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
  entiteter är modellerade som logiska modeller för spårbarhet (se nedan),
  men REST-exponering skjuts medvetet upp till en framtida version. Se
  REQ-MDL-1, REQ-MDL-2, REQ-MDL-4. Om/när API-specifikation REST-exponeras
  rekommenderas en nedbantad profil på `ImplementationGuide`, inte `Basic`
  — se nästa punkt.

- **EHM realiserar "API-specifikation" som en profil på `ActorDefinition`
  ("API Specification (ActorDefinition)") — ett modelleringsval vi
  avvisar.** `ActorDefinition` är avsett att beskriva *aktörer*: typer av
  system eller individer som deltar i ett flöde (jämför denna IG:s egen
  [TKSynkroniseringstjanst](ActorDefinition-tk-synkroniseringstjanst.html)
  eller EHM:s eget Organization Endpoint Writer-aktör). En
  interoperabilitetsspecifikation är inte en aktör — den är ett publicerat
  dokument/kontrakt, identifierat av sin egen kanoniska URI. Att låta en
  specifikation "vara" en ActorDefinition blandar samman två skilda begrepp
  och gör det svårare att t.ex. sökbart skilja "vilka aktörer finns" från
  "vilka specifikationer finns".

  ~~Rekommenderades tidigare: en nedbantad profil på `ImplementationGuide`
  om/när REST-exponering blev aktuell.~~ **Ersatt.** Efter jämförelse med en
  annan implementation av samma problem, som använder `CapabilityStatement`
  (kind=requirements) för motsvarande entitet, realiseras
  API-specifikation nu som
  [TKAPISpecificationCapability](StructureDefinition-tk-api-specification-capability.html)
  — en profil på **`CapabilityStatement`**, inte `ImplementationGuide`.
  `CapabilityStatement.kind=requirements` är native FHIR-mekanik för "en
  formell kravbild ett konformt system måste uppfylla", vilket beskriver
  en interoperabilitetsspecifikation minst lika träffande som
  `ImplementationGuide`s dokumentationspaket-fokuserade form — och denna
  IG använder redan `kind=requirements` för sina egna `TKAdminAPI`/
  `TKSearchAPI`, så mönstret är konsekvent. `CapabilityStatement` bär
  liksom `ImplementationGuide` `url` (kanoniskUrl), `version`, `name`
  (maskinläsbartNamn), `title` (titel), `status`, `description`
  (beskrivning) och `date` (utgivningsdatum) som egna element. `publisher`
  är, precis som på `ImplementationGuide`, `string` snarare än `Reference`
  — `ansvarigUtgivare` som `Reference(TKOrganization)` uttrycks därför via
  en tillagd extension,
  [TKCapabilityStatementResponsibleOrganization](StructureDefinition-tk-capabilitystatement-responsible-organization.html).
  Se REQ-MDL-4.

- **`Organization.identifier` är den "logiska adress" tjänstesökning slår
  upp.** Förstudien "Förstudie T2 Tjänstekatalog" beskriver tjänstesökningens
  huvudsakliga söknyckel som en "logisk adress" (organisatorisk identifierare,
  t.ex. `SE1611`), skild från den tekniska anslutningsadressen den slås upp
  mot. Stakeholder-beslut: ingen separat `logiskAdress`-identifierare införs
  — den rollen fylls av `Organization.identifier` (idag `organisationsnummer`,
  öppet sliced för fler system vid behov), sökbar med standardparametern
  `identifier`. Se REQ-ORG-5.

- **Administratörsbehörighet ([TKAdministratorRole](StructureDefinition-tk-administrator-role.html))
  är inte del av informationsunderlaget.** Förstudien förutsätter att
  katalogen håller reda på vilka administratörer (`local-admin`/`central-admin`)
  som får administrera vilka organisationers poster. Stakeholder-beslut:
  detta realiseras med ett FHIR-attribut, `TKAdministratorRole.organization`
  (`Reference(TKOrganization)`, 0..1), på samma sätt som
  `TKEndpoint.managingOrganization` uttrycker "förvaltar" — inte en helt
  egen behörighetsmodell. En administratör som representerar flera
  organisationer får flera `TKAdministratorRole`-instanser (en per
  organisation), det normala FHIR PractitionerRole-mönstret.
  `central-admin`, som representerar samtliga organisationer, kan inte
  uttryckas som en enskild referens — där utelämnas `organization` medvetet
  (samma "frånvaro betyder bredare"-konvention som redan används för
  `TKEndpointSecurityMethod`s `none`). Den faktiska behörighetskontrollen
  (att en skrivning bara får avse en organisation anroparen representerar)
  är en serverimplementationsfråga, inte specificerad ytterligare av denna
  IG — se security.html. Se REQ-ADM-1..3.

- **Distribution/federering till lokala kataloger
  ([SubscriptionTopic](SubscriptionTopic-tk-organization-endpoint-changes.html))
  är inte del av informationsunderlaget.** Förstudien beskriver
  händelsebaserad uppdatering (prenumeration) och grundladdning som
  huvudmekanismer för att hålla lokala kataloger synkade mot den centrala.
  Stakeholder-beslut: detta löses med inbyggda FHIR-mekanismer i stället för
  en egen händelsemodell — R5:s topic-baserade `Subscription` (denna IG
  definierar ämnet `tk-organization-endpoint-changes`, se
  `OrganizationEndpointChanges.fsh`) för händelsebaserad distribution, och
  standardsökparametern `_lastUpdated` (tidsintervall, ingen ny artefakt
  behövs) för grundladdning och återsynk. Se "Distribution och
  synkronisering" i rest-interactions.html och REQ-DIST-1/2. Att undvika
  rundgång i en dubbelriktad federerad miljö (en lokal katalogs egna
  uppdateringar studsar tillbaka via prenumerationen) kräver ett
  ursprungsmärke på posten — inte löst i detta utkast, se öppen fråga
  nedan (REQ-DIST-3).

- **Sök-API externt (gateway), administrativa API:er endast interna.**
  Stakeholder-beslut: den läsande sökningen (`read`/`search-type` på
  `Organization`/`Endpoint`) bryts ut till ett eget, smalare
  CapabilityStatement, [TKSearchAPI](CapabilityStatement-tk-search-api.html),
  som är det som exponeras externt via gateway. Skrivinteraktionerna
  (`create`/`update`) finns endast i [TKAdminAPI](CapabilityStatement-tk-admin-api.html),
  som är internt exponerat endast. Se REQ-EXP-1/2 och security.html.

- ~~Spårbarhet (vem skapade/senast uppdaterade en post) skjuts upp~~
  **— löst, inte längre uppskjutet.** Förstudiens skrivmodell förutsätter
  attribut som `createdTime` och `updatedByHsaId`; detta avsnitt sa
  tidigare att det löses "i en framtida version". Efter jämförelse med en
  annan implementation av samma problem, som kräver en `Provenance`-post
  per registrering i en transaction-Bundle, antogs samma mönster här:
  [`TKProvenance`](StructureDefinition-tk-provenance.html) SKA bifogas
  (`Provenance.target` pekande ut den registrerade resursen) i samma
  transaction-Bundle som registrerar en `Organization`, `Endpoint` eller
  `CapabilityStatement`. Detta ger både spårbarhet och atomicitet (posten
  och dess Provenance skapas/uppdateras tillsammans), vilket separata
  `create`/`update`-anrop per resurstyp inte garanterar. Tjänstekatalogens
  administrativa API SKA därför stödja systeminteraktionen `transaction`.
  Se REQ-MDL-5, REQ-TRC-1/2 och `TKProvenance.fsh`.

- **API-instans ([TKAPIInstance](StructureDefinition-tk-api-instance.html))
  ger "API" en egen identitet, som komplement till `Endpoint.payload`.**
  Föregående punkt ovan (`Endpoint.payload` + `TKEndpointPayloadProfile`)
  kvarstår oförändrad som den snabba, enhops-sökbara realiseringen av
  "tillgängliggör"/"följer" (REQ-SRCH-3/4) — men dess kända begränsning,
  att "API" saknade egen identitet och egen giltighetsperiod, kvarstod
  också. Efter jämförelse med en annan implementation av samma problem,
  som representerar en tjänsteinstans som en egen `CapabilityStatement`
  (kind=instance, med `.instantiates` och `.implementation.custodian`),
  infördes samma mönster här som `TKAPIInstance`: en egen resurs för "API",
  med `.instantiates` ("följer" API-specifikation, 1..\*) och en tillagd
  extension som pekar ut den tillgängliggörande ändpunkten ("tillgängliggör",
  eftersom basresursen saknar ett sådant element) samt en tillagd
  giltighetsperiod-extension (löser REQ-MDL-3:s tidigare dokumenterade
  avsteg). **Öppen fråga:** att hålla de två realiseringarna (payload-
  extensionens spec-pekare och `TKAPIInstance.instantiates`) i sync är en
  dokumenterad förväntan, inte mekaniskt garanterad — servern validerar
  inte idag att de överensstämmer. Se REQ-MDL-3, REQ-MDL-6, REQ-MDL-7.

- **CapabilityStatement (kind=requirements) kräver ett populerat
  rest/messaging/document-element, även för icke-REST-specifikationer.**
  Bas-FHIR:s invariant `cpb-1` ("A Capability Statement SHALL have at least
  one of REST, messaging or document element") gäller alla
  `CapabilityStatement`-instanser oavsett `kind`. För en FHIR/REST-baserad
  specifikation (t.ex. exemplet nedan) är detta naturligt — `.rest`
  beskriver då på riktigt vilka förmågor specifikationen kräver. För en
  interoperabilitetsspecifikation som INTE är REST-baserad (t.ex. ett
  RIVTA SOAP-tjänstekontrakt) krävs ändå ett minimalt `rest.mode`-värde
  enbart för att uppfylla bas-invarianten — en känd modelleringsspänning i
  att återanvända `CapabilityStatement` (byggt för att beskriva FHIR
  REST/messaging/document-förmågor) för specifikationer som inte är det.
  `TKAPISpecificationCapability` sätter `rest 1..1` och `rest.mode = server`
  av denna anledning; se REQ-MDL-4.

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

#### API-specifikation → [TKAPISpecificationCapability](StructureDefinition-tk-api-specification-capability.html)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKAPISpecificationCapability.id](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| kanoniskUrl | 1..1 | [TKAPISpecificationCapability.url](StructureDefinition-tk-api-specification-capability.html) | Förväntas matcha värdet i `TKEndpointPayloadProfile`. REQ-MDL-4, REQ-SRCH-3 |
| status | 1..1 | [TKAPISpecificationCapability.status](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| maskinläsbartNamn | 0..1 | [TKAPISpecificationCapability.name](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| version | 0..1 | [TKAPISpecificationCapability.version](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| referensTillKälla | 0..1 | [TKAPISpecificationSourceReference](StructureDefinition-tk-api-specification-source-reference.html) (extension) | REQ-MDL-4 |
| kategori | 0..1 | [TKAPISpecificationCategory](StructureDefinition-tk-api-specification-category.html) (extension) | REQ-MDL-4 |
| titel | 1..1 | [TKAPISpecificationCapability.title](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| beskrivning | 0..1 | [TKAPISpecificationCapability.description](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| ansvarigUtgivare | 0..1 | [TKCapabilityStatementResponsibleOrganization](StructureDefinition-tk-capabilitystatement-responsible-organization.html) (extension) | `.publisher` (string) täcker fritextnamn; denna extension bär strukturerad `Reference(TKOrganization)`. REQ-MDL-4 |
| utgivningsdatum | 0..1 | [TKAPISpecificationCapability.date](StructureDefinition-tk-api-specification-capability.html) | REQ-MDL-4 |
| *(kind)* | 1..1 | [TKAPISpecificationCapability.kind](StructureDefinition-tk-api-specification-capability.html) | Fixerat till `requirements`. Inte del av informationsunderlaget — krävs av basresursen. |

#### API (join-entitet) → [TKAPIInstance](StructureDefinition-tk-api-instance.html) + [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html)

Två komplementära realiseringar — se avsteget ovan om varför båda finns
kvar sida vid sida.

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| id | 1..1 | [TKAPIInstance.id](StructureDefinition-tk-api-instance.html) | REQ-MDL-7 |
| giltigFrom | 0..1 | [TKAPIInstancePeriod](StructureDefinition-tk-api-instance-period.html) (extension) `.start` | REQ-MDL-6 |
| giltigTom | 0..1 | [TKAPIInstancePeriod](StructureDefinition-tk-api-instance-period.html) (extension) `.end` | REQ-MDL-6 |
| *(tillgängliggörs av Ändpunkt)* | 1..1 | [TKAPIInstanceEndpoint](StructureDefinition-tk-api-instance-endpoint.html) (extension) | Egen resurs. REQ-MDL-7 |
| *(tillgängliggörs av Ändpunkt)* | 0..* | [TKEndpoint.payload](StructureDefinition-tk-endpoint.html) | Snabb sökväg (extension). REQ-MDL-3 |
| *(följer API-specifikation)* | 1..* | [TKAPIInstance.instantiates](StructureDefinition-tk-api-instance.html) | Egen resurs, sökbar via SearchParameter-tk-capabilitystatement-instantiates.html. REQ-MDL-7 |
| *(följer API-specifikation)* | 0..* | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) | Snabb sökväg (extension). REQ-MDL-3, REQ-SRCH-3/4 |
| *(teknisk anropsadress)* | 1..1 | [TKAPIInstance.implementation.url](StructureDefinition-tk-api-instance.html) | Samma värde som `TKEndpoint.address` (medveten duplicering). |
| *(ansvarig organisation)* | 0..1 | [TKAPIInstance.implementation.custodian](StructureDefinition-tk-api-instance.html) | Om annan än ändpunktens förvaltande organisation. |
| *(kind)* | 1..1 | [TKAPIInstance.kind](StructureDefinition-tk-api-instance.html) | Fixerat till `instance`. |

#### Spårbarhet vid registrering → [TKProvenance](StructureDefinition-tk-provenance.html) (utökning, ej del av informationsunderlaget)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| registrerad resurs | 1..* | [TKProvenance.target](StructureDefinition-tk-provenance.html) | REQ-TRC-1 |
| registreringstidpunkt | 1..1 | [TKProvenance.recorded](StructureDefinition-tk-provenance.html) | REQ-TRC-1 |
| registrerande system/konto | 1..* | [TKProvenance.agent.who](StructureDefinition-tk-provenance.html) | REQ-TRC-1 |

#### Administratörsbehörighet → [TKAdministratorRole](StructureDefinition-tk-administrator-role.html) (utökning, ej del av informationsunderlaget)

| Modellelement | Kard. | FHIR-profilelement | Noteringar |
|----------------|-------|--------------------|------------|
| administrationsnivå | 1..1 | [TKAdministratorRole.code](StructureDefinition-tk-administrator-role.html) | `local-admin` &#124; `central-admin`. REQ-ADM-1 |
| representerad organisation | 0..1 | [TKAdministratorRole.organization](StructureDefinition-tk-administrator-role.html) | `Reference(TKOrganization)`. Utelämnad för `central-admin` (= alla organisationer). Samma mönster som `TKEndpoint.managingOrganization`. REQ-ADM-2 |
| innehavare | 0..1 | [TKAdministratorRole.practitioner](StructureDefinition-tk-administrator-role.html) | REQ-ADM-3 |

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
| StructureDefinition: Endpoint | `http://electronichealth.se/fhir/NDI/StructureDefinition/endpoint-er` |
| StructureDefinition: Organization | `http://electronichealth.se/fhir/NDI/StructureDefinition/organization-er` |
| OperationDefinition (id/canonical) | `http://electronichealth.se/fhir/NDI/OperationDefinition/AddOrganizationToEndpoint` / `.../RemoveOrganizationFromEndpoint` |
| Faktisk anropsväg ($-kod, bekräftad separat från canonical ovan) | `POST [base]/Endpoint/[id]/$add-organization` / `$remove-organization` |

EHM:s CapabilityStatement använder `kind = requirements` och konformansnivå
MAY på både resursen och båda operationerna (`capabilitystatement-expectation`)
— samma mönster som denna IG:s [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html)
använder.

#### Mappningstabell: skapa/uppdatera `Endpoint` hos EHM (steg 2)

Innan `$add-organization`/`$remove-organization` kan anropas (steg 3) måste
motsvarande `Endpoint` finnas hos EHM, konform med deras profil
`endpoint-er`. Denna tabell mappar [TKEndpoint](StructureDefinition-tk-endpoint.html)
mot EHM:s krav.

| EHM-element (`endpoint-er`) | Kard./bindning hos EHM | Källa i tjänstekatalogen | Transformation |
|---|---|---|---|
| `Endpoint.name` | 1..1, regex `^[A-Öa-ö0-9 _\-.,'()&/]+$`, max 255 tecken | [TKEndpoint.name](StructureDefinition-tk-endpoint.html) | Kontrollera mot EHM:s teckenregex/längdgräns innan anrop — inget vi validerar idag. |
| `Endpoint.address` | MS, ingen extra begränsning bortom bas-FHIR | [TKEndpoint.address](StructureDefinition-tk-endpoint.html) | Direkt kopiering. |
| `Endpoint.status` | Required binding: `http://electronichealth.se/fhir/NDI/ValueSet/er-endpoint-statuses` (EHM:s egen, begränsade statuslista) | [TKEndpoint.status](StructureDefinition-tk-endpoint.html) | Kontrollera att koden finns i EHM:s värdemängd — innehållet är inte känt här. |
| `Endpoint.period` | MS, ingen ytterligare profilering (bas-FHIR) | [TKEndpoint.period](StructureDefinition-tk-endpoint.html) | Direkt kopiering av giltigFrom/giltigTom. |
| `Endpoint.connectionType` (slice `protocol`) | 0..1, required binding: `http://electronichealth.se/fhir/NDI/ValueSet/er-endpoint-connection-type` | [TKEndpoint.connectionType](StructureDefinition-tk-endpoint.html) | Välj den/de av våra `connectionType`-koder som beskriver protokollet (t.ex. `hl7-fhir-rest`, som redan förekommer i både vårt exempel och EHM:s) och lägg i denna slice. |
| `Endpoint.connectionType` (slice `securityMethod`) | 0..1, required binding: `http://hl7.org/fhir/ValueSet/restful-security-service` (standard HL7-värdemängd, fixed `.system` = `http://hl7.org/fhir/restful-security-service`) | [TKEndpointSecurityMethod](StructureDefinition-tk-endpoint-security-method.html) (extension) | **Kräver kodöversättning** — se tabellen nedan. EHM lägger säkerhetsmetoden som en `connectionType`-slice, inte som en egen extension som denna IG gör. |
| `Endpoint.extension:associatedServer` (nästlad: `associatedServerType` fixed `authorization`, `serverURL` — regex `^https://[/.A-Öa-ö0-9]+$`, max 255 tecken) | 0..1 | [TKEndpointAuthorizationServerUrl](StructureDefinition-tk-endpoint-authorization-server-url.html) (extension) | **Kräver strukturell ombyggnad**, inte bara värdekopiering: vår platta url-extension blir hos EHM en nästlad extension med en fast typkod (`authorization`) och värdet i en egen `serverURL`-subextension. Kontrollera regex/längd innan anrop. |
| `Endpoint.payload.extension:apiSpecification` (typ: extension-profil `endpoint-payload-actor-definition-er`, troligen `canonical(ActorDefinition)` — profilens egen definition är inte inhämtad, men bekräftas indirekt av sökparametern `actor`) | **1..1 per payload (obligatorisk, ej upprepningsbar)** | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html) (extension på `payload`) | **Kardinalitetsskillnad:** vår extension tillåter 0..\* specifikationer per payload; EHM tillåter exakt 1. Om en payload hos oss anger flera specifikationer måste den delas upp i flera separata `payload`-poster hos EHM, en per specifikation. |

#### Mappningstabell: skapa/uppdatera `Organization` hos EHM

| EHM-element (`organization-er`) | Kard./bindning hos EHM | Källa i tjänstekatalogen | Transformation |
|---|---|---|---|
| `Organization.identifier` (slice `organizationIdentifier`) | system fixed `urn:oid:2.5.4.97`, värde regex `^\d{6}\d{4}$` (10 siffror) | [TKOrganization.identifier](StructureDefinition-tk-organization.html)\[`organisationsnummer`\] | Systemet matchar redan. Bindestreck i värdet tas bort (samma som i operationsmappningen ovan). |
| `Organization.identifier` (slice `personalIdentityNumber` / `coordinationNumber`) | system fixed resp. `http://electronichealth.se/identifier/personnummer` / `.../samordningsnummer`, värde regex för 12-siffrigt personnummer/samordningsnummer | — (medvetet ej mappat) | **Medvetet utanför scope, inte en lucka att fylla** (stakeholder-bekräftat): personnummer/samordningsnummer hör till EHM:s patientindex och till sökningar som kombinerar tjänstekatalog med patientindex — inte till organisationsidentifiering i tjänstekatalogens synkronisering. Denna IG:s `TKOrganization.identifier` har därför avsiktligt bara en `organisationsnummer`-slice (REQ-ORG-2); dessa EHM-slicer lämnas obesatta vid synkronisering. |
| `Organization.type` | 0..1, required binding: `http://electronichealth.se/fhir/NDI/ValueSet/er-organization-type` | — | **Saknar källa.** Informationsunderlagets Organisation-entitet har ingen "typ"-attribut att mappa från. Öppen fråga, se nedan. |
| `Organization.endpoint` | `targetProfile` = EHM:s `endpoint-er` | [TKOrganization.endpoint](StructureDefinition-tk-organization.html) | Referenserna ska peka på `Endpoint`-resurser som redan skapats hos EHM (steg 2 ovan), inte på tjänstekatalogens egna `Endpoint`-id:n. |

#### Kodöversättning: säkerhetsmetod

Denna IG:s [TKEndpointSecurityMethodVS](ValueSet-tk-endpoint-security-method.html)
(eget, preliminärt kodverk) mot HL7:s standardvärdemängd
`http://hl7.org/fhir/ValueSet/restful-security-service`, som EHM kräver:

| Vår kod (`tk-endpoint-security-method`) | EHM/HL7-kod (`restful-security-service`) | Notering |
|---|---|---|
| `oauth2-client-credentials` | `OAuth` | HL7:s värdemängd skiljer inte på OAuth 2.0-flöden. |
| `oauth2-authorization-code` | `OAuth` (eller `SMART-on-FHIR` om aktuellt) | Som ovan — kräver verksamhetsbeslut om vilken kod som är korrekt i det enskilda fallet. |
| `mutual-tls` | `Certificates` | — |
| `saml2` | *Ingen motsvarighet* | HL7:s värdemängd saknar en SAML-kod. Öppen fråga, se nedan. |
| `none` | *Utelämna slicen* | EHM:s `securityMethod`-slice är 0..1 — om ingen säkerhetsmetod finns, utelämnas slicen istället för att sättas till en kod. |

#### Mappningstabell: `$add-organization` / `$remove-organization` (steg 3)

Båda operationerna har samma parameterstruktur (skillnaden är bara om
organisationen läggs till eller tas bort).

| EHM-parameter | Kard. | Typ | Källa i tjänstekatalogen | Transformation |
|---|---|---|---|---|
| `id` (URL-segment, EHM:s Endpoint-id) | 1..1 | `string` (UUID) | [TKEndpoint.identifier](StructureDefinition-tk-endpoint.html)\[`ehmEndpointId`\] | Ingen — värdet SKA redan vara EHM:s tilldelade id (se REQ-WRT-4). Om det saknas kan operationen inte anropas — ändpunkten måste först finnas hos EHM (steg 2 i flödet ovan). |
| `organization` (body, `Parameters`) | 1..1 | `Identifier` (system + value) | [TKOrganization.identifier](StructureDefinition-tk-organization.html)\[`organisationsnummer`\] | Systemet `urn:oid:2.5.4.97` matchar redan (se avsteg ovan) — bara bindestrecket i värdet ("232100-0016" → "2321000016") behöver tas bort. **Endast organisationsnummer används här** — personnummer/samordningsnummer SKA INTE användas för att identifiera organisationen i detta anrop (stakeholder-bekräftat: de hör till EHM:s patientindex och kombinerade sökningar däremellan, inte till denna IG:s scope). Se REQ-WRT-5. |
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

- **`Organization.type` saknar källa.** EHM kräver (0..1, men MustSupport)
  en typkod från `http://electronichealth.se/fhir/NDI/ValueSet/er-organization-type`
  på `Organization`. Informationsunderlagets Organisation-entitet har inget
  motsvarande attribut. Antingen behöver denna IG:s modell utökas med ett
  sådant attribut, eller så behöver Synkroniseringstjänsten härleda/anta ett
  värde på annat sätt, eller så utelämnas elementet (tillåtet, eftersom det
  är 0..1 hos EHM).
- ~~Personnummer/samordningsnummer för enskilda firmor saknas i
  `TKOrganization`~~ **— rättat, inte längre en öppen fråga.** Tidigare
  antogs personnummer/samordningsnummer kunna användas som alternativ
  organisationsidentifierare mot EHM (t.ex. för enskilda firmor), utifrån
  att EHM:s `organization-er`-profil har slicer för detta. Stakeholder har
  bekräftat att detta är fel: personnummer/samordningsnummer hör till EHM:s
  patientindex och till sökningar som kombinerar tjänstekatalog med
  patientindex — inte till organisationsidentifiering i tjänstekatalogens
  synkronisering mot EHM. Se rättningen i REQ-WRT-2/5 och
  mappningstabellerna ovan.
- **`saml2` som säkerhetsmetod saknar motsvarighet** i HL7:s
  `restful-security-service`-värdemängd, som EHM kräver för sin
  `securityMethod`-slice. Kräver antingen ett verksamhetsbeslut om hur
  SAML 2.0-skyddade ändpunkter ska representeras hos EHM, eller att de inte
  kan synkroniseras dit i nuläget.
- **Extensionen `endpoint-payload-actor-definition-er`s exakta definition**
  (värdetyp, om den verkligen är `canonical(ActorDefinition)`) är inte
  inhämtad — antagen utifrån namnet, sökparametern `actor` och exemplen.
- **Bas-URL:en för `identifier[ehmEndpointId].system`**
  (`http://electronichealth.se/fhir/NDI/Endpoint`) är ett antagande baserat
  på mönstret i EHM:s övriga canonical-URL:er, inte bekräftat mot EHM:s
  faktiska serveradress.
- **Om Inera bekräftar `urn:oid:2.5.4.97`** som sitt eget föredragna system
  för organisationsnummer, kan noteringen om att det är "valt för
  EHM-kompatibilitet" tas bort — se REQ-ORG-2.
- **Om EHM identifierar en organisation med organisationsnummer i stället
  för vårdgivarens HSA-id, behöver det organisationsnumret beständigas hos
  Inera.** Observation från stakeholder: tjänstekatalogens ekosystem
  använder i övrigt normalt HSA-id som organisationsidentifierare. Om EHM
  väljer att identifiera en organisation med organisationsnummer (se
  REQ-ORG-2, REQ-ORG-5, REQ-WRT-5) i stället för vårdgivarens HSA-id,
  behöver Inera säkerställa att just det organisationsnumret är en stabil,
  förvaltad identifierare hos Inera — inte bara ett värde som råkar
  synkroniseras vidare till EHM. Hur denna beständighet säkerställs
  (registervård, koppling till HSA-id, etc.) är inte löst i detta utkast.

### Omappade element

~~API.id~~ **— inte längre omappat.** `API` har nu ett eget id via
[TKAPIInstance](StructureDefinition-tk-api-instance.html)`.id`, se
mappningstabellen ovan. Inga omappade element återstår i detta utkast.

---

> **Vägledning för författare:** Håll mappningarna uppdaterade i takt med
> att profilerna utvecklas. Mappningar kan också uttryckas med FHIR
> `ConceptMap`-resurser om maskinbearbetningsbar representation behövs.
