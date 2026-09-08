// CapabilityStatement for tjänstekatalogens administrative (server) API.
// Covers the resource-shaped parts of the attached logical model
// (Organisation, Ändpunkt) plus the ability to receive calls from an
// Organization Endpoint Writer client (see roles-and-responsibilities.html,
// requirements.html). Indexpost, Vård- och omsorgstagare, API and
// API-specifikation are modelled (see input/fsh/logicalmodels/) and traced
// in the requirements catalogue, but are not yet REST-exposed here — see
// REQ-MDL-1..4 and "Avvikelser och tillägg" in mappings.html.
Instance: TKAdminAPI
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Tjänstekatalogen: administrativt API"
Description: "CapabilityStatement för tjänstekatalogens administrativa API (serverroll)."

* id = "tk-admin-api"
* url = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"
* version = "0.1.0"
* name = "TKAdminAPICapabilityStatement"
* title = "Tjänstekatalogen: administrativt API"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)) och mottagning av anrop från en [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html)."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* kind = #capability
* fhirVersion = #5.0.0
* format[0] = #json
* rest[0].mode = #server
* rest[=].documentation = "Administrativt API för tjänstekatalogen."

// --- Organization ---
* rest[=].resource[0].type = #Organization
* rest[=].resource[=].profile = Canonical(TKOrganization)
* rest[=].resource[=].documentation = "Organisationer registrerade i tjänstekatalogen."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[+].code = #create
* rest[=].resource[=].interaction[+].code = #update
* rest[=].resource[=].searchParam[0].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök organisation på identifierare, t.ex. organisationsnummer."
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
* rest[=].resource[=].interaction[+].code = #create
* rest[=].resource[=].interaction[+].code = #update
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
* rest[=].resource[=].operation[0].name = "add-organization-to-endpoint"
* rest[=].resource[=].operation[=].definition = Canonical(TKEndpointAddOrganization)
* rest[=].resource[=].operation[=].extension[+].url = $capabilitystatement-expectation
* rest[=].resource[=].operation[=].extension[=].valueCode = #MAY
* rest[=].resource[=].operation[+].name = "remove-organization-from-endpoint"
* rest[=].resource[=].operation[=].definition = Canonical(TKEndpointRemoveOrganization)
* rest[=].resource[=].operation[=].extension[+].url = $capabilitystatement-expectation
* rest[=].resource[=].operation[=].extension[=].valueCode = #MAY
