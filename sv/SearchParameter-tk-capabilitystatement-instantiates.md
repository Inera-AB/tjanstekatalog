# CapabilityStatement: instantiates - Tjänstekatalogen v0.1.0

## SearchParameter: CapabilityStatement: instantiates (Experimentell) 

 
Söker fram de TKAPIInstance-resurser (kind=instance) som följer (instantiates) en angiven TKAPISpecificationCapability, identifierad via dess kanoniska URL. Se REQ-MDL-7. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "tk-capabilitystatement-instantiates",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates",
  "version" : "0.1.0",
  "name" : "TKCapabilityStatementInstantiates",
  "title" : "CapabilityStatement: instantiates",
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
  "description" : "Söker fram de TKAPIInstance-resurser (kind=instance) som följer (instantiates) en angiven TKAPISpecificationCapability, identifierad via dess kanoniska URL. Se REQ-MDL-7.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "code" : "instantiates",
  "base" : ["CapabilityStatement"],
  "type" : "reference",
  "expression" : "CapabilityStatement.instantiates",
  "processingMode" : "normal",
  "target" : ["CapabilityStatement"]
}

```
