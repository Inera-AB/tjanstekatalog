# Säkerhet och behörighet

Ineras generella säkerhetskrav för anslutning till FHIR-gränssnitt gäller
för denna IG — se [FHIR på Inera](https://fhir.inera.se/) för den
auktoritativa, förvaltade beskrivningen av autentiseringsmetod,
behörighetsmodell och nätverkskrav.

Utöver de generella kraven gäller specifikt för denna IG:

- Skrivrättigheter (`create`, `update` på `Organization`/`Endpoint`) i
  tjänstekatalogens administrativa API begränsas till system som är
  behöriga att registrera information om den aktuella organisationen. Hur
  denna behörighet knyts till en organisations id (t.ex. via
  certifikatets/klientens registrerade organisationstillhörighet) är en
  driftsfråga för respektive tjänstekatalog-instans och beskrivs inte
  ytterligare i denna IG.
- Synkroniseringstjänstens behörighet mot **EHM:s** `$add-organization`/
  `$remove-organization` (rollen Organization Endpoint Writer) styrs av
  EHM, inte av denna IG — se EHM:s egen IG för deras säkerhetskrav.
- Sökning (`read`, `search-type`, inklusive `listed-by`) förutsätts vara
  tillgänglig för behöriga tjänstekonsumenter utan krav på samtycke, då
  informationen avser tekniska ändpunkter och organisationer, inte
  personuppgifter om enskilda.
