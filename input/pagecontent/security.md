# Säkerhet och behörighet

Ineras generella säkerhetskrav för anslutning till FHIR-gränssnitt gäller
för denna IG — se [FHIR på Inera](https://fhir.inera.se/) för den
auktoritativa, förvaltade beskrivningen av autentiseringsmetod,
behörighetsmodell och nätverkskrav.

Utöver de generella kraven gäller specifikt för denna IG:

- **Exponeringsgräns (REQ-EXP-1/2, stakeholder-beslut).** Endast
  [TKSearchAPI](CapabilityStatement-tk-search-api.html) — läsande sökning
  (`read`, `search-type`, inklusive `listed-by`) — exponeras externt, via
  gateway, för sökande konsumenter. [TKAdminAPI](CapabilityStatement-tk-admin-api.html),
  inklusive skrivinteraktionerna (`create`, `update`) på
  `Organization`/`Endpoint`/`PractitionerRole`, är endast internt exponerat
  och SKA inte nås via den externa gatewayen. Se [CapabilityStatement](capabilitystatement.html).
- Skrivrättigheter i tjänstekatalogens administrativa API begränsas till
  system som är behöriga att registrera information om den aktuella
  organisationen. Detta omfattar även registrering via systeminteraktionen
  `transaction` (REQ-TRC-2) — en transaction-Bundle är inte ett sätt att
  kringgå den vanliga skrivbehörighetskontrollen, samma regler gäller för
  varje post i Bundlen som för motsvarande fristående `create`/`update`.
  **Administratörsbehörighet** — vilken organisation en
  administratör representerar (`local-admin`), eller att administratören
  är `central-admin` (samtliga organisationer) — kan registreras i
  katalogen som [TKAdministratorRole](StructureDefinition-tk-administrator-role.html)
  (REQ-ADM-1..3, stakeholder-beslut). Hur en anropande klients identitet
  knyts till dess `TKAdministratorRole`-poster (t.ex. via
  certifikatets/klientens registrerade organisationstillhörighet), och den
  faktiska kontrollen att en skrivning bara avser en organisation
  anroparen representerar, är en driftsfråga/serverimplementationsfråga
  för respektive tjänstekatalog-instans och beskrivs inte ytterligare i
  denna IG.
- Synkroniseringstjänstens behörighet mot **EHM:s** `$add-organization`/
  `$remove-organization` (rollen Organization Endpoint Writer) styrs av
  EHM, inte av denna IG — se EHM:s egen IG för deras säkerhetskrav.
- Sökning (`read`, `search-type`, inklusive `listed-by`) förutsätts vara
  tillgänglig för behöriga tjänstekonsumenter utan krav på samtycke, då
  informationen avser tekniska ändpunkter och organisationer, inte
  personuppgifter om enskilda.
