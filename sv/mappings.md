# Mappning till profiler - Tjänstekatalogen v0.1.0

## Mappning till profiler

# Mappning till profiler

Denna sida dokumenterar vilka delar av informationsunderlaget (se [Informationsunderlag](information-basis.md)) som denna IG realiserar, eventuella avvikelser i FHIR-realiseringen, samt hur enskilda element mappas till element i motsvarande FHIR-profiler. Den omvända vyn — vilket krav varje element realiserar — finns i [Kravkatalog](requirements.md); kravnycklarna (`REQ-*`) nedan länkar dit.

-------

### Omfattade delar

Denna IG realiserar entiteterna **Ändpunkt** och **Organisation**, inklusive båda relationerna mellan dem ("förvaltar" och "har"), fullt ut som FHIR- resurser med tillhörande sökparameter och skrivoperationer. Entiteterna **API**, **API-specifikation**, **Indexpost** och **Vård- och omsorgstagare** är modellerade som logiska modeller för spårbarhet, men är inte (ännu) REST-exponerade i det administrativa API:et — se "Avvikelser och tillägg" nedan för respektive entitet och [Kravkatalog](requirements.md) (REQ-MDL-*) för status.

Utöver informationsunderlagets sex entiteter realiserar denna IG tre stakeholder-beslutade tillägg (se respektive punkt nedan under "Avvikelser och tillägg"): **administratörsbehörighet** ([TKAdministratorRole](StructureDefinition-tk-administrator-role.md)), **distribution/federering** ([SubscriptionTopic](SubscriptionTopic-tk-organization-endpoint-changes.md)) och en **exponeringsgräns** mellan externt sök-API och internt admin-API ([TKSearchAPI](CapabilityStatement-tk-search-api.md) / [TKAdminAPI](CapabilityStatement-tk-admin-api.md)).

-------

### Avvikelser och tillägg

Detta avsnitt dokumenterar var denna IG:s FHIR-realisering avviker från, eller lägger till utöver, en bokstavlig läsning av informationsunderlaget — inklusive ställen där vi gjort andra modelleringsval än de som syns i det bifogade underlaget, i enlighet med anvisningen att sådana val ska dokumenteras tydligt.

