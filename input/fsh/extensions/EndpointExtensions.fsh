// Extensions realising Ändpunkt-attributes from the attached logical model
// that have no direct home on the base R5 Endpoint resource. See mappings.html
// for the full element-by-element mapping and requirements.html for the
// requirements each extension satisfies.

// --- Ändpunkt.protokoll / interop-specs "tillgängliggör API ... följer API-specifikation" ---
//
// R5 Endpoint.payload has no `.profile` element to name the interoperability
// specification(s) a payload conforms to; that element is only being added in
// a future FHIR version (tracked upstream as Endpoint.payload.profile). This
// extension is our interim equivalent: a repeating canonical reference on
// Endpoint.payload naming each interoperability specification (e.g. a FHIR IG
// or profile) the payload/API supports. When servers upgrade to a FHIR
// version where Endpoint.payload.profile exists natively, this extension
// SHOULD be retired in favour of that element.
//
// Modelling decision: the logical model's "API" entity (Ändpunkt --
// tillgängliggör --> API -- följer --> API-specifikation) is realised as
// Endpoint.payload + this extension, rather than as a standalone resource.
// See "Avvikelser och tillägg" in mappings.html for the rationale, including
// why the per-API giltigFrom/giltigTom on "API" is *not* separately carried
// (Endpoint.period is used as the endpoint's single validity window instead).
Extension: TKEndpointPayloadProfile
Id: tk-endpoint-payload-profile
Title: "Stödd specifikation (payload profile)"
Description: "Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner."
Context: Endpoint.payload
* value[x] only canonical
* valueCanonical 1..1
* valueCanonical ^short = "Kanonisk URL till den stödda interoperabilitetsspecifikationen"

// --- Ändpunkt.säkerhetsmetod ---
Extension: TKEndpointSecurityMethod
Id: tk-endpoint-security-method
Title: "Säkerhetsmetod"
Description: "Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5."
Context: Endpoint
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from TKEndpointSecurityMethodVS (example)

// --- Ändpunkt.urlTillAuktorisationsserver ---
Extension: TKEndpointAuthorizationServerUrl
Id: tk-endpoint-authorization-server-url
Title: "URL till auktorisationsserver"
Description: "URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod."
Context: Endpoint
* value[x] only url
* valueUrl 1..1
