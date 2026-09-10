# Exempel: API-instans i tjänstekatalogen - Tjänstekatalogen v0.1.0

## CapabilityStatement: Exempel: API-instans i tjänstekatalogen 

 [Rå OpenAPI-Swagger-definitionsfil](../TKAPIInstanceExample.openapi.json) | [Ladda ner](../TKAPIInstanceExample.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "TKAPIInstanceExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance"]
  },
  "extension" : [{
    "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint",
    "valueReference" : {
      "reference" : "Endpoint/TKEndpointExample"
    }
  },
  {
    "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period",
    "valuePeriod" : {
      "start" : "2026-01-01"
    }
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/TKAPIInstanceExample",
  "version" : "0.1.0",
  "status" : "active",
  "date" : "2026-01-15",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "kind" : "instance",
  "instantiates" : ["https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation"],
  "implementation" : {
    "description" : "Exempelregionens patientinformations-API",
    "url" : "https://api.exempelregionen.se/patientinformation/fhir",
    "custodian" : {
      "reference" : "Organization/TKOrganizationExample"
    }
  },
  "fhirVersion" : "5.0.0",
  "format" : ["json"],
  "rest" : [{
    "mode" : "server"
  }]
}

```
