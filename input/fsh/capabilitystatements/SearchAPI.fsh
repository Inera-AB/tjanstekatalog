// CapabilityStatement for tjänstekatalogens externally-exposed search API —
// the subset of the administrative API's resources/interactions that is
// safe and intended for external consumers, exposed via a gateway. Added
// per stakeholder decision: "Sök-api exponeras externt via gw.
// Administrativa api:er endast internt." — i.e. the write interactions
// (create/update) on TKAdminAPI are deliberately NOT part of this
// CapabilityStatement and are not gateway-exposed; see AdminAPI.fsh and
// security.md for the exposure boundary. See REQ-EXP-1/2 in
// requirements.html.
Instance: TKSearchAPI
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Tjänstekatalogen: sök-API (externt)"
Description: "CapabilityStatement för tjänstekatalogens externt exponerade sök-API (serverroll), nått via gateway."

* id = "tk-search-api"
* url = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api"
* version = "0.1.0"
* name = "TKSearchAPICapabilityStatement"
* title = "Tjänstekatalogen: sök-API (externt)"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Beskriver de FHIR REST-förmågor som tjänstekatalogens sök-API exponerar externt, via gateway, för sökande konsumenter: läsning och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)). Detta CapabilityStatement innehåller medvetet inga skrivinteraktioner (`create`/`update`) — dessa finns endast i [administrativt API](CapabilityStatement-tk-admin-api.html), som inte är externt exponerat. Se säkerhet och behörighet i security.html."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
// kind=requirements: se motivering i AdminAPI.fsh (R5 cpb-15/16).
* kind = #requirements
* fhirVersion = #5.0.0
* format[0] = #json
* rest[0].mode = #server
* rest[=].documentation = "Externt exponerat sök-API för tjänstekatalogen, nått via gateway. Endast läsande interaktioner."

// --- Organization ---
* rest[=].resource[0].type = #Organization
* rest[=].resource[=].profile = Canonical(TKOrganization)
* rest[=].resource[=].documentation = "Organisationer registrerade i tjänstekatalogen."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[0].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök organisation på identifierare, t.ex. organisationsnummer (\"logisk adress\" — se mappings.html)."
* rest[=].resource[=].searchParam[+].name = "name"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Sök organisation på namn."

// --- Endpoint ---
* rest[=].resource[+].type = #Endpoint
* rest[=].resource[=].profile = Canonical(TKEndpoint)
* rest[=].resource[=].documentation = "Tekniska ändpunkter registrerade i tjänstekatalogen."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[0].name = "organization"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-organization"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter förvaltande organisation (Endpoint.managingOrganization, \"förvaltar\")."
* rest[=].resource[=].searchParam[+].name = "listed-by"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKEndpointListedBy)
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter organisation som listar dem (Organization.endpoint, \"har\"). Se SearchParameter-tk-endpoint-listed-by.html."
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter status."
* rest[=].resource[=].searchParam[+].name = "implements"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKEndpointImplements)
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter stödd interoperabilitetsspecifikation. Se SearchParameter-tk-endpoint-implements.html."

// --- CapabilityStatement (API-specifikation, API-instans) — läsning för upptäckt ---
* rest[=].resource[+].type = #CapabilityStatement
* rest[=].resource[=].supportedProfile[0] = Canonical(TKAPISpecificationCapability)
* rest[=].resource[=].supportedProfile[+] = Canonical(TKAPIInstance)
* rest[=].resource[=].documentation = "Interoperabilitetsspecifikationer (kind=requirements) och API-instanser (kind=instance) — för att upptäcka vilka specifikationer/API:er som finns."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[0].name = "url"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/CanonicalResource-url"
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Sök på kanonisk URL."
* rest[=].resource[=].searchParam[+].name = "kind"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKCapabilityStatementKind)
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Filtrera på requirements (API-specifikation) eller instance (API-instans)."
* rest[=].resource[=].searchParam[+].name = "instantiates"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKCapabilityStatementInstantiates)
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök API-instanser efter vilken specifikation de följer."
