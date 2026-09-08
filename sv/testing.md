# Testning och validering - Tjänstekatalogen v0.1.0

## Testning och validering

# Testning och validering

Implementatörer kan validera sina `Organization`- och `Endpoint`-instanser mot profilerna i denna IG med [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) och det publicerade IG-paketet (se [Nedladdningar](downloads.md)), t.ex.:

```
java -jar validator_cli.jar min-endpoint.json -version 5.0.0 \
  -ig https://fhir.inera.se/ig/tjanstekatalog \
  -profile https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint

```

Exempelinstanser för `TKOrganization` och `TKEndpoint` finns bland IG:ns [artefakter](artifacts.md) och kan användas som referens.

Det finns i dagsläget ingen delad testmiljö eller testdatakälla för denna IG. Fram till dess bör implementatörer verifiera:

* att `Endpoint`-sökning med `listed-by` returnerar samma resultat som `_has:Organization:endpoint:_id=[id]` (REQ-SRCH-1);
* att `organization` och `listed-by` ger olika resultat när en ändpunkts förvaltande organisation skiljer sig från den/de organisationer som listar den ("förvaltar" respektive "har");
* för Synkroniseringstjänsten: att organisationsidentifierare mappas till EHM:s förväntade system/format (se [Mappning mot EHM:s Organization Endpoint Writer](mappings.md)) innan `$add-organization`/ `$remove-organization` anropas, och att svar av typen `information` (redan tillagd/borttagen) hanteras som lyckade, idempotenta anrop — inte som fel.

