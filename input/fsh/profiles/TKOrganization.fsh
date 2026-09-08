// Realises the "Organisation" entity from the attached logical model.
// See mappings.html and requirements.html for details.
Profile: TKOrganization
Parent: Organization
Id: tk-organization
Title: "Tjänstekatalogen Organization"
Description: """
Organisation i tjänstekatalogen. `Organization.endpoint` bär "har"-relationen
— de ändpunkter organisationen listar i sin katalogpost, oavsett vem som
förvaltar dem tekniskt. Sök efter dessa ändpunkter med
[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) på
Endpoint, med organisationens id/referens som värde. Den separata
"förvaltar"-relationen (vem som tekniskt driftar en given ändpunkt) uttrycks
istället av [TKEndpoint](StructureDefinition-tk-endpoint.html)s
`managingOrganization`, sökbar med standardparametern `organization`.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKOrganization"
* ^date = "2026-09-08"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

// Organisation.id
* id MS
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-ORG-1"

// Organisation.namn
* name 1..1 MS
* name ^short = "Organisationens namn"
* name ^mapping.identity = "req"
* name ^mapping.map = "REQ-ORG-1"

// Organisation.organisationsnummer
// Se aliases.fsh: identifierarsystemet är en ANTAGEN OID i väntan på
// bekräftelse mot Ineras auktoritativa OID/URI-register (REQ-ORG-2).
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Organisationsidentifierare, inklusive organisationsnummer"
* identifier contains organisationsnummer 0..1 MS
* identifier[organisationsnummer].system 1..1
* identifier[organisationsnummer].system = $organisationsnummer
* identifier[organisationsnummer].value 1..1 MS
* identifier[organisationsnummer].value ^short = "Svenskt organisationsnummer"
* identifier[organisationsnummer] ^mapping.identity = "req"
* identifier[organisationsnummer] ^mapping.map = "REQ-ORG-2"

// "har": ändpunkter organisationen listar i katalogen.
* endpoint MS
* endpoint only Reference(TKEndpoint)
* endpoint ^short = "Ändpunkter organisationen listar i tjänstekatalogen (\"har\")"
* endpoint ^mapping.identity = "req"
* endpoint ^mapping.map = "REQ-ORG-3, REQ-SRCH-1"
