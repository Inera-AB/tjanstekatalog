# Exempel: felsvar med korrelations-id - Tjänstekatalogen v0.2.0

## Exempel OperationOutcome: Exempel: felsvar med korrelations-id

Profil: [Tjänstekatalogen OperationOutcome](StructureDefinition-tk-operation-outcome.md)

### Issues

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Extension** | **Severity** | **Code** | **Diagnostics** |
| * |  | Error | Invalid Content | Ogiltig sökparameter: instantiates |



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "TKOperationOutcomeExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-operation-outcome"]
  },
  "issue" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/operationoutcome-instance-id",
      "valueString" : "00-dfa31425ee41c53febe657bf8cc5b9d0-03a1b50d69809d06-01"
    }],
    "severity" : "error",
    "code" : "invalid",
    "diagnostics" : "Ogiltig sökparameter: instantiates"
  }]
}

```
