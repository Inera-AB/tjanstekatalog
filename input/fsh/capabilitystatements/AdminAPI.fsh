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
* rest[=].interaction[=].documentation = "Registrering av en eller flera resurser (Organization, Endpoint, CapabilityStatement, PractitionerRole) tillsammans med en obligatorisk Provenance-post i samma transaction-Bundle. Se REQ-TRC-1/2."

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
* rest[=].resource[=].searchParam[=].documentation = "Sök organisation på identifierare (\"logisk adress\"). HSA-id (`urn:oid:1.2.752.29.4.19`) matchas exakt, bindestrecket ingår i identifieraren. För organisationsnummer (`urn:oid:2.5.4.97`) godtas värdet med eller utan bindestreck. Se REQ-SRCH-5."
* rest[=].resource[=].searchParam[+].name = "name"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].documentation = "Sök organisation på namn. Modifierarna `:contains` och `:exact` stöds."
* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök organisation på logiskt id."
* rest[=].resource[=].searchParam[+].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Avgränsa organisationer på senaste ändringstidpunkt, t.ex. för grundladdning. Se REQ-DIST-2."
* rest[=].resource[=].searchParam[+].name = "active"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök aktiva eller inaktiva organisationer. Inaktiva organisationer filtreras inte bort som standard."
* rest[=].resource[=].searchParam[+].name = "partof"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-partof"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök underliggande enheter till en organisation, t.ex. vårdenheter under en vårdgivare. Se REQ-ORG-8."
* rest[=].resource[=].searchInclude[0] = "Organization:endpoint"
* rest[=].resource[=].interaction[+].code = #history-type
* rest[=].resource[=].interaction[=].documentation = "BÖR stödjas för återsynkronisering: `GET [base]/Organization/_history?_since=[tidpunkt]`. Till skillnad från sökning med `_lastUpdated` syns även borttagna poster. Se REQ-DIST-4."

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
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter status. Ändpunkter med status `entered-in-error` returneras bara när de efterfrågas uttryckligen (`status=entered-in-error`). Se REQ-SRCH-7."
* rest[=].resource[=].searchParam[+].name = "implements"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKEndpointImplements)
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkter efter stödd interoperabilitetsspecifikation, som kanonisk URL (alla versioner) eller `url|version` (endast den versionen). Se SearchParameter-tk-endpoint-implements.html och REQ-SRCH-6."
* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkt på logiskt id."
* rest[=].resource[=].searchParam[+].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Avgränsa ändpunkter på senaste ändringstidpunkt, t.ex. för grundladdning. Se REQ-DIST-2."
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök ändpunkt på identifierare, t.ex. EHM:s Endpoint-id."
* rest[=].resource[=].interaction[+].code = #history-type
* rest[=].resource[=].interaction[=].documentation = "BÖR stödjas för återsynkronisering: `GET [base]/Endpoint/_history?_since=[tidpunkt]`. Till skillnad från sökning med `_lastUpdated` syns även borttagna poster. Se REQ-DIST-4."

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
* rest[=].resource[=].searchParam[=].documentation = "Sök på kanonisk URL. Returnerar alla versioner av specifikationen, se REQ-MDL-8."
* rest[=].resource[=].searchParam[+].name = "kind"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKCapabilityStatementKind)
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Filtrera på requirements (API-specifikation) eller instance (API-instans). Se SearchParameter-tk-capabilitystatement-kind.html."
* rest[=].resource[=].searchParam[+].name = "instantiates"
* rest[=].resource[=].searchParam[=].definition = Canonical(TKCapabilityStatementInstantiates)
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Sök API-instanser efter vilken specifikation de följer, som kanonisk URL (alla versioner) eller `url|version` (endast den versionen). Literala referenser (`CapabilityStatement/[id]`) stöds inte. Se SearchParameter-tk-capabilitystatement-instantiates.html och REQ-SRCH-6."
* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök på logiskt id."
* rest[=].resource[=].searchParam[+].name = "_lastUpdated"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Avgränsa API-specifikationer och API-instanser på senaste ändringstidpunkt, t.ex. för grundladdning. Se REQ-DIST-2."
* rest[=].resource[=].searchParam[+].name = "version"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/CanonicalResource-version"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].documentation = "Sök på version, t.ex. tillsammans med `url`. Se REQ-MDL-8."
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/CanonicalResource-date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].documentation = "Sök på utgivningsdatum. Används med `_sort=-date` för att få den senaste versionen först. Se REQ-MDL-8."

// --- Provenance (spårbarhet vid registrering) ---
// Se TKProvenance.fsh och REQ-TRC-*. Inte del av det ursprungliga
// informationsunderlaget — se mappings.html.
* rest[=].resource[+].type = #Provenance
* rest[=].resource[=].profile = Canonical(TKProvenance)
* rest[=].resource[=].documentation = "Spårbarhetsposter för registreringar (skapande/uppdatering) av Organization, Endpoint, CapabilityStatement (API-specifikation/API-instans) och PractitionerRole (administratörsbehörighet). Se REQ-TRC-1/3."
* rest[=].resource[=].interaction[0].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[0].name = "target"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-target"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].documentation = "Den registrerade resursen, t.ex. Endpoint/{id} eller PractitionerRole/{id} (vem som ändrat en administratörsbehörighet)."

// --- PractitionerRole (administratörsbehörighet) ---
// Se TKAdministratorRole.fsh och REQ-ADM-*. Inte del av det ursprungliga
// informationsunderlaget — se mappings.html.
* rest[=].resource[+].type = #PractitionerRole
* rest[=].resource[=].profile = Canonical(TKAdministratorRole)
* rest[=].resource[=].documentation = "Administratörsbehörigheter: vilken organisation en administratör representerar (local-admin), eller att administratören är central-admin (organization utelämnad). Registreras, liksom övriga resurser, via transaction-Bundle med en Provenance-post (REQ-TRC-1/3)."
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
