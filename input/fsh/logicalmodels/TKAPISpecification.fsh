// Realises the "API-specifikation" entity from the attached logical model.
//
// Modelling decision: API-specifikation is kept as a logical model rather
// than forced into a FHIR-specific canonical resource (e.g. ImplementationGuide
// or StructureDefinition), because a specification referenced here is not
// necessarily a FHIR artefact — it may equally be a RIVTA-tjänstekontrakt, an
// OpenAPI/REST description, or a SOAP/WSDL contract. `kanoniskUrl` is the
// specification's own business identity (e.g. its IG canonical URL when it
// is a FHIR IG) and is the value that [TKEndpointPayloadProfile]
// (StructureDefinition-tk-endpoint-payload-profile.html) on Endpoint.payload
// is expected to reference — that is how "API följer API-specifikation" is
// realised in the FHIR data (see mappings.html and TKEndpoint.fsh).
//
// Scoping decision, documented: whether/how this entity is exposed via REST
// in the administrative API (e.g. as a profile on `Basic`, or as its own
// custom resource type) is deferred to a future version of this IG — see
// REQ-MDL-4. Only the logical model and its traceability to requirements are
// delivered in this draft.
Logical: TKAPISpecification
Parent: Base
Id: tk-api-specification
Title: "API-specifikation (logisk modell)"
Description: "Logisk modell för entiteten API-specifikation i informationsunderlaget. REST-exponering i det administrativa API:et är inte del av detta utkast — se REQ-MDL-4."

* ^status = #draft
* ^version = "0.1.0"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

* id 1..1 id "Id" "Unik identifierare för API-specifikationen i tjänstekatalogen."
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-MDL-4"

* kanoniskUrl 1..1 uri "Kanonisk URL" "Specifikationens egen kanoniska/maskinläsbara identitet, t.ex. en FHIR IG:s canonical URL. Detta är värdet som Endpoint.payload-extensionen tk-endpoint-payload-profile förväntas referera."
* kanoniskUrl ^mapping.identity = "req"
* kanoniskUrl ^mapping.map = "REQ-MDL-4, REQ-SRCH-3"

* status 1..1 code "Status" "Specifikationens publiceringsstatus."
* status ^mapping.identity = "req"
* status ^mapping.map = "REQ-MDL-4"

* maskinlasbartNamn 0..1 string "Maskinläsbart namn" "Kort, maskinläsbart namn på specifikationen. FSH-elementnamnet använder ASCII (maskinlasbartNamn) enligt rekommendationen för enkla alfanumeriska elementnamn; det affärsmässiga namnet i informationsunderlaget är \"maskinläsbartNamn\"."
* maskinlasbartNamn ^mapping.identity = "req"
* maskinlasbartNamn ^mapping.map = "REQ-MDL-4"

* version 0..1 string "Version" "Specifikationens versionsbeteckning."
* version ^mapping.identity = "req"
* version ^mapping.map = "REQ-MDL-4"

* referensTillKalla 0..1 url "Referens till källa" "Länk till specifikationens källa/publiceringsplats (t.ex. dokumentation eller repository), skild från den kanoniska maskinidentiteten. FSH-elementnamnet använder ASCII (referensTillKalla); det affärsmässiga namnet i informationsunderlaget är \"referensTillKälla\"."
* referensTillKalla ^mapping.identity = "req"
* referensTillKalla ^mapping.map = "REQ-MDL-4"

* kategori 0..1 CodeableConcept "Kategori" "Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt."
* kategori ^mapping.identity = "req"
* kategori ^mapping.map = "REQ-MDL-4"

* titel 1..1 string "Titel" "Specifikationens människoläsbara titel."
* titel ^mapping.identity = "req"
* titel ^mapping.map = "REQ-MDL-4"

* beskrivning 0..1 markdown "Beskrivning" "Fritextbeskrivning av specifikationen."
* beskrivning ^mapping.identity = "req"
* beskrivning ^mapping.map = "REQ-MDL-4"

* ansvarigUtgivare 0..1 Reference(TKOrganization) "Ansvarig utgivare" "Organisationen som ansvarar för och publicerar specifikationen."
* ansvarigUtgivare ^mapping.identity = "req"
* ansvarigUtgivare ^mapping.map = "REQ-MDL-4"

* utgivningsdatum 0..1 date "Utgivningsdatum" "Datum då denna version av specifikationen gavs ut."
* utgivningsdatum ^mapping.identity = "req"
* utgivningsdatum ^mapping.map = "REQ-MDL-4"
