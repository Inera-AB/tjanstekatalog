# Förväntade svar

| Interaktion | Statuskod vid lyckat anrop | Svarskropp |
|---|---|---|
| `read` (Organization, Endpoint) | `200 OK` | Resursen. |
| `search-type` (Organization, Endpoint, inkl. `listed-by`) | `200 OK` | `Bundle` av typen `searchset`, sidbrutet med `link.relation` `self`/`next`/`previous` enligt FHIR:s standardpaginering. Tom träfflista ger en `Bundle` med `total = 0`, inte ett fel. |
| `create` | `201 Created` med `Location`-header till den nya resursen. | Resursen (eller inget, enligt serverns policy för `Prefer: return=`). |
| `update` | `200 OK` (eller `201 Created` vid "upsert" av ny resurs med klientangivet id). | Resursen. |

Klienter ska inte anta att sökresultat returneras i någon viss ordning om
inte `_sort` anges. Se [Felhantering](error-handling.html) för svar vid
misslyckade anrop.

Denna sida beskriver bara tjänstekatalogens egna interaktioner. Förväntade
svar för EHM:s `$add-organization`/`$remove-organization` (som alltid
returnerar en `OperationOutcome`, aldrig en uppdaterad resurs) beskrivs i
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html), eftersom de
är EHM:s API, inte detta.
