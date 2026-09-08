// Realises the "Indexpost" entity from the attached logical model.
//
// Scoping decision (documented, see requirements.html REQ-MDL-1 and
// mappings.html): Indexpost is modelled here as a logical model for
// traceability, but is NOT exposed via REST in this draft of the
// administrative API. An index entry is understood to be a server-derived
// side effect of registering/updating an Organisation or Vård- och
// omsorgstagare entry ("avser"), not data a client creates directly — so
// direct create/update is deliberately out of scope for now. Read/search
// support for Indexpost may be added in a future version; tracked as an
// open requirement rather than silently dropped.
Logical: TKIndexpost
Parent: Base
Id: tk-indexpost
Title: "Indexpost (logisk modell)"
Description: "Logisk modell för entiteten Indexpost i informationsunderlaget. Ej REST-exponerad i detta utkast av det administrativa API:et — se REQ-MDL-1."

* ^status = #draft
* ^version = "0.1.0"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

* id 1..1 id "Indexpostens id" "Unik identifierare för indexposten."
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-MDL-1"

* registreringstidpunkt 1..1 instant "Registreringstidpunkt" "Tidpunkt då indexposten registrerades."
* registreringstidpunkt ^mapping.identity = "req"
* registreringstidpunkt ^mapping.map = "REQ-MDL-1"

* avser 1..1 Reference(TKOrganization or TKVardOchOmsorgstagare) "Avser" "Vad indexposten avser: antingen en organisation eller en vård- och omsorgstagare."
* avser ^mapping.identity = "req"
* avser ^mapping.map = "REQ-MDL-1, REQ-MDL-2"
