# Förväntade svar

| Interaktion | Statuskod vid lyckat anrop | Svarskropp |
|---|---|---|
| `read` (Organization, Endpoint) | `200 OK` | Resursen. |
| `search-type` (Organization, Endpoint, inkl. `listed-by`) | `200 OK` | `Bundle` av typen `searchset`, sidbrutet med `link.relation` `self`/`next`/`previous` enligt FHIR:s standardpaginering. Tom träfflista ger en `Bundle` med `total = 0`, inte ett fel. |
| `history-type` (Organization, Endpoint, med `_since`) | `200 OK` | `Bundle` av typen `history`, med en post per version sedan angiven tidpunkt, inklusive borttagningar (`request.method = DELETE`). Se REQ-DIST-4. |
| `create` | `201 Created` med `Location`-header till den nya resursen. | Resursen (eller inget, enligt serverns policy för `Prefer: return=`). |
| `update` | `200 OK` (eller `201 Created` vid "upsert" av ny resurs med klientangivet id). | Resursen. |

Klienter ska inte anta att sökresultat returneras i någon viss ordning om
inte `_sort` anges.

**Filtrering av status och giltighetsperiod.** Servern lägger inga
implicita filter på sökresultat, med ett undantag: sökning på `Endpoint`
utan parametern `status` utelämnar ändpunkter med status `entered-in-error`
(REQ-SRCH-7). Sådana ändpunkter returneras när klienten uttryckligen söker
`status=entered-in-error`, och alltid vid `read`, så att lokala kataloger
och Synkroniseringstjänsten kan upptäcka att en post de redan har hämtat har
felregistrerats. Övriga statusar (`active`, `suspended`, `error`, `off`)
returneras, liksom organisationer med `active = false`. `CapabilityStatement`
har ingen status `entered-in-error`.

Servern filtrerar inte på `Endpoint.period` eller på API-instansens
giltighetsperiod, och ändrar inte status när en period har löpt ut
(REQ-SRCH-8). Klienten avgör: en ändpunkt kan användas om `status = active`
och aktuell tidpunkt ligger inom `period`. Se [Felhantering](error-handling.html) för svar vid
misslyckade anrop.

Denna sida beskriver bara tjänstekatalogens egna interaktioner. Förväntade
svar för EHM:s `$add-organization`/`$remove-organization` (som alltid
returnerar en `OperationOutcome`, aldrig en uppdaterad resurs) beskrivs i
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html), eftersom de
är EHM:s API, inte detta.
