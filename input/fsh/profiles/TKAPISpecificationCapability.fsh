// Realises the "API-specifikation" entity from the attached logical model.
// Replaces the earlier logical-model-only realisation (TKAPISpecification,
// deferred REST exposure) — see version-history.html. Adopted after
// comparing against another team's implementation of the same problem,
// which uses CapabilityStatement (kind=requirements) for this entity
// rather than EHM's ActorDefinition-based choice (which this IG already
// rejected, see mappings.html) or this IG's own earlier ImplementationGuide
// recommendation. CapabilityStatement.kind=requirements is native FHIR
// machinery for "a formal statement of what an implementation must
// support" — arguably a better fit for "interoperabilitetsspecifikation"
// than ImplementationGuide, and consistent with this IG's own use of
// kind=requirements for TKAdminAPI/TKSearchAPI. Per R5 constraint cpb-16,
// kind=requirements requires both .software and .implementation absent —
// enforced by the base resource, not repeated here.
Profile: TKAPISpecificationCapability
Parent: CapabilityStatement
Id: tk-api-specification-capability
Title: "Tjänstekatalogen API-specifikation"
Description: """
Metadata om en interoperabilitetsspecifikation (t.ex. en FHIR IG, ett
RIVTA-tjänstekontrakt eller en OpenAPI/REST-beskrivning) som en
[TKAPIInstance](StructureDefinition-tk-api-instance.html) kan referera via
`.instantiates` ("följer"). `CapabilityStatement.url` är specifikationens
egen kanoniska/maskinläsbara identitet — samma värde som
[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html)
på `Endpoint.payload` refererar för snabb sökbarhet. Se
[Kravkatalog](requirements.html) REQ-MDL-4.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKAPISpecificationCapability"
* ^date = "2026-09-09"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

* kind = #requirements
* kind ^short = "Alltid requirements — detta är en specifikations kravbild, inte en körande instans"

// Bas-FHIR:s cpb-1-invariant kräver minst ett av rest/messaging/document
// på VARJE CapabilityStatement, oavsett kind — även om specifikationen
// den beskriver inte alls är REST-baserad (t.ex. ett RIVTA SOAP-kontrakt).
// För en REST/FHIR-baserad specifikation fylls detta i på riktigt av
// specifikationens egen IG (denna profil dubblerar inte den informationen,
// se .documentation nedan); för en icke-REST-specifikation krävs ändå ett
// minimalt rest.mode-värde enbart för att uppfylla bas-invarianten — en
// känd modelleringsspänning i att återanvända CapabilityStatement för
// specifikationer som inte är FHIR REST, dokumenterad i mappings.html.
* rest 1..1 MS
* rest.mode = #server
* rest.documentation MS
* rest.documentation ^short = "Fritext, t.ex. hänvisning till specifikationens egen IG/dokumentation för fullständiga REST-förmågor"

// API-specifikation.kanoniskUrl
* url 1..1 MS
* url ^short = "Specifikationens kanoniska URL"
* url ^mapping.identity = "req"
* url ^mapping.map = "REQ-MDL-4, REQ-SRCH-3"

// API-specifikation.status
* status MS
* status ^mapping.identity = "req"
* status ^mapping.map = "REQ-MDL-4"

// API-specifikation.maskinläsbartNamn
* name MS
* name ^short = "Maskinläsbart namn"
* name ^mapping.identity = "req"
* name ^mapping.map = "REQ-MDL-4"

// API-specifikation.titel
* title 1..1 MS
* title ^short = "Människoläsbar titel"
* title ^mapping.identity = "req"
* title ^mapping.map = "REQ-MDL-4"

// API-specifikation.version
* version MS
* version ^mapping.identity = "req"
* version ^mapping.map = "REQ-MDL-4"

// API-specifikation.beskrivning
* description MS
* description ^short = "Fritextbeskrivning av specifikationen"
* description ^mapping.identity = "req"
* description ^mapping.map = "REQ-MDL-4"

// API-specifikation.utgivningsdatum
* date MS
* date ^short = "Datum då denna version av specifikationen gavs ut"
* date ^mapping.identity = "req"
* date ^mapping.map = "REQ-MDL-4"

// API-specifikation.kategori
* extension contains TKAPISpecificationCategory named category 0..1 MS
* extension[category] ^mapping.identity = "req"
* extension[category] ^mapping.map = "REQ-MDL-4"

// API-specifikation.referensTillKälla
* extension contains TKAPISpecificationSourceReference named sourceReference 0..1 MS
* extension[sourceReference] ^mapping.identity = "req"
* extension[sourceReference] ^mapping.map = "REQ-MDL-4"

// API-specifikation.ansvarigUtgivare
* extension contains TKCapabilityStatementResponsibleOrganization named responsibleOrganization 0..1 MS
* extension[responsibleOrganization] ^mapping.identity = "req"
* extension[responsibleOrganization] ^mapping.map = "REQ-MDL-4"
