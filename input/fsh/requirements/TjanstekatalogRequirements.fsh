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
//   REQ-WRT-*   Synkronisering mot EHM:s Organization Endpoint Writer
//   REQ-MDL-*   Övriga entiteter i informationsunderlaget / avgränsningar
//   REQ-EXP-*   Exponering: sök-API externt (gateway) vs. admin-API internt
//   REQ-ADM-*   Administratörsbehörighet (utökning utöver informationsunderlaget)
//   REQ-DIST-*  Distribution/federering till lokala kataloger
//   REQ-TRC-*   Spårbarhet och transaktionell registrering (Provenance)
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
* actor[0] = Canonical(TKSynkroniseringstjanst)
// E-hälsomyndighetens (EHM) eget Organization Endpoint Writer-aktör, definierad
// i deras IG, inte omdefinierad här — se REQ-WRT-2/3.
* actor[+] = "http://electronichealth.se/fhir/NDI/ActorDefinition/organization-endpoint-writer-actor-er"

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

* statement[+].key = "REQ-SRCH-4"
* statement[=].label = "Sök ändpunkter efter stödd interoperabilitetsspecifikation"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Servern BÖR stödja sökning av Endpoint-resurser via en sökparameter (`implements`) som returnerar samtliga ändpunkter vars nyttolast stödjer en angiven interoperabilitetsspecifikation, som komplement till REQ-SRCH-3:s representation. Tillagt efter jämförelse med en annan implementation av samma problem."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements"

* statement[+].key = "REQ-SRCH-5"
* statement[=].label = "Sökning på organisationsidentifierare"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Vid sökning med `identifier` på Organization SKA HSA-id (`urn:oid:1.2.752.29.4.19`) matchas exakt som det är skrivet; bindestrecket ingår i identifieraren. För organisationsnummer (`urn:oid:2.5.4.97`) SKA servern godta värdet både med och utan bindestreck (`232100-0016` och `2321000016` ger samma träff). Ingen normalisering görs när system saknas i sökvärdet."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-SRCH-6"
* statement[=].label = "Sökning på kanoniska referenser (instantiates, implements)"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Sökparametrarna `instantiates` (CapabilityStatement) och `implements` (Endpoint) är av typen `reference` och SKA godta en kanonisk URL, som matchar alla versioner (även referenser utan version), och `url|version`, som endast matchar den angivna versionen. Literala referenser (`CapabilityStatement/[id]`) stöds inte. Kedjad sökning krävs inte."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements"

* statement[+].key = "REQ-SRCH-7"
* statement[=].label = "Felregistrerade ändpunkter"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Vid sökning på Endpoint utan parametern `status` SKA ändpunkter med status `entered-in-error` utelämnas. De SKA returneras när klienten uttryckligen söker `status=entered-in-error`, och alltid vid `read`. Övriga statusar, och organisationer med `active=false`, filtreras inte bort."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-SRCH-8"
* statement[=].label = "Giltighetsperiod filtreras inte av servern"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Servern SKA INTE filtrera sökresultat på `Endpoint.period` eller på API-instansens giltighetsperiod, och SKA INTE ändra status när en period har löpt ut. Klienten avgör användbarhet: en ändpunkt kan användas om `status = active` och aktuell tidpunkt ligger inom `period`."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period"

* statement[+].key = "REQ-SRCH-9"
* statement[=].label = "Sökkonventioner"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Sök-API:t SKA stödja de sökparametrar som deklareras i TKSearchAPI, inklusive `_id`, `_lastUpdated`, `partof` och `active` på Organization, `_include=Organization:endpoint` (logisk adress till ändpunkter i ett anrop) samt `_count` och sidindelning. Strängparametern `name` SKA stödja modifierarna `:contains` och `:exact`. Konventionerna följer IHE mCSD (ITI-90)."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"

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
* statement[=].requirement = "Den juridiska personens organisationsnummer BÖR anges som identifierare med systemet `urn:oid:2.5.4.97` (samma system som EHM:s Organization Endpoint Writer kräver, se mappings.html). Värdet SKA anges som tio siffror utan bindestreck, t.ex. `2321000016`; admin-API:t avvisar andra format med `422 Unprocessable Entity`. Organisationsnummer krävs för att organisationen ska kunna synkroniseras till EHM (REQ-WRT-5)."
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

