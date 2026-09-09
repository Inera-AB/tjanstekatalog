// CapabilityStatement for tjänstekatalogens administrative (server) API.
// Covers the resource-shaped parts of the attached logical model
// (Organisation, Ändpunkt): registration and search, including for the
// Synkroniseringstjänst actor (see roles-and-responsibilities.html), which
// reads Organization/Endpoint data here and then separately assumes the
// "Organization Endpoint Writer" role against E-hälsomyndighetens egna
// register — see "Mappning mot EHM:s Organization Endpoint Writer" in
// mappings.html. This admin API does NOT itself implement EHM's
// $add-organization/$remove-organization operations; those belong to EHM's
// API, not this one (see requirements.html REQ-WRT-*). Indexpost, Vård- och
// omsorgstagare, API and API-specifikation are modelled
// (see input/fsh/logicalmodels/) and traced in the requirements catalogue,
// but are not yet REST-exposed here — see REQ-MDL-1..4 and "Avvikelser och
// tillägg" in mappings.html.
//
// Exposure boundary (stakeholder decision, see REQ-EXP-1/2): this API,
// including its write interactions (create/update), is INTERNAL ONLY — it
// is not exposed via the external gateway. External search consumers use
// the separate, read-only TKSearchAPI (see SearchAPI.fsh) instead, which is
// gateway-exposed. See security.html.
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
* description = "Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)), samt registrering av administratörsbehörigheter. Läses av en Synkroniseringstjänst som separat, mot E-hälsomyndighetens (EHM) egna API, antar rollen \"Organization Endpoint Writer\" — se \"Mappning mot EHM:s Organization Endpoint Writer\" i mappings.html. Detta API är endast internt exponerat — se [TKSearchAPI](CapabilityStatement-tk-search-api.html) för det externt exponerade, läsande sök-API:et."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
// kind=requirements (not capability): this describes what an implementation
// of the admin API SHOULD support, not one specific running server instance,
// so neither .software nor .implementation applies (R5 constraint cpb-15/16).
* kind = #requirements
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

// --- PractitionerRole (administratörsbehörighet) ---
// Se TKAdministratorRole.fsh och REQ-ADM-*. Inte del av det ursprungliga
// informationsunderlaget — se mappings.html.
* rest[=].resource[+].type = #PractitionerRole
* rest[=].resource[=].profile = Canonical(TKAdministratorRole)
* rest[=].resource[=].documentation = "Administratörsbehörigheter: vilken organisation en administratör representerar (local-admin), eller att administratören är central-admin (organization utelämnad)."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[+].code = #create
* rest[=].resource[=].interaction[+].code = #update
* rest[=].resource[=].searchParam[0].name = "organization"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök administratörsbehörigheter efter representerad organisation."
* rest[=].resource[=].searchParam[+].name = "practitioner"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök administratörsbehörigheter efter innehavare."
