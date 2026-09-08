// Realises the "Vård- och omsorgstagare" entity from the attached logical
// model. The source model gives this entity a single attribute (id) and no
// further demographic detail — it functions as an opaque pointer within this
// model, not as a place where person data is meant to be carried.
//
// Deviation, documented: we do not introduce a dedicated FHIR resource
// profile for it. Implementers who need actual care-recipient demographics
// resolve the identifier against Inera's patient-facing services (e.g. a
// profile such as [IneraPatient](StructureDefinition-IneraPatient.html)),
// which are out of scope for this IG. This logical model exists purely so
// that Indexpost.avser has a typed target and so the attribute is traceable
// in the requirements catalogue (REQ-MDL-2). It is a documented,
// deliberately thin realisation, not an oversight.
//
// Scoping decision: like Indexpost, this entity is not exposed via REST in
// this draft of the administrative API for tjänstekatalogen — the API's
// remit here is technical service/endpoint metadata, not person identity.
// See requirements.html REQ-MDL-2.
Logical: TKVardOchOmsorgstagare
Parent: Base
Id: tk-vard-och-omsorgstagare
Title: "Vård- och omsorgstagare (logisk modell)"
Description: "Logisk modell för entiteten Vård- och omsorgstagare i informationsunderlaget. Tunn, avsiktligt begränsad till id — se REQ-MDL-2."

* ^status = #draft
* ^version = "0.1.0"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"
// Marks this logical model as a valid Reference() target (used by TKIndexpost.avser).
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics"
* ^extension[=].valueCode = #can-be-target

* id 1..1 id "Id" "Unik identifierare för vård- och omsorgstagaren i detta sammanhang."
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-MDL-2"