* **`organization` räcker inte för "har".** Standardsökparametern `organization` på `Endpoint` är definierad som `Endpoint.managingOrganization` ("förvaltar"). Den täcker inte "har"-relationen (`Organization.endpoint`) — att en organisation **listar** en ändpunkt i sin katalogpost oavsett vem som tekniskt förvaltar den. Denna IG inför istället en egen sökparameter, [`listed-by`](SearchParameter-tk-endpoint-listed-by.md), för "har". Se REQ-SRCH-1.
* **`listed-by` saknar en `.expression`, avsiktligt.** FHIRPath i `SearchParameter.expression` evalueras mot instanser av resursen i `.base` (här: `Endpoint`) och kan inte uttrycka en omvänd/korsresurs-slagning in i `Organization.endpoint`. Servrar SKA implementera `listed-by` likvärdigt med standardmekanismen `_has:Organization:endpoint:_id=[org-id]`. Se motiveringen i `SearchParameter-tk-endpoint-listed-by.fsh` och [Kravkatalog](requirements.md) REQ-SRCH-1.
* **`Endpoint.payload.profile` finns inte i R5.** Interoperabilitetsspecifikationer ("API följer API-specifikation") ska enligt uppdraget listas under ändpunkten och kan med fördel realiseras med extensions, som motsvarighet till det kommande elementet `Endpoint.payload.profile` (planerat i en senare FHIR-version). Denna IG definierar [`TKEndpointPayloadProfile`](StructureDefinition-tk-endpoint-payload-profile.md) som en repeterbar `canonical`-extension på `Endpoint.payload` i väntan på det elementet. Se REQ-SRCH-3.
* **Entiteten "API" realiseras inte som en egen resurs.** Informationsunderlaget ger "API" en egen giltighetsperiod (giltigFrom/giltigTom), skild från Ändpunktens. FHIR:s `Endpoint.payload` är en backbone-struktur utan egen identitet/id och utan eget periodelement — den kan inte bära en sådan självständig livscykel. Vi har valt att **inte** införa en separat resurs eller logisk modell för "API": `Endpoint.payload` (typ + vår `TKEndpointPayloadProfile`-extension) räcker för att uttrycka "Ändpunkt tillgängliggör API" och "API följer API-specifikation". Konsekvensen är att denna IG **inte** bär en separat giltighetsperiod per API — endast `Endpoint.period` (Ändpunktens egen giltighetstid) används. Detta är ett medvetet avsteg, inte en försummelse: se REQ-MDL-3. Implementatörer som behöver oberoende livscykler per API bör registrera separata `Endpoint`-instanser (en per API) tills vidare, eller lyfta frågan som ett ändringsförslag mot en framtida version av denna IG.
* **`säkerhetsmetod` och `urlTillAuktorisationsserver` saknar hemvist i basresursen `Endpoint`.** R5 `Endpoint` har inget element för vare sig säkerhetsmetod eller URL till auktorisationsserver. Denna IG inför två extensions för detta: [`TKEndpointSecurityMethod`](StructureDefinition-tk-endpoint-security-method.md) och [`TKEndpointAuthorizationServerUrl`](StructureDefinition-tk-endpoint-authorization-server-url.md). Kodverket för säkerhetsmetod ([TKEndpointSecurityMethodVS](ValueSet-tk-endpoint-security-method.md)) är vårt eget preliminära förslag (example-bindning) — informationsunderlaget definierar ingen kontrollerad vokabulär för attributet. Se REQ-END-6, REQ-END-7.
* **Organisationsnummer-systemets URI är valt för att matcha EHM.** Identifierarsystemet för `Organisation.organisationsnummer` (`urn:oid:2.5.4.97`, se `aliases.fsh`) är hämtat från E-hälsomyndighetens (EHM) publicerade krav för sin Organization Endpoint Writer-operation (se "Mappning mot EHM:s Organization Endpoint Writer" nedan) — inte från ett internt Inera-beslut. En tidigare, ej verifierad gissning (`urn:oid:1.2.752.29.4.13`) är ersatt. Att återanvända samma system som EHM kräver innebär att `Organization.identifier`-värden inte behöver systemöversättas vid synkronisering, bara formatteras om (bindestreck bort). Inera bör ändå separat bekräfta att detta även är Ineras egna föredragna kanoniska system. Se REQ-ORG-2.
* **Ny identifierare för korrelation med EHM, utanför informationsunderlaget.** `TKEndpoint.identifier` har en tillagd slice, `ehmEndpointId`, som bär EHM:s eget logiska id för samma ändpunkt i deras register. Detta element finns inte i det ursprungliga informationsunderlaget, men krävs eftersom EHM:s `$add-organization`/`$remove-organization` adresserar ändpunkten via EHM:s eget id (se REQ-WRT-4 och mappningen mot EHM nedan). Systemet `http://electronichealth.se/fhir/NDI/Endpoint` är ett ANTAGET värde i väntan på bekräftelse av EHM:s faktiska bas-URL.
* **"Vård- och omsorgstagare" ges ingen egen FHIR-profil.** Informationsunderlaget ger entiteten ett enda attribut (id) utan ytterligare persondata — den fungerar som en opak pekare i modellen, inte som en plats för persondata. Vi har därför avstått från att införa en egen FHIR-resursprofil och representerar den enbart med en tunn logisk modell, [`TKVardOchOmsorgstagare`](StructureDefinition-tk-vard-och-omsorgstagare.md), som `Indexpost.avser` kan referera. Implementatörer som behöver faktiska persondata om en vård- och omsorgstagare får slå upp identifieraren mot Ineras patientvända tjänster, t.ex. en profil som [IneraPatient](StructureDefinition-IneraPatient.md) — vilket ligger utanför denna IG:s scope. Se REQ-MDL-2.
* **Indexpost, Vård- och omsorgstagare och API-specifikation exponeras inte via REST i detta utkast.** Det administrativa API:ets uppdrag i denna version är teknisk ändpunkts-/organisationsmetadata (Ändpunkt, Organisation och kopplingen dem emellan), inte personidentitet eller katalogisering av specifikationer i sig. En indexpost förväntas dessutom vara en serverhärledd sidoeffekt av att registrera en Organisation eller en Vård- och omsorgstagare, snarare än något en klient skapar direkt. Dessa tre entiteter är modellerade som logiska modeller för spårbarhet (se nedan), men REST-exponering skjuts medvetet upp till en framtida version. Se REQ-MDL-1, REQ-MDL-2, REQ-MDL-4. Om/när API-specifikation REST-exponeras rekommenderas en nedbantad profil på `ImplementationGuide`, inte `Basic` — se nästa punkt.
* **EHM realiserar "API-specifikation" som en profil på `ActorDefinition` ("API Specification (ActorDefinition)") — ett modelleringsval vi avvisar.** `ActorDefinition` är avsett att beskriva **aktörer**: typer av system eller individer som deltar i ett flöde (jämför denna IG:s egen [TKSynkroniseringstjanst](ActorDefinition-tk-synkroniseringstjanst.md) eller EHM:s eget Organization Endpoint Writer-aktör). En interoperabilitetsspecifikation är inte en aktör — den är ett publicerat dokument/kontrakt, identifierat av sin egen kanoniska URI. Att låta en specifikation "vara" en ActorDefinition blandar samman två skilda begrepp och gör det svårare att t.ex. sökbart skilja "vilka aktörer finns" från "vilka specifikationer finns". Skulle denna IG i en framtida version REST-exponera `TKAPISpecification`, rekommenderas istället en nedbantad profil på **`ImplementationGuide`**: den bär redan `url` (kanoniskUrl), `version`, `name` (maskinläsbartNamn), `title` (titel), `status`, `description` (beskrivning) och `date` (utgivningsdatum) som egna element, vilket passar en versionerad, publicerad specifikations livscykel bättre än både `ActorDefinition` och `Basic`. (`publisher` är dock `string` på `ImplementationGuide`, inte `Reference` — `ansvarigUtgivare` som `Reference(TKOrganization)` skulle då behöva uttryckas via en extension istället, eller bytas till en identifierare/text.) Se REQ-MDL-4.
* **`Organization.identifier` är den "logiska adress" tjänstesökning slår upp.** Förstudien "Förstudie T2 Tjänstekatalog" beskriver tjänstesökningens huvudsakliga söknyckel som en "logisk adress" (organisatorisk identifierare, t.ex. `SE1611`), skild från den tekniska anslutningsadressen den slås upp mot. Stakeholder-beslut: ingen separat `logiskAdress`-identifierare införs — den rollen fylls av `Organization.identifier` (idag `organisationsnummer`, öppet sliced för fler system vid behov), sökbar med standardparametern `identifier`. Se REQ-ORG-5.
* **Administratörsbehörighet ([TKAdministratorRole](StructureDefinition-tk-administrator-role.md)) är inte del av informationsunderlaget.** Förstudien förutsätter att katalogen håller reda på vilka administratörer (`local-admin`/`central-admin`) som får administrera vilka organisationers poster. Stakeholder-beslut: detta realiseras med ett FHIR-attribut, `TKAdministratorRole.organization` (`Reference(TKOrganization)`, 0..1), på samma sätt som `TKEndpoint.managingOrganization` uttrycker "förvaltar" — inte en helt egen behörighetsmodell. En administratör som representerar flera organisationer får flera `TKAdministratorRole`-instanser (en per organisation), det normala FHIR PractitionerRole-mönstret. `central-admin`, som representerar samtliga organisationer, kan inte uttryckas som en enskild referens — där utelämnas `organization` medvetet (samma "frånvaro betyder bredare"-konvention som redan används för `TKEndpointSecurityMethod`s `none`). Den faktiska behörighetskontrollen (att en skrivning bara får avse en organisation anroparen representerar) är en serverimplementationsfråga, inte specificerad ytterligare av denna IG — se security.html. Se REQ-ADM-1..3.
* **Distribution/federering till lokala kataloger ([SubscriptionTopic](SubscriptionTopic-tk-organization-endpoint-changes.md)) är inte del av informationsunderlaget.** Förstudien beskriver händelsebaserad uppdatering (prenumeration) och grundladdning som huvudmekanismer för att hålla lokala kataloger synkade mot den centrala. Stakeholder-beslut: detta löses med inbyggda FHIR-mekanismer i stället för en egen händelsemodell — R5:s topic-baserade `Subscription` (denna IG definierar ämnet `tk-organization-endpoint-changes`, se `OrganizationEndpointChanges.fsh`) för händelsebaserad distribution, och standardsökparametern `_lastUpdated` (tidsintervall, ingen ny artefakt behövs) för grundladdning och återsynk. Se "Distribution och synkronisering" i rest-interactions.html och REQ-DIST-1/2. Att undvika rundgång i en dubbelriktad federerad miljö (en lokal katalogs egna uppdateringar studsar tillbaka via prenumerationen) kräver ett ursprungsmärke på posten — inte löst i detta utkast, se öppen fråga nedan (REQ-DIST-3).
* **Sök-API externt (gateway), administrativa API:er endast interna.** Stakeholder-beslut: den läsande sökningen (`read`/`search-type` på `Organization`/`Endpoint`) bryts ut till ett eget, smalare CapabilityStatement, [TKSearchAPI](CapabilityStatement-tk-search-api.md), som är det som exponeras externt via gateway. Skrivinteraktionerna (`create`/`update`) finns endast i [TKAdminAPI](CapabilityStatement-tk-admin-api.md), som är internt exponerat endast. Se REQ-EXP-1/2 och security.html.
* **Spårbarhet (vem skapade/senast uppdaterade en post) skjuts upp.** Förstudiens skrivmodell förutsätter attribut som `createdTime` och `updatedByHsaId`. Stakeholder-beslut: löses med serverloggning och/eller `Provenance`-resurser i en framtida version, snarare än ett attribut på `Organization`/`Endpoint` självt — avvaktar för nu. Se REQ-MDL-5.

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
| organisationsnummer | 0..1 | [TKOrganization.identifier](StructureDefinition-tk-organization.md)(slice`organisationsnummer`) | Identifierarsystem valt för EHM-kompatibilitet, se avsteg ovan. REQ-ORG-2 |
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

