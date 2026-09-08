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
    "requirement" : "Synkroniseringstjänsten FÅR, i rollen Organization Endpoint Writer hos EHM, koppla en organisation till en ändpunkt genom att anropa POST [ehm-base]/Endpoint/[ehm-id]/$add-organization med organisationens identifierare (personnummer, samordningsnummer eller organisationsnummer) enligt EHM:s specifikation. Se mappningstabellen i mappings.html för hur `organization`-parametern fylls från tjänstekatalogens data.",
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
    "requirement" : "Organisationsidentifierare som skickas till EHM:s $add-organization/$remove-organization SKA vara i det system och format EHM kräver (personnummer/samordningsnummer: http://electronichealth.se/identifier/{personnummer|samordningsnummer}, 12 siffror utan bindestreck; organisationsnummer: urn:oid:2.5.4.97, 10 siffror utan bindestreck) — se mappningstabellen i mappings.html.",
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
    "requirement" : "Kopplingen mellan en ändpunkt och de API:er den tillgängliggör, samt vilken API-specifikation respektive API följer, SKA kunna uttryckas. Detta realiseras via `Endpoint.payload` tillsammans med extensionen tk-endpoint-payload-profile, inte som en egen resurs — se \"Avvikelser och tillägg\" i mappings.html för motivering, inklusive varför API:ets egen giltigFrom/giltigTom inte bärs separat.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
    "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"]
  },
  {
    "key" : "REQ-MDL-4",
    "label" : "API-specifikation",
    "conformance" : ["SHOULD"],
    "requirement" : "Entiteten API-specifikation BÖR modelleras för spårbarhet. Beslut om REST-exponering i det administrativa API:et skjuts upp till en framtida version av denna IG. Om/när den REST-exponeras rekommenderas en nedbantad profil på ImplementationGuide (som redan bär url/version/name/title/status/date), inte en profil på ActorDefinition — EHM:s val för sin motsvarande \"API Specification\"-profil, vilket denna IG avvisar eftersom ActorDefinition är avsett för aktörer, inte specifikationer — och inte heller Basic. Se \"Avvikelser och tillägg\" i mappings.html.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification"]
  }]
}

```
