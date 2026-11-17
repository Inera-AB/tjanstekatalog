// Felsvar med korrelations-id (REQ-ERR-1). Använder standardextensionen
// operationoutcome-instance-id (hl7.fhir.uv.extensions.r5 5.4.0) på varje
// issue, i stället för en egen extension på OperationOutcome. Extensionen är
// avsedd för just detta: ett id för förekomsten som kan knytas till en post i
// källsystemets logg. Värdet är anropets traceparent (W3C Trace Context), så
// att det id som syns i svaret är detsamma som i svarshuvudet och i loggarna.
Profile: TKOperationOutcome
Parent: OperationOutcome
Id: tk-operation-outcome
Title: "Tjänstekatalogen OperationOutcome"
Description: """
Felsvar från tjänstekatalogens API:er. Varje `issue` bär anropets
korrelations-id i standardextensionen
[operationoutcome-instance-id](http://hl7.org/fhir/extensions/StructureDefinition-operationoutcome-instance-id.html),
med anropets `traceparent` enligt [W3C Trace Context](https://www.w3.org/TR/trace-context/)
som värde. Se [Felhantering](error-handling.html) och REQ-ERR-1.
"""

* ^status = #draft
* ^version = "0.2.0"
* ^identifier.value = "TKOperationOutcome"
* ^date = "2026-11-17"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

* issue MS
* issue.severity MS
* issue.code MS
* issue.diagnostics MS
* issue.diagnostics ^short = "Läsbar beskrivning av felet"
* issue.extension contains http://hl7.org/fhir/StructureDefinition/operationoutcome-instance-id named correlationId 1..1 MS
* issue.extension[correlationId] ^short = "Korrelations-id: anropets traceparent (W3C Trace Context)"
* issue.extension[correlationId] ^definition = "Anropets korrelations-id, i form av anropets traceparent enligt W3C Trace Context (version-trace-id-parent-id-flaggor). Samma värde returneras i svarshuvudet traceparent och används för att hitta anropet i serverns loggar vid ett supportärende."
* issue.extension[correlationId] ^mapping.identity = "req"
* issue.extension[correlationId] ^mapping.map = "REQ-ERR-1"
* issue.extension[correlationId].valueString obeys tk-traceparent-format

Invariant: tk-traceparent-format
Description: "Värdet ska ha formatet för traceparent enligt W3C Trace Context: version, trace-id, parent-id och flaggor, med gemena hexadecimala tecken."
Expression: "matches('^[0-9a-f]{2}-[0-9a-f]{32}-[0-9a-f]{16}-[0-9a-f]{2}$')"
Severity: #error
