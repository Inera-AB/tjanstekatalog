# Säkerhet och behörighet - Tjänstekatalogen v0.2.0

## Säkerhet och behörighet

Ineras generella säkerhetskrav för anslutning till FHIR-gränssnitt gäller för denna IG — se [FHIR på Inera](https://fhir.inera.se/) för den auktoritativa, förvaltade beskrivningen av autentiseringsmetod, behörighetsmodell och nätverkskrav.

Utöver de generella kraven gäller specifikt för denna IG:

* **Exponeringsgräns (REQ-EXP-1/2, stakeholder-beslut).** Endast [TKSearchAPI](CapabilityStatement-tk-search-api.md) — läsande sökning (`read`, `search-type`, inklusive `listed-by`) — exponeras externt, via gateway, för sökande konsumenter. [TKAdminAPI](CapabilityStatement-tk-admin-api.md), inklusive skrivinteraktionerna (`create`, `update`) på `Organization`/`Endpoint`/`CapabilityStatement`, är endast internt exponerat och SKA inte nås via den externa gatewayen. Se [CapabilityStatement](capabilitystatement.md).
* Skrivrättigheter i tjänstekatalogens administrativa API begränsas till system som är behöriga att registrera information om den aktuella organisationen. Detta omfattar även registrering via systeminteraktionen `transaction` (REQ-TRC-2) — en transaction-Bundle är inte ett sätt att kringgå den vanliga skrivbehörighetskontrollen, samma regler gäller för varje post i Bundlen som för motsvarande fristående `create`/`update`.
* **Skrivbehörighet från Inera IdP (REQ-ADM-5).** Användaren loggar in via Inera IdP. Admin-API:t avgör skrivbehörigheten från de claims IdP:n utfärdar: användarens HSA-id och HSA-id för den organisation användaren företräder. En skrivning får bara avse poster för den organisationen. Behörigheter registreras inte som resurser i katalogen, och IG:n definierar ingen egen behörighetsmodell. På sikt kopplas behörigheten till medarbetaruppdrag, så att ingen lokal behörighetsdatabas behövs. Användarens HSA-id och organisationen anges i registreringens Provenance-post (REQ-TRC-3).
* Synkroniseringstjänstens (utkast) behörighet mot **EHM:s** `$add-organization`/ `$remove-organization` (rollen Organization Endpoint Writer) styrs av EHM, inte av denna IG — se EHM:s egen IG för deras säkerhetskrav.
* Sökning (`read`, `search-type`, inklusive `listed-by`) förutsätts vara tillgänglig för behöriga tjänstekonsumenter utan krav på samtycke, då informationen avser tekniska ändpunkter och organisationer, inte personuppgifter om enskilda.

