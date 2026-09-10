# Kravkatalog: Tjänstekatalogen - Tjänstekatalogen v0.1.0

## Requirements: Kravkatalog: Tjänstekatalogen (Experimentell) 

 
Formell kravkatalog för tjänstekatalogen. Varje krav spåras till den/de FHIR-artefakt(er) som realiserar det via `satisfiedBy`. Se requirements.html för en läsbar vy och mappings.html för den omvända vyn (attribut → krav). 



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
    "requirement" : "Organisationens organisationsnummer BÖR anges som identifierare. Identifierarsystemets URI är i detta utkast ett antagande i väntan på bekräftelse mot Ineras auktoritativa OID/URI-register — se aliases.fsh.",
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
    "key" : "REQ-TRC-1",
    "label" : "Provenance krävs vid registrering",
    "conformance" : ["SHALL"],
    "requirement" : "Varje transaction-Bundle som registrerar (skapar/uppdaterar) en Organization, Endpoint eller CapabilityStatement (API-specifikation/API-instans) SKA innehålla minst en Provenance-post (profilerad som TKProvenance) som via `Provenance.target` pekar ut den/de registrerade resurserna.",
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
    "requirement" : "Servern BÖR stödja grundladdning och återsynk genom att sökningarna på Organization/Endpoint kan avgränsas med det generella FHIR-sökparametern `_lastUpdated` (tidsintervall), utan att en separat grundladdnings-operation behöver definieras.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"]
  },
  {
    "key" : "REQ-DIST-3",
    "label" : "Undvik rundgång — öppen fråga",
    "conformance" : ["MAY"],
    "requirement" : "I en dubbelriktad federerad miljö FÅR ett ursprungsmärke på Organization/Endpoint användas för att undvika att en lokal katalogs egna uppdateringar studsar tillbaka via prenumerationen. Inte löst i detta utkast — se öppen fråga i mappings.html."
  }]
}

```
