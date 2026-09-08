# Endpoint: listed-by (organisation som listar ändpunkten) - Tjänstekatalogen v0.1.0

## SearchParameter: Endpoint: listed-by (organisation som listar ändpunkten) (Experimentell) 

 
Söker fram de Endpoint-resurser som en angiven Organization listar i sin ändpunktskatalog, dvs. de ändpunkter som förekommer i Organization.endpoint ("har"-relationen i informationsunderlaget) — till skillnad från standardparametern `organization`, som endast matchar den förvaltande organisationen (Endpoint.managingOrganization, "förvaltar"-relationen). Servrar SKA implementera denna parameter med sökbeteende likvärdigt med `_has:Organization:endpoint:_id=[organization-id]`. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "tk-endpoint-listed-by",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by",
  "version" : "0.1.0",
  "name" : "TKEndpointListedBy",
  "title" : "Endpoint: listed-by",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-08",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Söker fram de Endpoint-resurser som en angiven Organization listar i sin ändpunktskatalog, dvs. de ändpunkter som förekommer i Organization.endpoint (\"har\"-relationen i informationsunderlaget) — till skillnad från standardparametern `organization`, som endast matchar den förvaltande organisationen (Endpoint.managingOrganization, \"förvaltar\"-relationen). Servrar SKA implementera denna parameter med sökbeteende likvärdigt med `_has:Organization:endpoint:_id=[organization-id]`.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "code" : "listed-by",
  "base" : ["Endpoint"],
  "type" : "reference",
  "target" : ["Organization"],
  "multipleOr" : true,
  "multipleAnd" : false,
  "chain" : ["identifier"]
}

```
