// CapabilityStatement describing the FHIR REST capabilities the Organization
// Endpoint Writer actor MUST support when calling tjänstekatalogens
// administrativa API. Mirrors, in structure, E-hälsomyndighetens
// "Organization Endpoint Writer Capabilities" CapabilityStatement (Mode:
// Client; MAY-level operations on Endpoint) — adapted to tjänstekatalogens
// own operations. See ActorDefinition-tk-organization-endpoint-writer.html
// and requirements.html REQ-WRT-1..3.
Instance: TKOrganizationEndpointWriterCapabilities
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Organization Endpoint Writer Capabilities"
Description: "Detta CapabilityStatement beskriver de FHIR REST-förmågor som aktören Organization Endpoint Writer ska stödja."

* id = "tk-organization-endpoint-writer"
* url = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-organization-endpoint-writer"
* version = "0.1.0"
* name = "TKOrganizationEndpointWriterCapabilities"
* title = "Organization Endpoint Writer Capabilities"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Detta CapabilityStatement beskriver de FHIR REST-förmågor som aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html) ska stödja."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
// kind=requirements (not capability): this describes what a conformant
// Organization Endpoint Writer client SHOULD support, not one specific
// product, so neither .software nor .implementation applies (R5 cpb-15/16).
* kind = #requirements
* fhirVersion = #5.0.0
* format[0] = #json
* rest[0].mode = #client
* rest[=].documentation = "System som tillhandahåller information om tekniska ändpunkter till tjänstekatalogen."

* rest[=].resource[0].type = #Endpoint
* rest[=].resource[=].documentation = "MAY-stödda operationer för att koppla/koppla loss en organisation från en ändpunkt."
* rest[=].resource[=].operation[0].name = "add-organization-to-endpoint"
* rest[=].resource[=].operation[=].definition = Canonical(TKEndpointAddOrganization)
* rest[=].resource[=].operation[=].extension[+].url = $capabilitystatement-expectation
* rest[=].resource[=].operation[=].extension[=].valueCode = #MAY
* rest[=].resource[=].operation[+].name = "remove-organization-from-endpoint"
* rest[=].resource[=].operation[=].definition = Canonical(TKEndpointRemoveOrganization)
* rest[=].resource[=].operation[=].extension[+].url = $capabilitystatement-expectation
* rest[=].resource[=].operation[=].extension[=].valueCode = #MAY
