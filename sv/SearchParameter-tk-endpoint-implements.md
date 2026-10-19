# Endpoint: implements (stödd interoperabilitetsspecifikation) - Tjänstekatalogen v0.1.0

## SearchParameter: Endpoint: implements (stödd interoperabilitetsspecifikation) (Experimentell) 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "tk-endpoint-implements",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements",
  "version" : "0.1.0",
  "name" : "TKEndpointImplements",
  "title" : "Endpoint: implements",
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
  "description" : "Söker fram de Endpoint-resurser vars nyttolast (Endpoint.payload) stödjer en angiven interoperabilitetsspecifikation, dvs. vars TKEndpointPayloadProfile-extension (payload.extension) namner den angivna kanoniska URL:en. Kompletterar REQ-SRCH-3 (representation) med faktisk sökbarhet. Värdet anges som kanonisk URL, som matchar alla versioner (även referenser utan version), eller som `url|version`, som bara matchar den angivna versionen. Se REQ-SRCH-6.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "code" : "implements",
  "base" : ["Endpoint"],
  "type" : "reference",
  "expression" : "Endpoint.payload.extension('https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile').value",
  "processingMode" : "normal",
  "target" : ["CapabilityStatement"],
  "multipleOr" : true,
  "multipleAnd" : false
}

```
