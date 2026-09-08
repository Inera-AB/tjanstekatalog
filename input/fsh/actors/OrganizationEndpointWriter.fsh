// Actor mirroring E-hälsomyndighetens "Organization Endpoint Writer" pattern
// (Swedish Medical Record Index And Endpoint Registry), adapted to
// tjänstekatalogen: a system that supplies technical endpoint information —
// and, specifically, the "har" link between an organisation and its
// endpoints — to the catalogue. See roles-and-responsibilities.html and
// requirements.html REQ-WRT-1..3.
Instance: TKOrganizationEndpointWriter
InstanceOf: ActorDefinition
Usage: #definition
Title: "Organization Endpoint Writer"
Description: "Aktör: System som tillhandahåller information om organisationers tekniska ändpunkter till tjänstekatalogen."

* id = "tk-organization-endpoint-writer"
* url = "https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-organization-endpoint-writer"
* version = "0.1.0"
* name = "TKOrganizationEndpointWriter"
* title = "Organization Endpoint Writer"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "System som tillhandahåller information om organisationers tekniska ändpunkter till tjänstekatalogen, inklusive vilka ändpunkter en organisation listar (\"har\"). Realiseras tekniskt av [CapabilityStatement: Organization Endpoint Writer Capabilities](CapabilityStatement-tk-organization-endpoint-writer.html)."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* type = #system
* capabilities = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-organization-endpoint-writer"
