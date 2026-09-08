# Säkerhet och behörighet

Ineras generella säkerhetskrav för anslutning till FHIR-gränssnitt gäller
för denna IG — se [FHIR på Inera](https://fhir.inera.se/) för den
auktoritativa, förvaltade beskrivningen av autentiseringsmetod,
behörighetsmodell och nätverkskrav.

Utöver de generella kraven gäller specifikt för denna IG:

- Skrivrättigheter (`create`, `update`, `$add-organization-to-endpoint`,
  `$remove-organization-from-endpoint`) begränsas till system som är
  behöriga att agera Organization Endpoint Writer för den aktuella
  organisationen. Hur denna behörighet knyts till en organisations id (t.ex.
  via certifikatets/klientens registrerade organisationstillhörighet) är en
  driftsfråga för respektive tjänstekatalog-instans och beskrivs inte
  ytterligare i denna IG.
- `$add-organization-to-endpoint` och `$remove-organization-from-endpoint`
  ändrar `Organization.endpoint` utan att kräva skrivrättighet till hela
  `Organization`-resursen (se [Roller och ansvar](roles-and-responsibilities.html)) —
  servrar ska ändå kontrollera att anropande system har rätt att koppla just
  den angivna ändpunkten till just den angivna organisationen.
- Sökning (`read`, `search-type`, inklusive `listed-by`) förutsätts vara
  tillgänglig för behöriga tjänstekonsumenter utan krav på samtycke, då
  informationen avser tekniska ändpunkter och organisationer, inte
  personuppgifter om enskilda.
