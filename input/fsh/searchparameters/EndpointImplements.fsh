// Custom search parameter answering "which endpoints support interoperability
// specification X" — see requirements.html (REQ-SRCH-4). Added after
// comparing against another team's implementation of the same problem,
// which has an equivalent `implements` search parameter; this IG did not
// previously expose one, only the underlying extension (REQ-SRCH-3).
//
// Type is `reference`, not `uri`: the extension value is a canonical, and FHIR
// searches canonical elements with reference-type parameters. That gives the
// same matching rules as tk-capabilitystatement-instantiates (REQ-SRCH-6):
// a bare URL matches every version, `url|version` only that version. With
// `uri`, `url|version` would only be an exact string comparison.
//
// Unlike tk-endpoint-listed-by, this parameter has a valid `.expression` —
// it is a forward lookup within a single Endpoint instance (into its own
// payload.extension), not a reverse/cross-resource lookup, so ordinary
// FHIRPath and normal server-side SearchParameter indexing apply.
Instance: TKEndpointImplements
InstanceOf: SearchParameter
Usage: #definition
Title: "Endpoint: implements (stödd interoperabilitetsspecifikation)"
Description: "Söker fram de Endpoint-resurser vars nyttolast (Endpoint.payload) stödjer en angiven interoperabilitetsspecifikation, dvs. vars TKEndpointPayloadProfile-extension namner den angivna kanoniska URL:en. Se REQ-SRCH-4."

* id = "tk-endpoint-implements"
* url = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements"
* version = "0.1.0"
* name = "TKEndpointImplements"
* title = "Endpoint: implements"
* status = #draft
* experimental = true
* date = "2026-09-09"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Söker fram de Endpoint-resurser vars nyttolast (Endpoint.payload) stödjer en angiven interoperabilitetsspecifikation, dvs. vars TKEndpointPayloadProfile-extension (payload.extension) namner den angivna kanoniska URL:en. Kompletterar REQ-SRCH-3 (representation) med faktisk sökbarhet. Värdet anges som kanonisk URL, som matchar alla versioner (även referenser utan version), eller som `url|version`, som bara matchar den angivna versionen. Se REQ-SRCH-6."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* code = #implements
* base[0] = #Endpoint
* type = #reference
* expression = "Endpoint.payload.extension('https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile').value"
* processingMode = #normal
* target[0] = #CapabilityStatement
* multipleOr = true
* multipleAnd = false
