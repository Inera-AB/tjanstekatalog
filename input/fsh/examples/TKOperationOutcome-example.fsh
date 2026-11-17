Instance: TKOperationOutcomeExample
InstanceOf: TKOperationOutcome
Usage: #example
Title: "Exempel: felsvar med korrelations-id"
Description: "Felsvar på en sökning med en sökparameter som inte stöds. Korrelations-id:t anges i `issue` med standardextensionen operationoutcome-instance-id (REQ-ERR-1)."

* issue[0].severity = #error
* issue[=].code = #invalid
* issue[=].diagnostics = "Ogiltig sökparameter: instantiates"
* issue[=].extension[correlationId].valueString = "00-dfa31425ee41c53febe657bf8cc5b9d0-03a1b50d69809d06-01"
