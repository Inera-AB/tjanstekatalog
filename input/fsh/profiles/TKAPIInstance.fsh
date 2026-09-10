// Realises the "API" join entity (Ändpunkt --tillgängliggör--> API
// --följer--> API-specifikation) from the attached logical model, as its
// OWN resource with its own identity and giltighetsperiod. This is a
// change from the earlier design, which realised "API" solely as
// Endpoint.payload + the TKEndpointPayloadProfile extension (documented in
// mappings.html as a deliberate simplification whose known cost was that
// "API" had no independent id and no independent giltigFrom/giltigTom —
// only Endpoint.period was available).
//
// Adopted after comparing against another team's implementation of the
// same problem, which uses CapabilityStatement (kind=instance) for a
// service's technical surface, linked via .instantiates to the
// specification it follows. This IG follows that pattern for TKAPIInstance,
// but keeps Endpoint.payload + TKEndpointPayloadProfile UNCHANGED
// alongside it (not replaced) — that extension remains the fast,
// single-hop search path for "which endpoints support specification X"
// (see the tk-endpoint-implements SearchParameter, REQ-SRCH-4), while
// TKAPIInstance is the place "API" gets a real, independently searchable
// and versionable identity. Keeping the two in sync (the specs named on
// Endpoint.payload's extension should match the TKAPIInstance(s) that
// endpoint offers) is a documented expectation, not mechanically enforced
// — see the open question in mappings.html.
//
// Per R5 constraint cpb-14, kind=instance requires .implementation present
// — enforced by the base resource, not repeated here.
Profile: TKAPIInstance
Parent: CapabilityStatement
Id: tk-api-instance
Title: "Tjänstekatalogen API-instans"
Description: """
Ett API som en teknisk ändpunkt tillgängliggör ("tillgängliggör"), och den
eller de interoperabilitetsspecifikationer det följer ("följer"), som en
egen resurs med egen identitet och egen giltighetsperiod — se
[Kravkatalog](requirements.html) REQ-MDL-3, REQ-MDL-6, REQ-MDL-7.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKAPIInstance"
* ^date = "2026-09-09"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

* kind = #instance
* kind ^short = "Alltid instance — detta är en körande API-instans, inte en abstrakt kravbild"

// Bas-FHIR:s cpb-1-invariant kräver minst ett av rest/messaging/document.
* rest 1..1 MS
* rest.mode = #server

// "följer" API-specifikation(er). En API-instans kan följa flera
// specifikationer, och en specifikation kan följas av flera instanser —
// samma many-to-many-relation som informationsunderlaget beskriver.
* instantiates 1..* MS
* instantiates ^short = "Den/de API-specifikationer denna instans följer (\"följer\")"
* instantiates ^mapping.identity = "req"
* instantiates ^mapping.map = "REQ-MDL-7"

* implementation 1..1 MS
* implementation ^mapping.identity = "req"
* implementation ^mapping.map = "REQ-MDL-7"
* implementation.description MS
* implementation.description ^short = "Fritextbeskrivning av denna API-instans"

// Samma värde som den tillgängliggörande ändpunktens Endpoint.address —
// se avstegsnoteringen i mappings.html om denna medvetna duplicering.
* implementation.url 1..1 MS
* implementation.url ^short = "Teknisk anropsadress (samma värde som TKEndpoint.address)"

* implementation.custodian MS
* implementation.custodian only Reference(TKOrganization)
* implementation.custodian ^short = "Ansvarig organisation för denna API-instans, om annan än ändpunktens förvaltande organisation"

// "tillgängliggörs av" — den ändpunkt som tillgängliggör detta API.
* extension contains TKAPIInstanceEndpoint named endpoint 1..1 MS
* extension[endpoint] ^mapping.identity = "req"
* extension[endpoint] ^mapping.map = "REQ-MDL-7"

// API.giltigFrom / giltigTom
* extension contains TKAPIInstancePeriod named period 0..1 MS
* extension[period] ^mapping.identity = "req"
* extension[period] ^mapping.map = "REQ-MDL-6"
