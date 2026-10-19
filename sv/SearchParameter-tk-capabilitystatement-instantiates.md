# CapabilityStatement: instantiates - Tjänstekatalogen v0.1.0

## SearchParameter: CapabilityStatement: instantiates (Experimentell) 



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
  "description" : "Söker fram de TKAPIInstance-resurser (kind=instance) som följer (instantiates) en angiven TKAPISpecificationCapability, identifierad via dess kanoniska URL. Typen är `reference` eftersom `CapabilityStatement.instantiates` är en `canonical`. Godtagna former: `[url]`, som matchar alla versioner (även referenser utan version), och `[url]|[version]`, som bara matchar den angivna versionen. Literala referenser (`CapabilityStatement/[id]`) stöds inte. Se REQ-MDL-7 och REQ-SRCH-6.",
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
