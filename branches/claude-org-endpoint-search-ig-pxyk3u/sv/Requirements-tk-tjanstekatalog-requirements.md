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
  "actor" : ["https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-organization-endpoint-writer"],
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
    "label" : "$add-organization-to-endpoint",
    "conformance" : ["MAY"],
    "requirement" : "En Organization Endpoint Writer FÅR koppla en organisation till en ändpunkt (lägga till i Organization.endpoint) via operationen $add-organization-to-endpoint på Endpoint, utan att behöva skrivrättighet till hela Organization-resursen.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-add-organization-to-endpoint"]
  },
  {
    "key" : "REQ-WRT-2",
    "label" : "$remove-organization-from-endpoint",
    "conformance" : ["MAY"],
    "requirement" : "En Organization Endpoint Writer FÅR koppla loss en organisation från en ändpunkt (ta bort från Organization.endpoint) via operationen $remove-organization-from-endpoint på Endpoint.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-remove-organization-from-endpoint"]
  },
  {
    "key" : "REQ-WRT-3",
    "label" : "FHIR-version och format",
    "conformance" : ["SHALL"],
    "requirement" : "Tjänstekatalogens administrativa API och Organization Endpoint Writer-gränssnittet SKA använda FHIR R5 (5.0.0) och SKA stödja JSON.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api",
    "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-organization-endpoint-writer"]
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
    "requirement" : "Entiteten API-specifikation BÖR modelleras för spårbarhet. Beslut om REST-exponering (t.ex. som en profil på Basic, eller som en egen resurstyp) i det administrativa API:et skjuts upp till en framtida version av denna IG.",
    "satisfiedBy" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification"]
  }]
}

```
