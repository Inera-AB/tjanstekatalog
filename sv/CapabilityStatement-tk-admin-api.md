# Tjänstekatalogen: administrativt API - Tjänstekatalogen v0.1.0

## CapabilityStatement: Tjänstekatalogen: administrativt API (Experimentell) 

 
Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md)) och mottagning av anrop från en [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.md). 

 [Rå OpenAPI-Swagger-definitionsfil](../tk-admin-api.openapi.json) | [Ladda ner](../tk-admin-api.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "tk-admin-api",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api",
  "version" : "0.1.0",
  "name" : "TKAdminAPICapabilityStatement",
  "title" : "Tjänstekatalogen: administrativt API",
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
  "description" : "Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)) och mottagning av anrop från en [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html).",
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
    "documentation" : "Administrativt API för tjänstekatalogen.",
    "resource" : [{
      "type" : "Organization",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
      "documentation" : "Organisationer registrerade i tjänstekatalogen.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      }],
      "searchParam" : [{
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-identifier",
        "type" : "token",
        "documentation" : "Sök organisation på identifierare, t.ex. organisationsnummer."
      },
      {
        "name" : "name",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-name",
        "type" : "string",
        "documentation" : "Sök organisation på namn."
      }]
    },
    {
      "type" : "Endpoint",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
      "documentation" : "Tekniska ändpunkter registrerade i tjänstekatalogen.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      }],
      "searchParam" : [{
        "name" : "organization",
        "definition" : "http://hl7.org/fhir/SearchParameter/Endpoint-organization",
        "type" : "reference",
        "documentation" : "Sök ändpunkter efter förvaltande organisation (Endpoint.managingOrganization, \"förvaltar\")."
      },
      {
        "name" : "listed-by",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-listed-by",
        "type" : "reference",
        "documentation" : "Sök ändpunkter efter organisation som listar dem (Organization.endpoint, \"har\"). Se SearchParameter-tk-endpoint-listed-by.html."
      },
      {
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Endpoint-status",
        "type" : "token",
        "documentation" : "Sök ändpunkter efter status."
      }],
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
