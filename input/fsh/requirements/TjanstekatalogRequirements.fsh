// Formal requirements catalogue for tjänstekatalogen, using the FHIR R5
// Requirements resource. Each statement's `satisfiedBy` links to the FSH
// artefact(s) that realise it, giving a machine-readable trace from
// attribute/requirement to profile element, extension, search parameter or
// operation. See requirements.html for the human-readable rendering and
// mappings.html for the reverse view (element → requirement).
//
// Requirement keys are grouped by topic:
//   REQ-SRCH-*  Sökning av ändpunkter per organisation
//   REQ-END-*   Attribut på Ändpunkt (Endpoint)
//   REQ-ORG-*   Attribut och relationer på Organisation
//   REQ-WRT-*   Organization Endpoint Writer (skrivgränssnitt)
//   REQ-MDL-*   Övriga entiteter i informationsunderlaget / avgränsningar
Instance: TKTjanstekatalogRequirements
InstanceOf: Requirements
Usage: #definition
Title: "Kravkatalog: Tjänstekatalogen"
Description: "Formell kravkatalog för tjänstekatalogen, med spårning från krav till realiserande FHIR-artefakter."

* id = "tk-tjanstekatalog-requirements"
* url = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* version = "0.1.0"
* name = "TKTjanstekatalogRequirements"
* title = "Kravkatalog: Tjänstekatalogen"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Formell kravkatalog för tjänstekatalogen. Varje krav spåras till den/de FHIR-artefakt(er) som realiserar det via `satisfiedBy`. Se requirements.html för en läsbar vy och mappings.html för den omvända vyn (attribut → krav)."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* actor[0] = Canonical(TKOrganizationEndpointWriter)

// --- REQ-SRCH: sökning av ändpunkter per organisation ---

