# Organization Endpoint Writer Capabilities - Tjänstekatalogen v0.1.0

## CapabilityStatement: Organization Endpoint Writer Capabilities (Experimentell) 

 
Detta CapabilityStatement beskriver de FHIR REST-förmågor som aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.md) ska stödja. 

 [Rå OpenAPI-Swagger-definitionsfil](../tk-organization-endpoint-writer.openapi.json) | [Ladda ner](../tk-organization-endpoint-writer.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "tk-organization-endpoint-writer",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-organization-endpoint-writer",
  "version" : "0.1.0",
  "name" : "TKOrganizationEndpointWriterCapabilities",
  "title" : "Organization Endpoint Writer Capabilities",
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
  "description" : "Detta CapabilityStatement beskriver de FHIR REST-förmågor som aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html) ska stödja.",
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
    "mode" : "client",
    "documentation" : "System som tillhandahåller information om tekniska ändpunkter till tjänstekatalogen.",
    "resource" : [{
      "type" : "Endpoint",
      "documentation" : "MAY-stödda operationer för att koppla/koppla loss en organisation från en ändpunkt.",
      "operation" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "add-organization-to-endpoint",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-add-organization-to-endpoint"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "remove-organization-from-endpoint",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-remove-organization-from-endpoint"
      }]
    }]
  }]
}

```
