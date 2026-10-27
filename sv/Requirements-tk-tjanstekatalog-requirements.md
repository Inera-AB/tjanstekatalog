# Kravkatalog: Tjänstekatalogen - Tjänstekatalogen v0.1.0

## Requirements: Kravkatalog: Tjänstekatalogen (Experimentell) 



## Resource Content

```json
{
  "resourceType" : "Requirements",
  "id" : "tk-tjanstekatalog-requirements",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements",
  "version" : "0.1.0",
  "name" : "TKTjanstekatalogRequirements",
  "title" : "Kravkatalog: Tjänstekatalogen",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-08",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Formell kravkatalog för tjänstekatalogen. Varje krav spåras till den/de FHIR-artefakt(er) som realiserar det via `satisfiedBy`. Se requirements.html för en läsbar vy och mappings.html för den omvända vyn (attribut → krav).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "actor" : ["https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-synkroniseringstjanst",
  "http://electronichealth.se/fhir/NDI/ActorDefinition/organization-endpoint-writer-actor-er"],
  "statement" : [{
    "key" : "REQ-SRCH-1",
    "label" : "Sök ändpunkter per organisation (\"har\")",
    "conformance" : ["SHALL"],
    "requirement" : "Servern SKA stödja sökning av Endpoint-resurser via en sökparameter som returnerar samtliga ändpunkter en angiven organisation listar via `Organization.endpoint` (\"har\"-relationen), oavsett vilken organisation som tekniskt förvaltar respektive ändpunkt.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by"]
  },
  {
    "key" : "REQ-SRCH-2",
    "label" : "Ändpunktens URL i address",
    "conformance" : ["SHALL"],
    "requirement" : "Ändpunktens URL SKA anges i `Endpoint.address`.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-SRCH-3",
    "label" : "Stödda interoperabilitetsspecifikationer per ändpunkt",
    "conformance" : ["SHOULD"],
    "requirement" : "Servern BÖR, per nyttolast (`Endpoint.payload`) som ändpunkten tillgängliggör, ange vilken/vilka interoperabilitetsspecifikationer (API-specifikationer) nyttolasten följer.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"]
  },
  {
    "key" : "REQ-SRCH-4",
    "label" : "Sök ändpunkter efter stödd interoperabilitetsspecifikation",
    "conformance" : ["SHOULD"],
    "requirement" : "Servern BÖR stödja sökning av Endpoint-resurser via en sökparameter (`implements`) som returnerar samtliga ändpunkter vars nyttolast stödjer en angiven interoperabilitetsspecifikation, som komplement till REQ-SRCH-3:s representation. Tillagt efter jämförelse med en annan implementation av samma problem.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements"]
  },
  {
    "key" : "REQ-SRCH-5",
    "label" : "Sökning på organisationsidentifierare",
    "conformance" : ["SHALL"],
    "requirement" : "Vid sökning med `identifier` på Organization SKA HSA-id (`urn:oid:1.2.752.29.4.19`) matchas exakt som det är skrivet; bindestrecket ingår i identifieraren. För organisationsnummer (`urn:oid:2.5.4.97`) SKA servern godta värdet både med och utan bindestreck (`232100-0016` och `2321000016` ger samma träff). Ingen normalisering görs när system saknas i sökvärdet.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-SRCH-6",
    "label" : "Sökning på kanoniska referenser (instantiates, implements)",
    "conformance" : ["SHALL"],
    "requirement" : "Sökparametrarna `instantiates` (CapabilityStatement) och `implements` (Endpoint) är av typen `reference` och SKA godta en kanonisk URL, som matchar alla versioner (även referenser utan version), och `url|version`, som endast matchar den angivna versionen. Literala referenser (`CapabilityStatement/[id]`) stöds inte. Kedjad sökning krävs inte.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates",
    "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements"]
  },
  {
    "key" : "REQ-SRCH-7",
    "label" : "Felregistrerade ändpunkter",
    "conformance" : ["SHALL"],
    "requirement" : "Vid sökning på Endpoint utan parametern `status` SKA ändpunkter med status `entered-in-error` utelämnas. De SKA returneras när klienten uttryckligen söker `status=entered-in-error`, och alltid vid `read`. Övriga statusar, och organisationer med `active=false`, filtreras inte bort.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-SRCH-8",
    "label" : "Giltighetsperiod filtreras inte av servern",
    "conformance" : ["SHALL"],
    "requirement" : "Servern SKA INTE filtrera sökresultat på `Endpoint.period` eller på API-instansens giltighetsperiod, och SKA INTE ändra status när en period har löpt ut. Klienten avgör användbarhet: en ändpunkt kan användas om `status = active` och aktuell tidpunkt ligger inom `period`.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
    "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period"]
  },
  {
    "key" : "REQ-SRCH-9",
    "label" : "Sökkonventioner",
    "conformance" : ["SHALL"],
    "requirement" : "Sök-API:t SKA stödja de sökparametrar som deklareras i TKSearchAPI, inklusive `_id`, `_lastUpdated`, `partof` och `active` på Organization, `_include=Organization:endpoint` (logisk adress till ändpunkter i ett anrop) samt `_count` och sidindelning. Strängparametern `name` SKA stödja modifierarna `:contains` och `:exact`. Konventionerna följer IHE mCSD (ITI-90).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"]
  },
  {
    "key" : "REQ-END-1",
    "label" : "Ändpunkt.id",
    "conformance" : ["SHALL"],
    "requirement" : "Varje ändpunkt SKA ha ett unikt id.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-END-2",
    "label" : "Ändpunkt.status",
    "conformance" : ["SHALL"],
    "requirement" : "Ändpunktens status SKA anges.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-END-3",
    "label" : "Ändpunkt.namn",
    "conformance" : ["SHALL"],
    "requirement" : "Ändpunktens namn SKA anges.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-END-4",
    "label" : "Ändpunkt.adress",
    "conformance" : ["SHALL"],
    "requirement" : "Ändpunktens URL SKA anges (se även REQ-SRCH-2).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-END-5",
    "label" : "Ändpunkt.giltigFrom / giltigTom",
    "conformance" : ["SHOULD"],
    "requirement" : "Ändpunktens giltighetsperiod BÖR anges.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-END-6",
    "label" : "Ändpunkt.säkerhetsmetod",
    "conformance" : ["SHOULD"],
    "requirement" : "Den säkerhetsmetod som skyddar ändpunkten BÖR anges. Kodverket för detta attribut är i detta utkast preliminärt (example-bindning) — se mappings.html.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method"]
  },
  {
    "key" : "REQ-END-7",
    "label" : "Ändpunkt.urlTillAuktorisationsserver",
    "conformance" : ["SHOULD"],
    "conditionality" : true,
    "requirement" : "Om ändpunktens säkerhetsmetod (REQ-END-6) är OAuth 2.0-baserad BÖR URL till auktorisationsserverns token-endpoint anges.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url"]
  },
  {
    "key" : "REQ-END-8",
    "label" : "Ändpunkt.protokoll",
    "conformance" : ["SHALL"],
    "requirement" : "Minst ett protokoll som ändpunkten stödjer SKA anges.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-ORG-1",
    "label" : "Organisation.id / namn",
    "conformance" : ["SHALL"],
    "requirement" : "Varje organisation SKA ha ett unikt id och ett namn.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "key" : "REQ-ORG-2",
    "label" : "Organisation.organisationsnummer",
    "conformance" : ["SHOULD"],
    "requirement" : "Den juridiska personens organisationsnummer BÖR anges som identifierare med systemet `urn:oid:2.5.4.97` (samma system som EHM:s Organization Endpoint Writer kräver, se mappings.html). Värdet SKA anges som tio siffror utan bindestreck, t.ex. `2321000016`; admin-API:t avvisar andra format med `422 Unprocessable Entity`. Organisationsnummer krävs för att organisationen ska kunna synkroniseras till EHM (REQ-WRT-5).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "key" : "REQ-ORG-3",
    "label" : "Organisation.endpoint (\"har\")",
    "conformance" : ["SHALL"],
    "requirement" : "En organisation SKA kunna lista de ändpunkter den \"har\" via `Organization.endpoint`, sökbart enligt REQ-SRCH-1.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
    "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by"]
  },
  {
    "key" : "REQ-ORG-4",
    "label" : "Endpoint.managingOrganization (\"förvaltar\")",
    "conformance" : ["SHALL"],
    "requirement" : "Varje ändpunkt SKA ange sin förvaltande organisation i `Endpoint.managingOrganization`, sökbar med standardparametern `organization`.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-ORG-5",
    "label" : "Organization.identifier som \"logisk adress\"",
    "conformance" : ["SHALL"],
    "requirement" : "`Organization.identifier` SKA fungera som den \"logiska adress\" tjänstesökning slår upp, sökbar med standardparametern `identifier`. Ingen separat identifierare för \"logisk adress\" införs — stakeholder-beslut, se mappings.html.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"]
  },
  {
    "key" : "REQ-ORG-6",
    "label" : "HSA-id som primär identifierare",
    "conformance" : ["SHALL"],
    "requirement" : "Varje organisation SKA ha exakt ett HSA-id (system `urn:oid:1.2.752.29.4.19`), som är organisationens primära identifierare och logiska adress. HSA-id består av prefixet `SE`, organisationsnumret för den direktanslutna producenten i formatet tio siffror utan bindestreck, samt ett bindestreck och en efterföljande identifierande del (t.ex. `SE2321000016-1003`). Organisationsnumret i HSA-id:t avser den direktanslutna producenten och SKA INTE användas för att härleda organisationens eget organisationsnummer.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "key" : "REQ-ORG-7",
    "label" : "Unika organisationsidentifierare",
    "conformance" : ["SHALL"],
    "requirement" : "Ett HSA-id SKA identifiera högst en organisation i katalogen, och detsamma gäller organisationsnummer. Admin-API:t SKA avvisa en registrering som skulle ge en dubblett med `422 Unprocessable Entity` (OperationOutcome med koden `business-rule`). Kravet gäller identifierare som är aktuella; en identifierare som inte längre gäller får ligga kvar med `period.end` satt.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-ORG-8",
    "label" : "Organisationsnummer på den juridiska personen",
    "conformance" : ["SHALL"],
    "requirement" : "Organisationsnummer SKA endast anges på den organisation som är den juridiska personen (t.ex. vårdgivaren). Underliggande organisatoriska enheter har eget HSA-id och SKA ange den överordnade organisationen i `Organization.partOf`, sökbart med `partof`. Samma hierarkimönster som IHE mCSD.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "key" : "REQ-ORG-9",
    "label" : "Godkända identifierarsystem",
    "conformance" : ["SHALL"],
    "requirement" : "Admin-API:t SKA i denna version endast godta organisationsidentifierare med systemen `urn:oid:1.2.752.29.4.19` (HSA-id) och `urn:oid:2.5.4.97` (organisationsnummer). Andra system avvisas med `422 Unprocessable Entity`. Profilens slicing är öppen så att fler system kan läggas till i en senare version.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-WRT-1",
    "label" : "Läsning via tjänstekatalogens admin-API",
    "conformance" : ["SHALL"],
    "requirement" : "Synkroniseringstjänsten SKA läsa organisationer och ändpunkter via tjänstekatalogens administrativa API, särskilt vilka ändpunkter en organisation listar (REQ-SRCH-1), som underlag för synkroniseringen mot EHM.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-synkroniseringstjanst",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-WRT-2",
    "label" : "Anropa EHM:s $add-organization",
    "conformance" : ["MAY"],
    "requirement" : "Synkroniseringstjänsten FÅR, i rollen Organization Endpoint Writer hos EHM, koppla en organisation till en ändpunkt genom att anropa POST [ehm-base]/Endpoint/[ehm-id]/$add-organization med organisationens organisationsnummer enligt EHM:s specifikation. Personnummer/samordningsnummer hör till EHM:s patientindex och kombinerade sökningar däremellan — inte till organisationsidentifiering i detta anrop, se REQ-WRT-5. Se mappningstabellen i mappings.html för hur `organization`-parametern fylls från tjänstekatalogens data.",
    "satisfiedBy" : ["http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er",
    "http://electronichealth.se/fhir/NDI/OperationDefinition/AddOrganizationToEndpoint"]
  },
  {
    "key" : "REQ-WRT-3",
    "label" : "Anropa EHM:s $remove-organization",
    "conformance" : ["MAY"],
    "requirement" : "Synkroniseringstjänsten FÅR, analogt med REQ-WRT-2, koppla loss en organisation från en ändpunkt genom att anropa POST [ehm-base]/Endpoint/[ehm-id]/$remove-organization.",
    "satisfiedBy" : ["http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er",
    "http://electronichealth.se/fhir/NDI/OperationDefinition/RemoveOrganizationFromEndpoint"]
  },
  {
    "key" : "REQ-WRT-4",
    "label" : "Korrelation med EHM:s Endpoint-id",
    "conformance" : ["SHALL"],
    "requirement" : "Varje ändpunkt som ska synkroniseras SKA kunna korreleras med EHM:s eget logiska id för samma ändpunkt i deras register, eftersom $add-organization/$remove-organization adresserar ändpunkten via EHM:s id, inte tjänstekatalogens.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  {
    "key" : "REQ-WRT-5",
    "label" : "Format på organisationsidentifierare mot EHM",
    "conformance" : ["SHALL"],
    "requirement" : "Organisationsidentifierare som skickas till EHM:s $add-organization/$remove-organization SKA vara organisationsnummer i det system och format EHM kräver (urn:oid:2.5.4.97, 10 siffror utan bindestreck). Personnummer/samordningsnummer (http://electronichealth.se/identifier/{personnummer|samordningsnummer}) SKA INTE användas för att identifiera en organisation i detta anrop — de hör till EHM:s patientindex och till sökningar som kombinerar tjänstekatalog med patientindex, inte till denna IG:s scope. Se mappningstabellen i mappings.html.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "key" : "REQ-WRT-6",
    "label" : "FHIR-version och format",
    "conformance" : ["SHALL"],
    "requirement" : "Tjänstekatalogens administrativa API SKA använda FHIR R5 (5.0.0) och SKA stödja JSON. EHM:s Organization Endpoint Writer-gränssnitt gör detsamma (bekräftat i deras CapabilityStatement).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api",
    "http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er"]
  },
  {
    "key" : "REQ-WRT-7",
    "label" : "Skapa/uppdatera Endpoint hos EHM",
    "conformance" : ["SHALL"],
    "requirement" : "Innan Synkroniseringstjänsten anropar $add-organization/$remove-organization (REQ-WRT-2/3) SKA motsvarande Endpoint finnas hos EHM, konform med EHM:s profil endpoint-er, mappad enligt mappningstabellen i mappings.html. Observera kardinalitetsskillnaden för payload-specifikationer (EHM tillåter en per payload, denna IG flera) och att säkerhetsmetod/auktorisationsserver-URL kräver kodöversättning respektive strukturell ombyggnad, inte bara värdekopiering.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
    "http://electronichealth.se/fhir/NDI/StructureDefinition/endpoint-er"]
  },
  {
    "key" : "REQ-WRT-8",
    "label" : "Skapa/uppdatera Organization hos EHM",
    "conformance" : ["SHALL"],
    "requirement" : "Innan Synkroniseringstjänsten kopplar en organisation till en ändpunkt hos EHM SKA organisationen finnas hos EHM, konform med EHM:s profil organization-er, mappad enligt mappningstabellen i mappings.html. Observera att EHM:s Organization.type saknar källa i denna IG:s informationsunderlag (öppen fråga, se mappings.html).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
    "http://electronichealth.se/fhir/NDI/StructureDefinition/organization-er"]
  },
  {
    "key" : "REQ-MDL-1",
    "label" : "Indexpost",
    "conformance" : ["SHOULD"],
    "requirement" : "Entiteten Indexpost BÖR modelleras för spårbarhet. REST-exponering (läsning/sökning) i det administrativa API:et är avgränsat bort från detta utkast; direkt skapande/uppdatering från klient är inte avsett, då en indexpost förväntas vara en serverhärledd effekt av registrering av Organisation eller Vård- och omsorgstagare.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-indexpost"]
  },
  {
    "key" : "REQ-MDL-2",
    "label" : "Vård- och omsorgstagare",
    "conformance" : ["SHOULD"],
    "requirement" : "Entiteten Vård- och omsorgstagare BÖR modelleras för spårbarhet i förhållande till Indexpost.avser. Personuppgifter om vård- och omsorgstagare omfattas inte av detta administrativa API för tjänstekatalogen (teknisk ändpunktskatalog) — se \"Avvikelser och tillägg\" i mappings.html.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare"]
  },
  {
    "key" : "REQ-MDL-3",
    "label" : "API (Ändpunkt tillgängliggör API, API följer API-specifikation)",
    "conformance" : ["SHALL"],
    "requirement" : "Kopplingen mellan en ändpunkt och de API:er den tillgängliggör, samt vilken/vilka API-specifikationer respektive API följer, SKA kunna uttryckas. Detta realiseras på två komplementära sätt (uppdaterat, se \"Avvikelser och tillägg\" i mappings.html): dels `Endpoint.payload` tillsammans med extensionen tk-endpoint-payload-profile (snabb, enhops sökbarhet, se REQ-SRCH-3/4), dels en egen resurs, TKAPIInstance (CapabilityStatement kind=instance), som ger \"API\" en egen identitet — se REQ-MDL-6/7 för vad den tillför utöver payload-extensionen.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
    "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile",
    "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance"]
  },
  {
    "key" : "REQ-MDL-4",
    "label" : "API-specifikation",
    "conformance" : ["SHALL"],
    "requirement" : "Entiteten API-specifikation SKA kunna registreras och sökas som en egen resurs. Realiseras som TKAPISpecificationCapability (CapabilityStatement kind=requirements), sökbar på kanonisk url — inte ActorDefinition (EHM:s val för sin motsvarande \"API Specification\"-profil, vilket denna IG avvisar eftersom ActorDefinition är avsett för aktörer, inte specifikationer), inte heller Basic eller ImplementationGuide (denna IG:s tidigare rekommendation, ersatt efter jämförelse med en annan implementation av samma problem — CapabilityStatement.kind=requirements är native FHIR-mekanik för en formell kravbild, och används redan av denna IG:s egna TKAdminAPI/TKSearchAPI). Se \"Avvikelser och tillägg\" i mappings.html.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability"]
  },
  {
    "key" : "REQ-MDL-5",
    "label" : "Spårbarhet: skapad/senast uppdaterad av",
    "conformance" : ["SHALL"],
    "requirement" : "Vem som skapade eller senast uppdaterade en post SKA vara spårbart. Tidigare avgränsat bort och uppskjutet till en framtida version (löst med serverloggning och/eller Provenance) — nu realiserat via en obligatorisk Provenance-post per registrering, se REQ-TRC-1/2.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"]
  },
  {
    "key" : "REQ-MDL-6",
    "label" : "API-instansens egen giltighetsperiod",
    "conformance" : ["SHOULD"],
    "requirement" : "En API-instans (TKAPIInstance) BÖR kunna ange sin egen giltighetsperiod (giltigFrom/giltigTom), oberoende av den tillgängliggörande ändpunktens `Endpoint.period`. Löser den begränsning som tidigare dokumenterades i mappings.html (\"API:ets egen giltigFrom/giltigTom bärs inte separat\") — basresursen CapabilityStatement saknar ett eget giltighetsperiod-element, löst med en extension.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period"]
  },
  {
    "key" : "REQ-MDL-7",
    "label" : "API-instansens koppling till Ändpunkt och API-specifikation",
    "conformance" : ["SHALL"],
    "requirement" : "Varje TKAPIInstance SKA referera den ändpunkt som tillgängliggör den (\"tillgängliggör\", via extensionen tk-api-instance-endpoint) och SKA referera den/de API-specifikationer den följer (\"följer\", via `CapabilityStatement.instantiates`), sökbart via en egen sökparameter (`instantiates`, eftersom ingen standard-sökparameter finns för detta element).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance",
    "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint",
    "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates"]
  },
  {
    "key" : "REQ-MDL-8",
    "label" : "Flera versioner av samma API-specifikation",
    "conformance" : ["SHALL"],
    "requirement" : "Flera versioner av samma API-specifikation (samma `url`) FÅR finnas samtidigt i katalogen. `version` SKA anges, och kombinationen `url` + `version` SKA vara unik; admin-API:t avvisar dubbletter med `422 Unprocessable Entity`. Sökning på `url` returnerar alla versioner; sökparametrarna `version` och `date` (med `_sort=-date`) används för att välja version. API-instanser och ändpunkter BÖR referera specifikationen som `url|version`.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"]
  },
  {
    "key" : "REQ-TRC-1",
    "label" : "Provenance krävs vid registrering",
    "conformance" : ["SHALL"],
    "requirement" : "Varje transaction-Bundle som registrerar (skapar/uppdaterar) en Organization, Endpoint, CapabilityStatement (API-specifikation/API-instans) eller PractitionerRole (administratörsbehörighet, TKAdministratorRole) SKA innehålla minst en Provenance-post (profilerad som TKProvenance) som via `Provenance.target` pekar ut den/de registrerade resurserna.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"]
  },
  {
    "key" : "REQ-TRC-2",
    "label" : "Registrering via transaction-Bundle",
    "conformance" : ["SHALL"],
    "requirement" : "Tjänstekatalogens administrativa API SKA stödja systeminteraktionen `transaction` (en Bundle av typen transaction), så att en registrerad resurs och dess Provenance-post skapas/uppdateras atomiskt tillsammans.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-TRC-3",
    "label" : "Spårbarhet för ändrade administratörsbehörigheter",
    "conformance" : ["SHOULD"],
    "requirement" : "När en administratörsbehörighet (TKAdministratorRole) skapas eller ändras BÖR `Provenance.agent.who` peka ut den ändrande administratörens egen TKAdministratorRole, så att det framgår både vem som gjorde ändringen och med vilken behörighet. Sökbart med `Provenance?target=PractitionerRole/[id]`.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-EXP-1",
    "label" : "Sök-API exponeras externt via gateway",
    "conformance" : ["SHALL"],
    "requirement" : "Läsande sökning (read/search-type på Organization/Endpoint) SKA exponeras externt, via en gateway, för sökande konsumenter.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"]
  },
  {
    "key" : "REQ-EXP-2",
    "label" : "Administrativa API:er endast interna",
    "conformance" : ["SHALL"],
    "requirement" : "Skrivande interaktioner (create/update på Organization/Endpoint/PractitionerRole) SKA vara internt exponerade endast och SKA INTE nås via den externa gatewayen.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-ADM-1",
    "label" : "Administratörsbehörighetens nivå",
    "conformance" : ["SHALL"],
    "requirement" : "Varje administratörsbehörighet SKA ange en administrationsnivå (local-admin eller central-admin).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"]
  },
  {
    "key" : "REQ-ADM-2",
    "label" : "Representerad organisation",
    "conformance" : ["SHALL"],
    "conditionality" : true,
    "requirement" : "En local-admin-behörighet SKA ange vilken organisation den representerar (`TKAdministratorRole.organization`), analogt med `Endpoint.managingOrganization`. En central-admin-behörighet representerar samtliga organisationer och utelämnar medvetet detta element.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"]
  },
  {
    "key" : "REQ-ADM-3",
    "label" : "Behörighetens innehavare",
    "conformance" : ["SHOULD"],
    "requirement" : "En administratörsbehörighet BÖR ange vilket konto/system som innehar den.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"]
  },
  {
    "key" : "REQ-ADM-4",
    "label" : "Giltighet och återkallande",
    "conformance" : ["SHALL"],
    "requirement" : "En administratörsbehörighet gäller bara om `active` inte är `false` och aktuell tidpunkt ligger inom `period`. En behörighet SKA återkallas genom en uppdatering som sätter `active = false` och/eller `period.end`, inte genom att den tas bort, så att återkallandet spåras med en Provenance-post (REQ-TRC-1/3).",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-DIST-1",
    "label" : "Prenumeration på förändringar (topic-baserad Subscription)",
    "conformance" : ["SHOULD"],
    "requirement" : "Servern BÖR stödja R5 topic-baserad `Subscription` mot ämnet `tk-organization-endpoint-changes`, så att lokala kataloger kan prenumerera på skapande/uppdatering/borttagning av Organization/Endpoint, som ett alternativ till periodisk pollning.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes"]
  },
  {
    "key" : "REQ-DIST-2",
    "label" : "Grundladdning via _lastUpdated",
    "conformance" : ["SHOULD"],
    "requirement" : "Servern BÖR stödja grundladdning genom att sökningar på Organization, Endpoint och CapabilityStatement kan avgränsas med den generella sökparametern `_lastUpdated`, utan att en separat grundladdningsoperation behöver definieras. Parametern finns i sök-API:t, som notifieringarna (REQ-DIST-1) hänvisar klienterna till.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-DIST-3",
    "label" : "Undvik rundgång — öppen fråga",
    "conformance" : ["MAY"],
    "requirement" : "I en dubbelriktad federerad miljö FÅR ett ursprungsmärke på Organization/Endpoint användas för att undvika att en lokal katalogs egna uppdateringar studsar tillbaka via prenumerationen. Inte löst i detta utkast — se öppen fråga i mappings.html."
  },
  {
    "key" : "REQ-DIST-4",
    "label" : "Återsynkronisering via _history",
    "conformance" : ["SHOULD"],
    "requirement" : "Servern BÖR stödja interaktionen `history-type` med parametern `_since` på Organization och Endpoint (t.ex. `GET [base]/Endpoint/_history?_since=[tidpunkt]`) för återsynkronisering. Till skillnad från sökning med `_lastUpdated` syns även borttagna poster. Bulkexport (`$export`) behövs inte, eftersom datamängderna väntas vara små.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-DIST-5",
    "label" : "Ändrad koppling är en ändring av organisationen",
    "conformance" : ["SHALL"],
    "requirement" : "Kopplingen \"har\" lagras i `Organization.endpoint`. En ändring av den SKA hanteras som en uppdatering av Organization: ny version, nytt `meta.lastUpdated` och notifiering via prenumerationsämnet. En ändring av en Endpoint, inklusive `managingOrganization` (\"förvaltar\"), är en ändring av Endpoint och ändrar inte organisationen.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api",
    "https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes"]
  }]
}

```
