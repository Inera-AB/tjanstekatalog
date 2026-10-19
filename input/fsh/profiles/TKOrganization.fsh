// Realises the "Organisation" entity from the attached logical model.
// See mappings.html and requirements.html for details.
Profile: TKOrganization
Parent: Organization
Id: tk-organization
Title: "Tjänstekatalogen Organization"
Description: """
Organisation i tjänstekatalogen. `Organization.endpoint` bär "har"-relationen
— de ändpunkter organisationen listar i sin katalogpost, oavsett vem som
förvaltar dem tekniskt. Sök efter dessa ändpunkter med
[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) på
Endpoint, med organisationens id/referens som värde. Den separata
"förvaltar"-relationen (vem som tekniskt driftar en given ändpunkt) uttrycks
istället av [TKEndpoint](StructureDefinition-tk-endpoint.html)s
`managingOrganization`, sökbar med standardparametern `organization`.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKOrganization"
* ^date = "2026-09-08"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

// Organisation.id
* id MS
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-ORG-1"

// Organisation.namn
* name 1..1 MS
* name ^short = "Organisationens namn"
* name ^mapping.identity = "req"
* name ^mapping.map = "REQ-ORG-1"

// Organisationsidentifierare. Stakeholder-beslut: `Organization.identifier`
// är den "logiska adress" som förstudien "Förstudie T2 Tjänstekatalog"
// beskriver som tjänstesökningens huvudsakliga söknyckel (slå upp logisk
// adress → teknisk anslutningsadress). Ingen separat `logiskAdress`-slice
// införs — sökning sker på dessa identifierare med standardparametern
// `identifier`. REQ-ORG-5.
//
// HSA-id är den primära identifieraren (1..1, unik i katalogen, REQ-ORG-6/7).
// Organisationsnummer är sekundärt och anges bara på den juridiska personen
// (REQ-ORG-2/8). De två följer OLIKA formatregler: organisationsnummer lagras
// som 10 siffror utan bindestreck, medan bindestrecket i ett HSA-id ingår i
// identifieraren och aldrig normaliseras bort. Organisationsnumret inuti ett
// HSA-id avser den direktanslutna producenten och får inte härledas till
// organisationens eget organisationsnummer.
//
// Slicingen är öppen så att fler identifierartyper kan läggas till utan att
// profilen bryts, men admin-API:t godtar i denna version bara systemen nedan
// (REQ-ORG-9).
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Organisationsidentifierare (\"logisk adress\"): HSA-id (primär) och organisationsnummer"
* identifier contains
    hsaId 1..1 MS and
    organisationsnummer 0..1 MS

// Organisation.hsaId — utökning utöver informationsunderlaget, se mappings.html.
// Systemet urn:oid:1.2.752.29.4.19 är HSA-id:s OID.
* identifier[hsaId].system 1..1
* identifier[hsaId].system = $hsaid
* identifier[hsaId].value 1..1 MS
* identifier[hsaId].value ^short = "HSA-id, t.ex. SE2321000016-1003"
* identifier[hsaId] obeys tk-org-hsaid-format
* identifier[hsaId] ^short = "HSA-id (primär identifierare och logisk adress)"
* identifier[hsaId] ^definition = "Organisationens HSA-id. Består av prefixet `SE`, organisationsnumret för den direktanslutna producenten i formatet tio siffror utan bindestreck, samt ett bindestreck och en efterföljande identifierande del. Organisationsnumret i HSA-id:t behöver inte vara organisationsnumret för den organisatoriska enhet som HSA-id:t identifierar. Värdet lagras, returneras och söks exakt som det är skrivet."
* identifier[hsaId] ^mapping.identity = "req"
* identifier[hsaId] ^mapping.map = "REQ-ORG-6, REQ-ORG-7"

// Organisation.organisationsnummer
// Systemet urn:oid:2.5.4.97 matchar vad E-hälsomyndighetens Organization
// Endpoint Writer-API kräver (bekräftat, se mappings.html). Formatet (10
// siffror utan bindestreck) är detsamma som EHM kräver, så värdet kan
// skickas vidare utan omskrivning (REQ-WRT-5).
* identifier[organisationsnummer].system 1..1
* identifier[organisationsnummer].system = $organisationsnummer
* identifier[organisationsnummer].value 1..1 MS
* identifier[organisationsnummer].value ^short = "Svenskt organisationsnummer, 10 siffror utan bindestreck (t.ex. 2321000016)"
* identifier[organisationsnummer] obeys tk-org-orgnr-format
* identifier[organisationsnummer] ^short = "Organisationsnummer (anges bara på den juridiska personen)"
* identifier[organisationsnummer] ^mapping.identity = "req"
* identifier[organisationsnummer] ^mapping.map = "REQ-ORG-2, REQ-ORG-8, REQ-WRT-5"

// Organisatorisk hierarki: underliggande enheter (med eget HSA-id) pekar på
// den juridiska personen (vårdgivaren), som bär organisationsnumret. Samma
// mönster som IHE mCSD. Sökbar med standardparametern `partof`.
* partOf MS
* partOf only Reference(TKOrganization)
* partOf ^short = "Överordnad organisation, t.ex. vårdgivaren för en vårdenhet"
* partOf ^mapping.identity = "req"
* partOf ^mapping.map = "REQ-ORG-8"

// "har": ändpunkter organisationen listar i katalogen.
* endpoint MS
* endpoint only Reference(TKEndpoint)
* endpoint ^short = "Ändpunkter organisationen listar i tjänstekatalogen (\"har\")"
* endpoint ^mapping.identity = "req"
* endpoint ^mapping.map = "REQ-ORG-3, REQ-SRCH-1"

Invariant: tk-org-hsaid-format
Description: "HSA-id består av SE, tio siffror (den direktanslutna producentens organisationsnummer utan bindestreck), ett bindestreck och en efterföljande identifierande del."
Expression: "value.matches('^SE[0-9]{10}-.+$')"
Severity: #error

Invariant: tk-org-orgnr-format
Description: "Organisationsnummer anges som tio siffror utan bindestreck."
Expression: "value.matches('^[0-9]{10}$')"
Severity: #error
