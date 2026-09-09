// CapabilityStatement for tjänstekatalogens administrative (server) API.
// Covers the resource-shaped parts of the attached logical model
// (Organisation, Ändpunkt): registration and search, including for the
// Synkroniseringstjänst actor (see roles-and-responsibilities.html), which
// reads Organization/Endpoint data here and then separately assumes the
// "Organization Endpoint Writer" role against E-hälsomyndighetens egna
// register — see "Mappning mot EHM:s Organization Endpoint Writer" in
// mappings.html. This admin API does NOT itself implement EHM's
// $add-organization/$remove-organization operations; those belong to EHM's
// API, not this one (see requirements.html REQ-WRT-*). Indexpost and Vård-
// och omsorgstagare are modelled as logical models (see
// input/fsh/logicalmodels/) and traced in the requirements catalogue, but
// are not yet REST-exposed here — see REQ-MDL-1/2 and "Avvikelser och
// tillägg" in mappings.html. API and API-specifikation, previously also
// deferred, are now REST-exposed as CapabilityStatement profiles
// (TKAPIInstance, TKAPISpecificationCapability) — see REQ-MDL-3/4/6/7.
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
* description = "Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer, tekniska ändpunkter, API-specifikationer och API-instanser (inklusive sökning av ändpunkter per organisation, se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)), samt registrering av administratörsbehörigheter. Registrering SKA ske via transaction-Bundle med en tillhörande Provenance-post (REQ-TRC-1/2). Läses av en Synkroniseringstjänst som separat, mot E-hälsomyndighetens (EHM) egna API, antar rollen \"Organization Endpoint Writer\" — se \"Mappning mot EHM:s Organization Endpoint Writer\" i mappings.html. Detta API är endast internt exponerat — se [TKSearchAPI](CapabilityStatement-tk-search-api.html) för det externt exponerade, läsande sök-API:et."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
// kind=requirements (not capability): this describes what an implementation
// of the admin API SHOULD support, not one specific running server instance,
// so neither .software nor .implementation applies (R5 constraint cpb-15/16).
* kind = #requirements
* fhirVersion = #5.0.0
* format[0] = #json
* rest[0].mode = #server
* rest[=].documentation = "Administrativt API för tjänstekatalogen."
// Registrering (skapande/uppdatering av Organization/Endpoint/
// CapabilityStatement) SKA ske via transaction-Bundle med en tillhörande
// Provenance-post — se REQ-TRC-1/2 och TKProvenance.fsh. De enskilda
// create/update-interaktionerna nedan kvarstår som del av respektive
// resurstyps förmågor (t.ex. för HAPI FHIR:s standardmekanismer), men
// klienter SKA använda transaction-vägen för faktisk registrering.
* rest[=].interaction[0].code = #transaction
* rest[=].interaction[=].documentation = "Registrering av en eller flera resurser (Organization, Endpoint, CapabilityStatement) tillsammans med en obligatorisk Provenance-post i samma transaction-Bundle. Se REQ-TRC-1/2."

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
* rest[=].resource[=].searchParam[+].name = "implements"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKEndpointImplements)
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter stödd interoperabilitetsspecifikation. Se SearchParameter-tk-endpoint-implements.html."

// --- CapabilityStatement (API-specifikation, API-instans) ---
// TKAPISpecificationCapability (kind=requirements) och TKAPIInstance
// (kind=instance) delar resurstyp — se REQ-MDL-4, REQ-MDL-7 och
// mappings.html.
* rest[=].resource[+].type = #CapabilityStatement
* rest[=].resource[=].supportedProfile[0] = Canonical(TKAPISpecificationCapability)
* rest[=].resource[=].supportedProfile[+] = Canonical(TKAPIInstance)
* rest[=].resource[=].documentation = "Interoperabilitetsspecifikationer (kind=requirements, TKAPISpecificationCapability) och API-instanser (kind=instance, TKAPIInstance, med instantiates och implementation.custodian)."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[+].code = #create
* rest[=].resource[=].interaction[+].code = #update
* rest[=].resource[=].searchParam[0].name = "url"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/CanonicalResource-url"
* rest[=].resource[=].searchParam[=].type = #uri
* rest[=].resource[=].searchParam[=].documentation = "Sök på kanonisk URL."
* rest[=].resource[=].searchParam[+].name = "kind"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKCapabilityStatementKind)
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Filtrera på requirements (API-specifikation) eller instance (API-instans). Se SearchParameter-tk-capabilitystatement-kind.html."
* rest[=].resource[=].searchParam[+].name = "instantiates"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKCapabilityStatementInstantiates)
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök API-instanser efter vilken specifikation de följer. Se SearchParameter-tk-capabilitystatement-instantiates.html."

// --- Provenance (spårbarhet vid registrering) ---
// Se TKProvenance.fsh och REQ-TRC-*. Inte del av det ursprungliga
// informationsunderlaget — se mappings.html.
* rest[=].resource[+].type = #Provenance
* rest[=].resource[=].profile = Canonical(TKProvenance)
* rest[=].resource[=].documentation = "Spårbarhetsposter för registreringar (skapande/uppdatering) av Organization, Endpoint, CapabilityStatement (API-specifikation/API-instans)."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[0].name = "target"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-target"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Den registrerade resursen, t.ex. Endpoint/{id}."

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
