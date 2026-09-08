// Custom search parameter answering "which endpoints does organisation X list
// in its service catalogue entry" — see requirements.html (REQ-SRCH-1..3) and
// rest-interactions.html for query examples.
//
// Why not the standard `organization` search parameter on Endpoint?
// The base Endpoint-organization SearchParameter (Endpoint?organization=...)
// is defined as `Endpoint.managingOrganization` — the organisation that
// *manages/operates* the endpoint ("förvaltar" in the logical model). That is
// a different relationship from "har": the (0..*) list an Organization
// resource keeps in `Organization.endpoint`, naming every endpoint the
// organisation lists in the catalogue regardless of who manages it. Both
// relationships are real and both must be searchable, so this IG does not
// redefine the meaning of `organization` — it adds a second, explicitly
// named parameter for the "har" relationship instead.
//
// Why no `.expression`?
// SearchParameter.expression is FHIRPath evaluated against instances of the
// resource named in `.base` (here: Endpoint). There is no FHIRPath that lets
// an Endpoint instance "see" which Organization resources elsewhere in the
// store list it under `Organization.endpoint` — that is inherently a
// reverse/cross-resource lookup, which FHIRPath cannot express and which is
// exactly what FHIR's standard `_has` reverse-chaining mechanism exists for.
// Conformant servers MUST implement this parameter with search semantics
// equivalent to:
//
//   GET [base]/Endpoint?_has:Organization:endpoint:_id=[organization-id]
//
// i.e. "return every Endpoint referenced by Organization.endpoint on an
// Organization matching the given id/reference". `.expression` is
// intentionally left absent (permitted: SearchParameter.expression is 0..1)
// rather than populated with an expression that cannot faithfully describe
// server behaviour. This is documented as a deliberate design decision, not
// an oversight — see mappings.html, "Avvikelser och tillägg".
Instance: TKEndpointListedBy
InstanceOf: SearchParameter
Usage: #definition
Title: "Endpoint: listed-by (organisation som listar ändpunkten)"
Description: "Söker fram de Endpoint-resurser som en angiven Organization listar i sin ändpunktskatalog, dvs. de ändpunkter som förekommer i Organization.endpoint (\"har\"-relationen i informationsunderlaget) — till skillnad från standardparametern `organization`, som endast matchar den förvaltande organisationen (Endpoint.managingOrganization, \"förvaltar\"-relationen). Servrar SKA implementera denna parameter med sökbeteende likvärdigt med `_has:Organization:endpoint:_id=[organization-id]`."

* id = "tk-endpoint-listed-by"
* url = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by"
* version = "0.1.0"
* name = "TKEndpointListedBy"
* title = "Endpoint: listed-by"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Söker fram de Endpoint-resurser som en angiven Organization listar i sin ändpunktskatalog, dvs. de ändpunkter som förekommer i Organization.endpoint (\"har\"-relationen i informationsunderlaget) — till skillnad från standardparametern `organization`, som endast matchar den förvaltande organisationen (Endpoint.managingOrganization, \"förvaltar\"-relationen). Servrar SKA implementera denna parameter med sökbeteende likvärdigt med `_has:Organization:endpoint:_id=[organization-id]`."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* code = #listed-by
* base[0] = #Endpoint
* type = #reference
* target[0] = #Organization
* multipleOr = true
* multipleAnd = false
* chain[0] = "identifier"
