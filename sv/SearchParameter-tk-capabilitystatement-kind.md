# CapabilityStatement: kind - Tjänstekatalogen v0.1.0

## SearchParameter: CapabilityStatement: kind (Experimentell) 

 
Söker CapabilityStatement-resurser efter kind. Används för att skilja API-specifikationer (kind=requirements, TKAPISpecificationCapability) från API-instanser (kind=instance, TKAPIInstance) vid sökning. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "tk-capabilitystatement-kind",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-kind",
  "version" : "0.1.0",
  "name" : "TKCapabilityStatementKind",
  "title" : "CapabilityStatement: kind",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-09",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Söker CapabilityStatement-resurser efter kind. Används för att skilja API-specifikationer (kind=requirements, TKAPISpecificationCapability) från API-instanser (kind=instance, TKAPIInstance) vid sökning.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "code" : "kind",
  "base" : ["CapabilityStatement"],
  "type" : "token",
  "expression" : "CapabilityStatement.kind",
  "processingMode" : "normal"
}

```