#### Administratörsbehörighet → TKAdministratorRole (utökning, ej del av informationsunderlaget)

| | | | |
| :--- | :--- | :--- | :--- |
| administrationsnivå | 1..1 | [TKAdministratorRole.code](StructureDefinition-tk-administrator-role.md) | `local-admin`|`central-admin`. REQ-ADM-1 |
| representerad organisation | 0..1 | [TKAdministratorRole.organization](StructureDefinition-tk-administrator-role.md) | `Reference(TKOrganization)`. Utelämnad för`central-admin`(= alla organisationer). Samma mönster som`TKEndpoint.managingOrganization`. REQ-ADM-2 |
| innehavare | 0..1 | [TKAdministratorRole.practitioner](StructureDefinition-tk-administrator-role.md) | REQ-ADM-3 |

-------

### Mappning mot EHM:s Organization Endpoint Writer

Detta avsnitt är inte en mappning mellan informationsunderlaget och denna IG:s egna profiler (som avsnitten ovan) — det är en mappning mellan **denna IG:s** data och **E-hälsomyndighetens (EHM)** API-struktur, för den aktör som läser härifrån och skriver dit.

#### Roller och flöde

"Organization Endpoint Writer" är **EHM:s egen aktörsroll**, definierad i deras IG ([Swedish Medical Record Index And Endpoint Registry](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/)), inte en roll tjänstekatalogens administrativa API själv implementerar eller tar emot anrop som. Rollen antas av en fristående **Synkroniseringstjänst** (se [ActorDefinition](ActorDefinition-tk-synkroniseringstjanst.md) och [Roller och ansvar](roles-and-responsibilities.md)), som:

1. läser organisationer och ändpunkter från tjänstekatalogens administrativa API (se[CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.md)), särskilt vilka ändpunkter en organisation listar via[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md);
1. säkerställer att motsvarande`Endpoint`-resurs finns hos EHM (skapande/ uppdatering av själva ändpunkten hos EHM via deras generella FHIR REST- gränssnitt —**ej detaljerat mappat här ännu**, se öppen fråga nedan);
1. anropar EHM:s`$add-organization`/`$remove-organization`, i rollen Organization Endpoint Writer, för att koppla/koppla loss en organisation till/från den ändpunkten hos EHM.

EHM:s artefakter (definierade i deras IG, **inte omdefinierade i denna IG** — vi återpublicerar aldrig någon annans canonical-resurser under vår egen namnrymd):

| | |
| :--- | :--- |
| ActorDefinition: Organization Endpoint Writer Actor | `http://electronichealth.se/fhir/NDI/ActorDefinition/organization-endpoint-writer-actor-er` |
| CapabilityStatement: Organization Endpoint Writer Capabilities | `http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er` |
| StructureDefinition: Endpoint | `http://electronichealth.se/fhir/NDI/StructureDefinition/endpoint-er` |
| StructureDefinition: Organization | `http://electronichealth.se/fhir/NDI/StructureDefinition/organization-er` |
| OperationDefinition (id/canonical) | `http://electronichealth.se/fhir/NDI/OperationDefinition/AddOrganizationToEndpoint`/`.../RemoveOrganizationFromEndpoint` |
| Faktisk anropsväg ($-kod, bekräftad separat från canonical ovan) | `POST [base]/Endpoint/[id]/$add-organization`/`$remove-organization` |