* statement[+].key = "REQ-ORG-5"
* statement[=].label = "Organization.identifier som \"logisk adress\""
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "`Organization.identifier` SKA fungera som den \"logiska adress\" tjänstesökning slår upp, sökbar med standardparametern `identifier`. Ingen separat identifierare för \"logisk adress\" införs — stakeholder-beslut, se mappings.html."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"

* statement[+].key = "REQ-ORG-6"
* statement[=].label = "HSA-id som primär identifierare"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje organisation SKA ha exakt ett HSA-id (system `urn:oid:1.2.752.29.4.19`), som är organisationens primära identifierare och logiska adress. HSA-id består av prefixet `SE`, organisationsnumret för den direktanslutna producenten i formatet tio siffror utan bindestreck, samt ett bindestreck och en efterföljande identifierande del (t.ex. `SE2321000016-1003`). Organisationsnumret i HSA-id:t avser den direktanslutna producenten och SKA INTE användas för att härleda organisationens eget organisationsnummer."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"

* statement[+].key = "REQ-ORG-7"
* statement[=].label = "Unika organisationsidentifierare"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Ett HSA-id SKA identifiera högst en organisation i katalogen, och detsamma gäller organisationsnummer. Admin-API:t SKA avvisa en registrering som skulle ge en dubblett med `422 Unprocessable Entity` (OperationOutcome med koden `business-rule`). Kravet gäller identifierare som är aktuella; en identifierare som inte längre gäller får ligga kvar med `period.end` satt."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-ORG-8"
* statement[=].label = "Organisationsnummer på den juridiska personen"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Organisationsnummer SKA endast anges på den organisation som är den juridiska personen (t.ex. vårdgivaren). Underliggande organisatoriska enheter har eget HSA-id och SKA ange den överordnade organisationen i `Organization.partOf`, sökbart med `partof`. Samma hierarkimönster som IHE mCSD."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"

* statement[+].key = "REQ-ORG-9"
* statement[=].label = "Godkända identifierarsystem"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Admin-API:t SKA i denna version endast godta organisationsidentifierare med systemen `urn:oid:1.2.752.29.4.19` (HSA-id) och `urn:oid:2.5.4.97` (organisationsnummer). Andra system avvisas med `422 Unprocessable Entity`. Profilens slicing är öppen så att fler system kan läggas till i en senare version."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

// --- REQ-WRT: Synkronisering mot EHM:s Organization Endpoint Writer ---
//
// Organization Endpoint Writer är EHM:s egen aktörsroll (definierad i deras
// IG: http://electronichealth.se/fhir/NDI/ActorDefinition/organization-endpoint-writer-actor-er),
// inte en roll tjänstekatalogens administrativa API självt implementerar.
// Rollen antas av en Synkroniseringstjänst, som läser data härifrån och
// skriver till EHM. Se "Mappning mot EHM:s Organization Endpoint Writer" i
// mappings.html för den fullständiga element-för-element-mappningen.

* statement[+].key = "REQ-WRT-1"
* statement[=].label = "Läsning via tjänstekatalogens admin-API"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Synkroniseringstjänsten SKA läsa organisationer och ändpunkter via tjänstekatalogens administrativa API, särskilt vilka ändpunkter en organisation listar (REQ-SRCH-1), som underlag för synkroniseringen mot EHM."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-synkroniseringstjanst"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-WRT-2"
* statement[=].label = "Anropa EHM:s $add-organization"
* statement[=].conformance[0] = #MAY
* statement[=].requirement = "Synkroniseringstjänsten FÅR, i rollen Organization Endpoint Writer hos EHM, koppla en organisation till en ändpunkt genom att anropa POST [ehm-base]/Endpoint/[ehm-id]/$add-organization med organisationens organisationsnummer enligt EHM:s specifikation. Personnummer/samordningsnummer hör till EHM:s patientindex och kombinerade sökningar däremellan — inte till organisationsidentifiering i detta anrop, se REQ-WRT-5. Se mappningstabellen i mappings.html för hur `organization`-parametern fylls från tjänstekatalogens data."
* statement[=].satisfiedBy[0] = "http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er"
* statement[=].satisfiedBy[+] = "http://electronichealth.se/fhir/NDI/OperationDefinition/AddOrganizationToEndpoint"

* statement[+].key = "REQ-WRT-3"
* statement[=].label = "Anropa EHM:s $remove-organization"
* statement[=].conformance[0] = #MAY
* statement[=].requirement = "Synkroniseringstjänsten FÅR, analogt med REQ-WRT-2, koppla loss en organisation från en ändpunkt genom att anropa POST [ehm-base]/Endpoint/[ehm-id]/$remove-organization."
* statement[=].satisfiedBy[0] = "http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er"
* statement[=].satisfiedBy[+] = "http://electronichealth.se/fhir/NDI/OperationDefinition/RemoveOrganizationFromEndpoint"

