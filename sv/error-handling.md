# Felhantering - Tjänstekatalogen v0.1.0

## Felhantering

# Felhantering

Fel rapporteras som `OperationOutcome`, i enlighet med FHIR:s standardmönster för REST-fel.

| | | |
| :--- | :--- | :--- |
| Okänt/otillgängligt resurs-id (`read`, operationer) | `404 Not Found` | `not-found` |
| Ogiltig sökparameter eller kombination | `400 Bad Request` | `invalid` |
| `listed-by`/`organization`refererar en organisation som inte finns | `200 OK`med tom`Bundle`(sökning), eller`404 Not Found`om själva den refererade resursen efterfrågas direkt | — |
| Organisationsnummer som inte är tio siffror, HSA-id i fel format, eller okänt identifierarsystem på`Organization`(`create`/`update`/`transaction`) | `422 Unprocessable Entity` | `invariant`respektive`business-rule` |
| Registreringen skulle ge en dubblett: samma HSA-id eller organisationsnummer på två organisationer, eller samma`url`+`version`på två API-specifikationer | `422 Unprocessable Entity` | `business-rule` |
| Autentisering saknas eller är ogiltig | `401 Unauthorized` | `login` |
| Autentiserad men saknar behörighet | `403 Forbidden` | `forbidden` |
| Konflikt vid`update`(t.ex.`If-Match`/version stämmer inte) | `409 Conflict` | `conflict` |
| Serverfel | `500 Internal Server Error` | `exception` |

Se [Säkerhet och behörighet](security.md) för autentiserings- och behörighetsmodellen som styr `401`/`403`-fallen.

Tabellen ovan gäller tjänstekatalogens egna interaktioner. EHM:s `$add-organization`/`$remove-organization` har en egen felkodskatalog (returnerad som `OperationOutcome`, inte HTTP-statuskod ensam) — se [Mappning mot EHM:s Organization Endpoint Writer](mappings.md).