EHM:s CapabilityStatement använder `kind = requirements` och konformansnivå MAY på både resursen och båda operationerna (`capabilitystatement-expectation`) — samma mönster som denna IG:s [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.md) använder.

#### Mappningstabell: skapa/uppdatera Endpoint hos EHM (steg 2)

Innan `$add-organization`/`$remove-organization` kan anropas (steg 3) måste motsvarande `Endpoint` finnas hos EHM, konform med deras profil `endpoint-er`. Denna tabell mappar [TKEndpoint](StructureDefinition-tk-endpoint.md) mot EHM:s krav.

| | | | |
| :--- | :--- | :--- | :--- |
| `Endpoint.name` | 1..1, regex`^[A-Öa-ö0-9 _\-.,'()&/]+$`, max 255 tecken | [TKEndpoint.name](StructureDefinition-tk-endpoint.md) | Kontrollera mot EHM:s teckenregex/längdgräns innan anrop — inget vi validerar idag. |
| `Endpoint.address` | MS, ingen extra begränsning bortom bas-FHIR | [TKEndpoint.address](StructureDefinition-tk-endpoint.md) | Direkt kopiering. |
| `Endpoint.status` | Required binding:`http://electronichealth.se/fhir/NDI/ValueSet/er-endpoint-statuses`(EHM:s egen, begränsade statuslista) | [TKEndpoint.status](StructureDefinition-tk-endpoint.md) | Kontrollera att koden finns i EHM:s värdemängd — innehållet är inte känt här. |
| `Endpoint.period` | MS, ingen ytterligare profilering (bas-FHIR) | [TKEndpoint.period](StructureDefinition-tk-endpoint.md) | Direkt kopiering av giltigFrom/giltigTom. |
| `Endpoint.connectionType`(slice`protocol`) | 0..1, required binding:`http://electronichealth.se/fhir/NDI/ValueSet/er-endpoint-connection-type` | [TKEndpoint.connectionType](StructureDefinition-tk-endpoint.md) | Välj den/de av våra`connectionType`-koder som beskriver protokollet (t.ex.`hl7-fhir-rest`, som redan förekommer i både vårt exempel och EHM:s) och lägg i denna slice. |
| `Endpoint.connectionType`(slice`securityMethod`) | 0..1, required binding:`http://hl7.org/fhir/ValueSet/restful-security-service`(standard HL7-värdemängd, fixed`.system`=`http://hl7.org/fhir/restful-security-service`) | [TKEndpointSecurityMethod](StructureDefinition-tk-endpoint-security-method.md)(extension) | **Kräver kodöversättning**— se tabellen nedan. EHM lägger säkerhetsmetoden som en`connectionType`-slice, inte som en egen extension som denna IG gör. |
| `Endpoint.extension:associatedServer`(nästlad:`associatedServerType`fixed`authorization`,`serverURL`— regex`^https://[/.A-Öa-ö0-9]+$`, max 255 tecken) | 0..1 | [TKEndpointAuthorizationServerUrl](StructureDefinition-tk-endpoint-authorization-server-url.md)(extension) | **Kräver strukturell ombyggnad**, inte bara värdekopiering: vår platta url-extension blir hos EHM en nästlad extension med en fast typkod (`authorization`) och värdet i en egen`serverURL`-subextension. Kontrollera regex/längd innan anrop. |
| `Endpoint.payload.extension:apiSpecification`(typ: extension-profil`endpoint-payload-actor-definition-er`, troligen`canonical(ActorDefinition)`— profilens egen definition är inte inhämtad, men bekräftas indirekt av sökparametern`actor`) | **1..1 per payload (obligatorisk, ej upprepningsbar)** | [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.md)(extension på`payload`) | **Kardinalitetsskillnad:**vår extension tillåter 0..* specifikationer per payload; EHM tillåter exakt 1. Om en payload hos oss anger flera specifikationer måste den delas upp i flera separata`payload`-poster hos EHM, en per specifikation. |