* statement[+].key = "REQ-WRT-4"
* statement[=].label = "Korrelation med EHM:s Endpoint-id"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje ändpunkt som ska synkroniseras SKA kunna korreleras med EHM:s eget logiska id för samma ändpunkt i deras register, eftersom $add-organization/$remove-organization adresserar ändpunkten via EHM:s id, inte tjänstekatalogens."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"

* statement[+].key = "REQ-WRT-5"
* statement[=].label = "Format på organisationsidentifierare mot EHM"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Organisationsidentifierare som skickas till EHM:s $add-organization/$remove-organization SKA vara organisationsnummer i det system och format EHM kräver (urn:oid:2.5.4.97, 10 siffror utan bindestreck). Personnummer/samordningsnummer (http://electronichealth.se/identifier/{personnummer|samordningsnummer}) SKA INTE användas för att identifiera en organisation i detta anrop — de hör till EHM:s patientindex och till sökningar som kombinerar tjänstekatalog med patientindex, inte till denna IG:s scope. Se mappningstabellen i mappings.html."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"

* statement[+].key = "REQ-WRT-6"
* statement[=].label = "FHIR-version och format"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Tjänstekatalogens administrativa API SKA använda FHIR R5 (5.0.0) och SKA stödja JSON. EHM:s Organization Endpoint Writer-gränssnitt gör detsamma (bekräftat i deras CapabilityStatement)."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"
* statement[=].satisfiedBy[+] = "http://electronichealth.se/fhir/NDI/CapabilityStatement/organization-endpoint-writer-capabilities-er"

* statement[+].key = "REQ-WRT-7"
* statement[=].label = "Skapa/uppdatera Endpoint hos EHM"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Innan Synkroniseringstjänsten anropar $add-organization/$remove-organization (REQ-WRT-2/3) SKA motsvarande Endpoint finnas hos EHM, konform med EHM:s profil endpoint-er, mappad enligt mappningstabellen i mappings.html. Observera kardinalitetsskillnaden för payload-specifikationer (EHM tillåter en per payload, denna IG flera) och att säkerhetsmetod/auktorisationsserver-URL kräver kodöversättning respektive strukturell ombyggnad, inte bara värdekopiering."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"
* statement[=].satisfiedBy[+] = "http://electronichealth.se/fhir/NDI/StructureDefinition/endpoint-er"

* statement[+].key = "REQ-WRT-8"
* statement[=].label = "Skapa/uppdatera Organization hos EHM"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Innan Synkroniseringstjänsten kopplar en organisation till en ändpunkt hos EHM SKA organisationen finnas hos EHM, konform med EHM:s profil organization-er, mappad enligt mappningstabellen i mappings.html. Observera att EHM:s Organization.type saknar källa i denna IG:s informationsunderlag (öppen fråga, se mappings.html)."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
* statement[=].satisfiedBy[+] = "http://electronichealth.se/fhir/NDI/StructureDefinition/organization-er"

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
* statement[=].requirement = "Kopplingen mellan en ändpunkt och de API:er den tillgängliggör, samt vilken/vilka API-specifikationer respektive API följer, SKA kunna uttryckas. Detta realiseras på två komplementära sätt (uppdaterat, se \"Avvikelser och tillägg\" i mappings.html): dels `Endpoint.payload` tillsammans med extensionen tk-endpoint-payload-profile (snabb, enhops sökbarhet, se REQ-SRCH-3/4), dels en egen resurs, TKAPIInstance (CapabilityStatement kind=instance), som ger \"API\" en egen identitet — se REQ-MDL-6/7 för vad den tillför utöver payload-extensionen."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance"

* statement[+].key = "REQ-MDL-4"
* statement[=].label = "API-specifikation"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Entiteten API-specifikation SKA kunna registreras och sökas som en egen resurs. Realiseras som TKAPISpecificationCapability (CapabilityStatement kind=requirements), sökbar på kanonisk url — inte ActorDefinition (EHM:s val för sin motsvarande \"API Specification\"-profil, vilket denna IG avvisar eftersom ActorDefinition är avsett för aktörer, inte specifikationer), inte heller Basic eller ImplementationGuide (denna IG:s tidigare rekommendation, ersatt efter jämförelse med en annan implementation av samma problem — CapabilityStatement.kind=requirements är native FHIR-mekanik för en formell kravbild, och används redan av denna IG:s egna TKAdminAPI/TKSearchAPI). Se \"Avvikelser och tillägg\" i mappings.html."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability"

* statement[+].key = "REQ-MDL-5"
* statement[=].label = "Spårbarhet: skapad/senast uppdaterad av"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Vem som skapade eller senast uppdaterade en post SKA vara spårbart. Tidigare avgränsat bort och uppskjutet till en framtida version (löst med serverloggning och/eller Provenance) — nu realiserat via en obligatorisk Provenance-post per registrering, se REQ-TRC-1/2."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"

* statement[+].key = "REQ-MDL-6"
* statement[=].label = "API-instansens egen giltighetsperiod"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "En API-instans (TKAPIInstance) BÖR kunna ange sin egen giltighetsperiod (giltigFrom/giltigTom), oberoende av den tillgängliggörande ändpunktens `Endpoint.period`. Löser den begränsning som tidigare dokumenterades i mappings.html (\"API:ets egen giltigFrom/giltigTom bärs inte separat\") — basresursen CapabilityStatement saknar ett eget giltighetsperiod-element, löst med en extension."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period"

* statement[+].key = "REQ-MDL-7"
* statement[=].label = "API-instansens koppling till Ändpunkt och API-specifikation"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje TKAPIInstance SKA referera den ändpunkt som tillgängliggör den (\"tillgängliggör\", via extensionen tk-api-instance-endpoint) och SKA referera den/de API-specifikationer den följer (\"följer\", via `CapabilityStatement.instantiates`), sökbart via en egen sökparameter (`instantiates`, eftersom ingen standard-sökparameter finns för detta element)."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates"

* statement[+].key = "REQ-MDL-8"
* statement[=].label = "Flera versioner av samma API-specifikation"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Flera versioner av samma API-specifikation (samma `url`) FÅR finnas samtidigt i katalogen. `version` SKA anges, och kombinationen `url` + `version` SKA vara unik; admin-API:t avvisar dubbletter med `422 Unprocessable Entity`. Sökning på `url` returnerar alla versioner; sökparametrarna `version` och `date` (med `_sort=-date`) används för att välja version. API-instanser och ändpunkter BÖR referera specifikationen som `url|version`."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"

// --- REQ-TRC: spårbarhet och transaktionell registrering ---
//
// Inte del av det ursprungliga informationsunderlaget. Tillagt efter
// jämförelse med en annan implementation av samma problem, som kräver en
// Provenance-post per registrering i en transaction-Bundle — löser det som
// tidigare var REQ-MDL-5:s uppskjutna spårbarhetsfråga. Se TKProvenance.fsh.

* statement[+].key = "REQ-TRC-1"
* statement[=].label = "Provenance krävs vid registrering"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje transaction-Bundle som registrerar (skapar/uppdaterar) en Organization, Endpoint, CapabilityStatement (API-specifikation/API-instans) eller PractitionerRole (administratörsbehörighet, TKAdministratorRole) SKA innehålla minst en Provenance-post (profilerad som TKProvenance) som via `Provenance.target` pekar ut den/de registrerade resurserna."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"

* statement[+].key = "REQ-TRC-2"
* statement[=].label = "Registrering via transaction-Bundle"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Tjänstekatalogens administrativa API SKA stödja systeminteraktionen `transaction` (en Bundle av typen transaction), så att en registrerad resurs och dess Provenance-post skapas/uppdateras atomiskt tillsammans."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-TRC-3"
* statement[=].label = "Spårbarhet för ändrade administratörsbehörigheter"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "När en administratörsbehörighet (TKAdministratorRole) skapas eller ändras BÖR `Provenance.agent.who` peka ut den ändrande administratörens egen TKAdministratorRole, så att det framgår både vem som gjorde ändringen och med vilken behörighet. Sökbart med `Provenance?target=PractitionerRole/[id]`."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

// --- REQ-EXP: exponering (sök-API externt via gateway, admin-API internt) ---
//
// Stakeholder-beslut: "Sök-api exponeras externt via gw. Administrativa
// api:er endast internt." Se TKSearchAPI (SearchAPI.fsh), TKAdminAPI
// (AdminAPI.fsh) och security.html.

* statement[+].key = "REQ-EXP-1"
* statement[=].label = "Sök-API exponeras externt via gateway"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Läsande sökning (read/search-type på Organization/Endpoint) SKA exponeras externt, via en gateway, för sökande konsumenter."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"

* statement[+].key = "REQ-EXP-2"
* statement[=].label = "Administrativa API:er endast interna"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Skrivande interaktioner (create/update på Organization/Endpoint/PractitionerRole) SKA vara internt exponerade endast och SKA INTE nås via den externa gatewayen."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

// --- REQ-ADM: administratörsbehörighet ---
//
// Inte del av det ursprungliga informationsunderlaget. Stakeholder-beslut:
// "Behörighet att administrera behöver hållas reda på, kanske via
// fhir-attribut, så som managingOrganization." Se TKAdministratorRole.fsh.

* statement[+].key = "REQ-ADM-1"
* statement[=].label = "Administratörsbehörighetens nivå"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Varje administratörsbehörighet SKA ange en administrationsnivå (local-admin eller central-admin)."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"

* statement[+].key = "REQ-ADM-2"
* statement[=].label = "Representerad organisation"
* statement[=].conformance[0] = #SHALL
* statement[=].conditionality = true
* statement[=].requirement = "En local-admin-behörighet SKA ange vilken organisation den representerar (`TKAdministratorRole.organization`), analogt med `Endpoint.managingOrganization`. En central-admin-behörighet representerar samtliga organisationer och utelämnar medvetet detta element."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"

* statement[+].key = "REQ-ADM-3"
* statement[=].label = "Behörighetens innehavare"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "En administratörsbehörighet BÖR ange vilket konto/system som innehar den."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"

// --- REQ-DIST: distribution/federering till lokala kataloger ---
//
// Inte del av det ursprungliga informationsunderlaget. Stakeholder-beslut:
// "Distribution/federering kan tänkas på, prenumeration via fhir-mekanismer
// för det är bra + grundladdning." Se OrganizationEndpointChanges.fsh och
// "Distribution och synkronisering" i rest-interactions.html.

* statement[+].key = "REQ-DIST-1"
* statement[=].label = "Prenumeration på förändringar (topic-baserad Subscription)"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Servern BÖR stödja R5 topic-baserad `Subscription` mot ämnet `tk-organization-endpoint-changes`, så att lokala kataloger kan prenumerera på skapande/uppdatering/borttagning av Organization/Endpoint, som ett alternativ till periodisk pollning."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes"

* statement[+].key = "REQ-DIST-2"
* statement[=].label = "Grundladdning via _lastUpdated"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Servern BÖR stödja grundladdning genom att sökningar på Organization, Endpoint och CapabilityStatement kan avgränsas med den generella sökparametern `_lastUpdated`, utan att en separat grundladdningsoperation behöver definieras. Parametern finns i sök-API:t, som notifieringarna (REQ-DIST-1) hänvisar klienterna till."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-DIST-3"
* statement[=].label = "Undvik rundgång — öppen fråga"
* statement[=].conformance[0] = #MAY
* statement[=].requirement = "I en dubbelriktad federerad miljö FÅR ett ursprungsmärke på Organization/Endpoint användas för att undvika att en lokal katalogs egna uppdateringar studsar tillbaka via prenumerationen. Inte löst i detta utkast — se öppen fråga i mappings.html."

* statement[+].key = "REQ-DIST-4"
* statement[=].label = "Återsynkronisering via _history"
* statement[=].conformance[0] = #SHOULD
* statement[=].requirement = "Servern BÖR stödja interaktionen `history-type` med parametern `_since` på Organization och Endpoint (t.ex. `GET [base]/Endpoint/_history?_since=[tidpunkt]`) för återsynkronisering. Till skillnad från sökning med `_lastUpdated` syns även borttagna poster. Bulkexport (`$export`) behövs inte, eftersom datamängderna väntas vara små."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"

* statement[+].key = "REQ-DIST-5"
* statement[=].label = "Ändrad koppling är en ändring av organisationen"
* statement[=].conformance[0] = #SHALL
* statement[=].requirement = "Kopplingen \"har\" lagras i `Organization.endpoint`. En ändring av den SKA hanteras som en uppdatering av Organization: ny version, nytt `meta.lastUpdated` och notifiering via prenumerationsämnet. En ändring av en Endpoint, inklusive `managingOrganization` (\"förvaltar\"), är en ändring av Endpoint och ändrar inte organisationen."
* statement[=].satisfiedBy[0] = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"
* statement[=].satisfiedBy[+] = "https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes"
