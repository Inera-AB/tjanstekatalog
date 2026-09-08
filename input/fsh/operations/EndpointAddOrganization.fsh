// $add-organization-to-endpoint — lets an Organization Endpoint Writer
// declare "this endpoint belongs to organisation X" (i.e. add a reference to
// this Endpoint into Organization.endpoint, the "har" relationship) without
// requiring write access to the full Organization resource. Mirrors the
// "Add Organization To Endpoint" operation on the Organization Endpoint
// Writer actor referenced by the user (MAY conformance). See
// requirements.html REQ-WRT-1 and roles-and-responsibilities.html.
Instance: TKEndpointAddOrganization
InstanceOf: OperationDefinition
Usage: #definition
Title: "Add Organization To Endpoint"
Description: "Lägger till en referens till denna Endpoint i den angivna organisationens Organization.endpoint-lista (\"har\"-relationen). Ändrar inte Endpoint.managingOrganization (\"förvaltar\")."

* id = "tk-endpoint-add-organization-to-endpoint"
* url = "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-add-organization-to-endpoint"
* version = "0.1.0"
* name = "TKEndpointAddOrganizationToEndpoint"
* title = "Add Organization To Endpoint"
* status = #draft
* kind = #operation
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Lägger till en referens till denna Endpoint i den angivna organisationens `Organization.endpoint`-lista (\"har\"-relationen i informationsunderlaget). Ändrar inte `Endpoint.managingOrganization` (\"förvaltar\"). Stöds av aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html), konformansnivå MAY."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* code = #add-organization-to-endpoint
* comment = "Konformansnivå MAY, se CapabilityStatement-tk-organization-endpoint-writer.html."
* resource = #Endpoint
* system = false
* type = true
* instance = true

* parameter[0].name = #organization
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Referens till den organisation som ska lista denna ändpunkt via Organization.endpoint."
* parameter[=].type = #Reference
* parameter[=].targetProfile = Canonical(TKOrganization)

* parameter[1].name = #organization
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Den uppdaterade Organization-resursen, med den angivna Endpoint tillagd i Organization.endpoint. Servrar som svarar utan resurskropp (t.ex. 200 utan body, eller 204) behöver inte populera denna out-parameter; se expected-responses.html."
* parameter[=].type = #Organization
* parameter[=].targetProfile = Canonical(TKOrganization)