#### Mappningstabell: skapa/uppdatera Organization hos EHM

| | | | |
| :--- | :--- | :--- | :--- |
| `Organization.identifier`(slice`organizationIdentifier`) | system fixed`urn:oid:2.5.4.97`, värde regex`^\d{6}\d{4}$`(10 siffror) | [TKOrganization.identifier](StructureDefinition-tk-organization.md)[`organisationsnummer`] | Systemet matchar redan. Bindestreck i värdet tas bort (samma som i operationsmappningen ovan). |
| `Organization.identifier`(slice`personalIdentityNumber`/`coordinationNumber`) | system fixed resp.`http://electronichealth.se/identifier/personnummer`/`.../samordningsnummer`, värde regex för 12-siffrigt personnummer/samordningsnummer | — | Denna IG:s`TKOrganization`har idag bara en`organisationsnummer`-slice (se REQ-ORG-2) — inte personnummer/samordningsnummer-slicer för enskilda firmor. Öppen fråga, se nedan. |
| `Organization.type` | 0..1, required binding:`http://electronichealth.se/fhir/NDI/ValueSet/er-organization-type` | — | **Saknar källa.**Informationsunderlagets Organisation-entitet har ingen "typ"-attribut att mappa från. Öppen fråga, se nedan. |
| `Organization.endpoint` | `targetProfile`= EHM:s`endpoint-er` | [TKOrganization.endpoint](StructureDefinition-tk-organization.md) | Referenserna ska peka på`Endpoint`-resurser som redan skapats hos EHM (steg 2 ovan), inte på tjänstekatalogens egna`Endpoint`-id:n. |

#### Kodöversättning: säkerhetsmetod

Denna IG:s [TKEndpointSecurityMethodVS](ValueSet-tk-endpoint-security-method.md) (eget, preliminärt kodverk) mot HL7:s standardvärdemängd `http://hl7.org/fhir/ValueSet/restful-security-service`, som EHM kräver:

| | | |
| :--- | :--- | :--- |
| `oauth2-client-credentials` | `OAuth` | HL7:s värdemängd skiljer inte på OAuth 2.0-flöden. |
| `oauth2-authorization-code` | `OAuth`(eller`SMART-on-FHIR`om aktuellt) | Som ovan — kräver verksamhetsbeslut om vilken kod som är korrekt i det enskilda fallet. |
| `mutual-tls` | `Certificates` | — |
| `saml2` | **Ingen motsvarighet** | HL7:s värdemängd saknar en SAML-kod. Öppen fråga, se nedan. |
| `none` | **Utelämna slicen** | EHM:s`securityMethod`-slice är 0..1 — om ingen säkerhetsmetod finns, utelämnas slicen istället för att sättas till en kod. |

#### Mappningstabell: $add-organization / $remove-organization (steg 3)

Båda operationerna har samma parameterstruktur (skillnaden är bara om organisationen läggs till eller tas bort).

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| `id`(URL-segment, EHM:s Endpoint-id) | 1..1 | `string`(UUID) | [TKEndpoint.identifier](StructureDefinition-tk-endpoint.md)[`ehmEndpointId`] | Ingen — värdet SKA redan vara EHM:s tilldelade id (se REQ-WRT-4). Om det saknas kan operationen inte anropas — ändpunkten måste först finnas hos EHM (steg 2 i flödet ovan). |
| `organization`(body,`Parameters`) | 1..1 | `Identifier`(system + value) | [TKOrganization.identifier](StructureDefinition-tk-organization.md)[`organisationsnummer`] | Systemet`urn:oid:2.5.4.97`matchar redan (se avsteg ovan) — bara bindestrecket i värdet ("232100-0016" → "2321000016") behöver tas bort. Alternativt kan personnummer/samordningsnummer användas om organisationen identifieras så istället (samma system som`$personnummer`/`$samordningsnummer`i`aliases.fsh`, redan matchande). |
| **(retur)**`return` | 1..1 | `OperationOutcome` | — | Ingen resurs returneras (varken uppdaterad Organization eller Endpoint) — bara en`OperationOutcome`med en framgångs-, informations- eller felkod. Se svarshantering nedan. |