* statement[0].key = "REQ-SRCH-1"
* statement[=].label = "Sök ändpunkter per organisation (\"har\")"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Servern SKA stödja sökning av Endpoint-resurser via en sökparameter som returnerar samtliga ändpunkter en angiven organisation listar via `Organization.endpoint` (\"har\"-relationen), oavsett vilken organisation som tekniskt förvaltar respektive ändpunkt."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by"

* statement[+].key = "REQ-SRCH-2"
* statement[=].label = "Ändpunktens URL i address"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Ändpunktens URL SKA anges i `Endpoint.address`."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-SRCH-3"
* statement[=].label = "Stödda interoperabilitetsspecifikationer per ändpunkt"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Servern BÖR, per nyttolast (`Endpoint.payload`) som ändpunkten tillgängliggör, ange vilken/vilka interoperabilitetsspecifikationer (API-specifikationer) nyttolasten följer."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"

// --- REQ-END: attribut på Ändpunkt ---

* statement[+].key = "REQ-END-1"
* statement[=].label = "Ändpunkt.id"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje ändpunkt SKA ha ett unikt id."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-END-2"
* statement[=].label = "Ändpunkt.status"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Ändpunktens status SKA anges."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-END-3"
* statement[=].label = "Ändpunkt.namn"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Ändpunktens namn SKA anges."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-END-4"
* statement[=].label = "Ändpunkt.adress"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Ändpunktens URL SKA anges (se även REQ-SRCH-2)."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-END-5"
* statement[=].label = "Ändpunkt.giltigFrom / giltigTom"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Ändpunktens giltighetsperiod BÖR anges."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-END-6"
* statement[=].label = "Ändpunkt.säkerhetsmetod"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Den säkerhetsmetod som skyddar ändpunkten BÖR anges. Kodverket för detta attribut är i detta utkast preliminärt (example-bindning) — se mappings.html."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method"

* statement[+].key = "REQ-END-7"
* statement[=].label = "Ändpunkt.urlTillAuktorisationsserver"
* statement[=].conformance[0] = #SHOULD
* statement[=].conditionality = true
* statement[=].requirement = "Om ändpunktens säkerhetsmetod (REQ-END-6) är OAuth 2.0-baserad BÖR URL till auktorisationsserverns token-endpoint anges."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url"

* statement[+].key = "REQ-END-8"
* statement[=].label = "Ändpunkt.protokoll"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Minst ett protokoll som ändpunkten stödjer SKA anges."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

// --- REQ-ORG: attribut och relationer på Organisation ---

* statement[+].key = "REQ-ORG-1"
* statement[=].label = "Organisation.id / namn"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje organisation SKA ha ett unikt id och ett namn."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"

* statement[+].key = "REQ-ORG-2"
* statement[=].label = "Organisation.organisationsnummer"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Organisationens organisationsnummer BÖR anges som identifierare. Identifierarsystemets URI är i detta utkast ett antagande i väntan på bekräftelse mot Ineras auktoritativa OID/URI-register — se aliases.fsh."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"

* statement[+].key = "REQ-ORG-3"
* statement[=].label = "Organisation.endpoint (\"har\")"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "En organisation SKA kunna lista de ändpunkter den \"har\" via `Organization.endpoint`, sökbart enligt REQ-SRCH-1."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by"

* statement[+].key = "REQ-ORG-4"
* statement[=].label = "Endpoint.managingOrganization (\"förvaltar\")"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje ändpunkt SKA ange sin förvaltande organisation i `Endpoint.managingOrganization`, sökbar med standardparametern `organization`."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

// --- REQ-WRT: Organization Endpoint Writer (skrivgränssnitt) ---

* statement[+].key = "REQ-WRT-1"
* statement[=].label = "$add-organization-to-endpoint"
* statement[=].conformance[0] = #MAY
* statement[=].requirement = "En Organization Endpoint Writer FÅR koppla en organisation till en ändpunkt (lägga till i Organization.endpoint) via operationen $add-organization-to-endpoint på Endpoint, utan att behöva skrivrättighet till hela Organization-resursen."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-add-organization-to-endpoint"

* statement[+].key = "REQ-WRT-2"
* statement[=].label = "$remove-organization-from-endpoint"
* statement[=].conformance[0] = #MAY
* statement[=].requirement = "En Organization Endpoint Writer FÅR koppla loss en organisation från en ändpunkt (ta bort från Organization.endpoint) via operationen $remove-organization-from-endpoint på Endpoint."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-remove-organization-from-endpoint"

* statement[+].key = "REQ-WRT-3"
* statement[=].label = "FHIR-version och format"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Tjänstekatalogens administrativa API och Organization Endpoint Writer-gränssnittet SKA använda FHIR R5 (5.0.0) och SKA stödja JSON."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-organization-endpoint-writer"

// --- REQ-MDL: övriga entiteter i informationsunderlaget / avgränsningar ---

* statement[+].key = "REQ-MDL-1"
* statement[=].label = "Indexpost"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Entiteten Indexpost BÖR modelleras för spårbarhet. REST-exponering (läsning/sökning) i det administrativa API:et är avgränsat bort från detta utkast; direkt skapande/uppdatering från klient är inte avsett, då en indexpost förväntas vara en serverhärledd effekt av registrering av Organisation eller Vård- och omsorgstagare."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-indexpost"

* statement[+].key = "REQ-MDL-2"
* statement[=].label = "Vård- och omsorgstagare"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Entiteten Vård- och omsorgstagare BÖR modelleras för spårbarhet i förhållande till Indexpost.avser. Personuppgifter om vård- och omsorgstagare omfattas inte av detta administrativa API för tjänstekatalogen (teknisk ändpunktskatalog) — se \"Avvikelser och tillägg\" i mappings.html."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare"

* statement[+].key = "REQ-MDL-3"
* statement[=].label = "API (Ändpunkt tillgängliggör API, API följer API-specifikation)"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Kopplingen mellan en ändpunkt och de API:er den tillgängliggör, samt vilken API-specifikation respektive API följer, SKA kunna uttryckas. Detta realiseras via `Endpoint.payload` tillsammans med extensionen tk-endpoint-payload-profile, inte som en egen resurs — se \"Avvikelser och tillägg\" i mappings.html för motivering, inklusive varför API:ets egen giltigFrom/giltigTom inte bärs separat."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"

* statement[+].key = "REQ-MDL-4"
* statement[=].label = "API-specifikation"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Entiteten API-specifikation BÖR modelleras för spårbarhet. Beslut om REST-exponering (t.ex. som en profil på Basic, eller som en egen resurstyp) i det administrativa API:et skjuts upp till en framtida version av denna IG."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification"
