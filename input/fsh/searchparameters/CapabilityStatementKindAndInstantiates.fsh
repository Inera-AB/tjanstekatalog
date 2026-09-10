// Custom search parameters on CapabilityStatement, needed to make
// TKAPISpecificationCapability (kind=requirements) and TKAPIInstance
// (kind=instance) practically searchable. No standard FHIR R5
// SearchParameter exists for CapabilityStatement.kind or
// CapabilityStatement.instantiates — see requirements.html REQ-MDL-4,
// REQ-MDL-7. (CapabilityStatement.url, .status etc. are already covered by
// the standard CanonicalResource-* search parameters and need no
// redefinition here.)

Instance: TKCapabilityStatementKind
InstanceOf: SearchParameter
Usage: #definition
Title: "CapabilityStatement: kind"
Description: "Söker CapabilityStatement-resurser efter kind (requirements = API-specifikation, instance = API-instans). Se REQ-MDL-4."

* id = "tk-capabilitystatement-kind"
* url = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-kind"
* version = "0.1.0"
* name = "TKCapabilityStatementKind"
* title = "CapabilityStatement: kind"
* status = #draft
* experimental = true
* date = "2026-09-09"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Söker CapabilityStatement-resurser efter kind. Används för att skilja API-specifikationer (kind=requirements, TKAPISpecificationCapability) från API-instanser (kind=instance, TKAPIInstance) vid sökning."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* code = #kind
* base[0] = #CapabilityStatement
* type = #token
* expression = "CapabilityStatement.kind"
* processingMode = #normal

Instance: TKCapabilityStatementInstantiates
InstanceOf: SearchParameter
Usage: #definition
Title: "CapabilityStatement: instantiates"
Description: "Söker fram de TKAPIInstance-resurser som följer en angiven API-specifikation (CapabilityStatement.instantiates). Se REQ-MDL-7."

* id = "tk-capabilitystatement-instantiates"
* url = "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates"
* version = "0.1.0"
* name = "TKCapabilityStatementInstantiates"
* title = "CapabilityStatement: instantiates"
* status = #draft
* experimental = true
* date = "2026-09-09"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Söker fram de TKAPIInstance-resurser (kind=instance) som följer (instantiates) en angiven TKAPISpecificationCapability, identifierad via dess kanoniska URL. Se REQ-MDL-7."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* code = #instantiates
* base[0] = #CapabilityStatement
* type = #reference
* expression = "CapabilityStatement.instantiates"
* processingMode = #normal
* target[0] = #CapabilityStatement