Exempel på anropskropp (organisationsnummer, bindestreck borttaget):

```
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

EHM:s operationer är idempotenta och signalerar det via `OperationOutcome`, inte via HTTP-statuskod ensam:

| | | | |
| :--- | :--- | :--- | :--- |
| `4-38-301` | success | Organisationen lades till | Klart. |
| `4-38-302` | success | Organisationen togs bort | Klart. |
| `4-38-303` | information | Organisationen fanns redan kopplad | Behandla som lyckat (idempotent) — inte ett fel. |
| `4-38-304` | information | Organisationen var redan bortkopplad | Behandla som lyckat (idempotent) — inte ett fel. |
| `2-38-1`,`2-38-8`,`2-38-9`,`2-38-4`,`2-38-2`,`2-44-X`,`2-38-7` | error | Se EHM:s fullständiga felkodskatalog | Verkligt fel — vanligast: fel identifierarsystem/format (`2-38-4`/`2-38-2`/`2-38-7`/`2-44-X`) eller okänt`id`(`2-38-8`). Kontrollera mappningen ovan innan omförsök. |

Se [Felhantering](error-handling.md) för tjänstekatalogens egen felhantering — EHM:s felkodskatalog är separat och dokumenteras i sin helhet i deras egen IG.

#### Öppna frågor

* **`Organization.type` saknar källa.** EHM kräver (0..1, men MustSupport) en typkod från `http://electronichealth.se/fhir/NDI/ValueSet/er-organization-type` på `Organization`. Informationsunderlagets Organisation-entitet har inget motsvarande attribut. Antingen behöver denna IG:s modell utökas med ett sådant attribut, eller så behöver Synkroniseringstjänsten härleda/anta ett värde på annat sätt, eller så utelämnas elementet (tillåtet, eftersom det är 0..1 hos EHM).
* **Personnummer/samordningsnummer för enskilda firmor saknas i `TKOrganization`.** EHM:s `Organization`-profil har slicer för detta (en enskild firma identifieras med ägarens personnummer, inte ett organisationsnummer) men denna IG:s `TKOrganization.identifier` har idag bara en `organisationsnummer`-slice. Behöver läggas till om tjänstekatalogen ska hantera enskilda firmor.
* **`saml2` som säkerhetsmetod saknar motsvarighet** i HL7:s `restful-security-service`-värdemängd, som EHM kräver för sin `securityMethod`-slice. Kräver antingen ett verksamhetsbeslut om hur SAML 2.0-skyddade ändpunkter ska representeras hos EHM, eller att de inte kan synkroniseras dit i nuläget.
* **Extensionen `endpoint-payload-actor-definition-er`s exakta definition** (värdetyp, om den verkligen är `canonical(ActorDefinition)`) är inte inhämtad — antagen utifrån namnet, sökparametern `actor` och exemplen.
* **Bas-URL:en för `identifier[ehmEndpointId].system`** (`http://electronichealth.se/fhir/NDI/Endpoint`) är ett antagande baserat på mönstret i EHM:s övriga canonical-URL:er, inte bekräftat mot EHM:s faktiska serveradress.
* **Om Inera bekräftar `urn:oid:2.5.4.97`** som sitt eget föredragna system för organisationsnummer, kan noteringen om att det är "valt för EHM-kompatibilitet" tas bort — se REQ-ORG-2.

-------

### Omappade element

| | |
| :--- | :--- |
| API.id | Modellen ger inte "API" ett eget id-attribut — se avsteg ovan; entiteten realiseras helt via`Endpoint.payload`, som saknar egen identitet. |

-------

> **Vägledning för författare:** Håll mappningarna uppdaterade i takt med att profilerna utvecklas. Mappningar kan också uttryckas med FHIR `ConceptMap`-resurser om maskinbearbetningsbar representation behövs.

