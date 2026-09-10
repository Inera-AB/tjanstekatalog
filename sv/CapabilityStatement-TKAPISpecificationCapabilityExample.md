# Exempel: API-specifikation i tjänstekatalogen - Tjänstekatalogen v0.1.0

## CapabilityStatement: Exempel: API-specifikation i tjänstekatalogen 

 
Interoperabilitetsspecifikation för utbyte av patientinformation mellan vårdgivare. 

 [Rå OpenAPI-Swagger-definitionsfil](../TKAPISpecificationCapabilityExample.openapi.json) | [Ladda ner](../TKAPISpecificationCapabilityExample.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "TKAPISpecificationCapabilityExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability"]
  },
  "extension" : [{
    "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-category",
    "valueCodeableConcept" : {
      "text" : "FHIR"
    }
  },
  {
    "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-source-reference",
    "valueUrl" : "https://fhir.inera.se/ig/patientinformation/"
  }],
  "url" : "https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation",
  "version" : "0.1.0",
  "name" : "IneraPatientinformation",
  "title" : "Patientinformation (Inera FHIR IG)",
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
  "description" : "Interoperabilitetsspecifikation för utbyte av patientinformation mellan vårdgivare.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "5.0.0",
  "format" : ["json"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "Se specifikationens egen IG för fullständiga REST-förmågor."
  }]
}

```
