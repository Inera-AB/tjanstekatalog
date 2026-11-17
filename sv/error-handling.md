# Felhantering - Tjänstekatalogen v0.2.0

## Felhantering

Fel rapporteras som `OperationOutcome`, i enlighet med FHIR:s standardmönster för REST-fel.

### Korrelations-id

Varje felsvar SKA bära anropets korrelations-id, så att den som gör ett supportärende kan ange ett id som går att hitta i serverns loggar (REQ-ERR-1):

* **I svarshuvudet.** Servern returnerar anropets `traceparent` enligt [W3C Trace Context](https://www.w3.org/TR/trace-context/) i svarshuvudet `traceparent`.
* **I svarskroppen.** Varje `issue` i `OperationOutcome` bär samma värde i standardextensionen [`operationoutcome-instance-id`](http://hl7.org/fhir/extensions/StructureDefinition-operationoutcome-instance-id.html) (`valueString`). Svaret följer profilen [TKOperationOutcome](StructureDefinition-tk-operation-outcome.md).

Ett id i svarskroppen syns där användare och klientloggar faktiskt tittar, även när svarshuvuden inte loggas eller visas. Standardextensionen används i stället för en egen extension, eftersom den är avsedd för just detta: ett id för den enskilda förekomsten av felet som kan knytas till en post i källsystemets logg. Den sitter på `issue`, inte på `OperationOutcome`, så ett svar med flera `issue` har samma värde i varje.

```
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/operationoutcome-instance-id",
          "valueString": "00-dfa31425ee41c53febe657bf8cc5b9d0-03a1b50d69809d06-01"
        }
      ],
      "severity": "error",
      "code": "invalid",
      "diagnostics": "Ogiltig sökparameter: instantiates"
    }
  ]
}

```

Se även [exemplet](OperationOutcome-TKOperationOutcomeExample.md).

### Statuskoder

| | | |
| :--- | :--- | :--- |
| Okänt/otillgängligt resurs-id (`read`, operationer) | `404 Not Found` | `not-found` |
| Ogiltig sökparameter eller kombination | `400 Bad Request` | `invalid` |
| `listed-by`/`organization`refererar en organisation som inte finns | `200 OK`med tom`Bundle`(sökning), eller`404 Not Found`om själva den refererade resursen efterfrågas direkt | — |
| Organisationsnummer som inte är tio siffror, HSA-id i fel format, eller okänt identifierarsystem på`Organization`(`create`/`update`/`transaction`) | `422 Unprocessable Entity` | `invariant`respektive`business-rule` |
| Referens till API-specifikation utan version i`CapabilityStatement.instantiates`eller i`Endpoint.payload`-extensionen (REQ-MDL-9) | `422 Unprocessable Entity` | `invariant` |
| Registreringen skulle ge en dubblett: samma HSA-id eller organisationsnummer på två organisationer, eller samma`url`+`version`på två API-specifikationer | `422 Unprocessable Entity` | `business-rule` |
| Autentisering saknas eller är ogiltig | `401 Unauthorized` | `login` |
| Autentiserad men saknar behörighet | `403 Forbidden` | `forbidden` |
| Konflikt vid`update`(t.ex.`If-Match`/version stämmer inte) | `409 Conflict` | `conflict` |
| Serverfel | `500 Internal Server Error` | `exception` |

Se [Säkerhet och behörighet](security.md) för autentiserings- och behörighetsmodellen som styr `401`/`403`-fallen.

Tabellen ovan gäller tjänstekatalogens egna interaktioner. EHM:s `$add-organization`/`$remove-organization` har en egen felkodskatalog (returnerad som `OperationOutcome`, inte HTTP-statuskod ensam) — se [Mappning mot EHM:s Organization Endpoint Writer](mappings.md).

