# Felhantering - Tjänstekatalogen v0.1.0

## Felhantering

# Felhantering

Fel rapporteras som `OperationOutcome`, i enlighet med FHIR:s standardmönster för REST-fel.

| | | |
| :--- | :--- | :--- |
| Okänt/otillgängligt resurs-id (`read`, operationer) | `404 Not Found` | `not-found` |
| Ogiltig sökparameter eller kombination | `400 Bad Request` | `invalid` |
| `listed-by`/`organization`refererar en organisation som inte finns | `200 OK`med tom`Bundle`(sökning), eller`404 Not Found`om själva den refererade resursen efterfrågas direkt | — |
| `$add-organization-to-endpoint`/`$remove-organization-from-endpoint`med`organization`-parameter som saknas eller inte kan lösas upp | `400 Bad Request` | `invalid`eller`not-found` |
| Autentisering saknas eller är ogiltig | `401 Unauthorized` | `login` |
| Autentiserad men saknar behörighet | `403 Forbidden` | `forbidden` |
| Konflikt vid`update`(t.ex.`If-Match`/version stämmer inte) | `409 Conflict` | `conflict` |
| Serverfel | `500 Internal Server Error` | `exception` |

Se [Säkerhet och behörighet](security.md) för autentiserings- och behörighetsmodellen som styr `401`/`403`-fallen.

