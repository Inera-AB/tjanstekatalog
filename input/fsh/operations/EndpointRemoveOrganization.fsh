// $remove-organization-from-endpoint — the inverse of
// $add-organization-to-endpoint. Removes the reference to this Endpoint from
// the given organisation's Organization.endpoint list ("har"). Mirrors
// "Remove Organization From Endpoint" on the Organization Endpoint Writer
// actor referenced by the user (MAY conformance). See requirements.html
// REQ-WRT-2.
Instance: TKEndpointRemoveOrganization
InstanceOf: OperationDefinition
Usage: #definition
Title: "Remove Organization From Endpoint"
Description: "Tar bort referensen till denna Endpoint från den angivna organisationens Organization.endpoint-lista (\"har\"-relationen). Ändrar inte Endpoint.managingOrganization (\"förvaltar\")."

* id = "tk-endpoint-remove-organization-from-endpoint"
* url = "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-remove-organization-from-endpoint"
* version = "0.1.0"
* name = "TKEndpointRemoveOrganizationFromEndpoint"
* title = "Remove Organization From Endpoint"
* status = #draft
* kind = #operation
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Tar bort referensen till denna Endpoint från den angivna organisationens `Organization.endpoint`-lista (\"har\"-relationen i informationsunderlaget). Ändrar inte `Endpoint.managingOrganization` (\"förvaltar\"). Stöds av aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html), konformansnivå MAY."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* code = #remove-organization-from-endpoint
* comment = "Konformansnivå MAY, se CapabilityStatement-tk-organization-endpoint-writer.html. Att ta bort en organisation som inte finns i listan SKA vara idempotent (dvs. inte ge fel)."
* resource = #Endpoint
* system = false
* type = true
* instance = true

* parameter[0].name = #organization
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Referens till den organisation som inte längre ska lista denna ändpunkt via Organization.endpoint."
* parameter[=].type = #Reference
* parameter[=].targetProfile = Canonical(TKOrganization)

* parameter[1].name = #organization
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Den uppdaterade Organization-resursen, utan den angivna Endpoint i Organization.endpoint. Servrar som svarar utan resurskropp (t.ex. 200 utan body, eller 204) behöver inte populera denna out-parameter; se expected-responses.html."
* parameter[=].type = #Organization
* parameter[=].targetProfile = Canonical(TKOrganization)
