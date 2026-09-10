# Tjänstekatalogen: sök-API (externt) - Tjänstekatalogen v0.1.0

## CapabilityStatement: Tjänstekatalogen: sök-API (externt) (Experimentell) 

 
Beskriver de FHIR REST-förmågor som tjänstekatalogens sök-API exponerar externt, via gateway, för sökande konsumenter: läsning och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md)). Detta CapabilityStatement innehåller medvetet inga skrivinteraktioner (`create`/`update`) — dessa finns endast i [administrativt API](CapabilityStatement-tk-admin-api.md), som inte är externt exponerat. Se säkerhet och behörighet i security.html. 

 [Rå OpenAPI-Swagger-definitionsfil](../tk-search-api.openapi.json) | [Ladda ner](../tk-search-api.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "tk-search-api",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-search-api",
  "version" : "0.1.0",
  "name" : "TKSearchAPICapabilityStatement",
  "title" : "Tjänstekatalogen: sök-API (externt)",
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
  "description" : "Beskriver de FHIR REST-förmågor som tjänstekatalogens sök-API exponerar externt, via gateway, för sökande konsumenter: läsning och sökning av organisationer och tekniska ändpunkter, inklusive sökning av ändpunkter per organisation (se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)). Detta CapabilityStatement innehåller medvetet inga skrivinteraktioner (`create`/`update`) — dessa finns endast i [administrativt API](CapabilityStatement-tk-admin-api.html), som inte är externt exponerat. Se säkerhet och behörighet i security.html.",
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
    "documentation" : "Externt exponerat sök-API för tjänstekatalogen, nått via gateway. Endast läsande interaktioner.",
    "resource" : [{
      "type" : "Organization",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
      "documentation" : "Organisationer registrerade i tjänstekatalogen.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-identifier",
        "type" : "token",
        "documentation" : "Sök organisation på identifierare, t.ex. organisationsnummer (\"logisk adress\" — se mappings.html)."
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
      },
      {
        "name" : "implements",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements",
        "type" : "uri",
        "documentation" : "Sök ändpunkter efter stödd interoperabilitetsspecifikation. Se SearchParameter-tk-endpoint-implements.html."
      }]
    },
    {
      "type" : "CapabilityStatement",
      "supportedProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability",
      "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance"],
      "documentation" : "Interoperabilitetsspecifikationer (kind=requirements) och API-instanser (kind=instance) — för att upptäcka vilka specifikationer/API:er som finns.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "url",
        "definition" : "http://hl7.org/fhir/SearchParameter/CanonicalResource-url",
        "type" : "uri",
        "documentation" : "Sök på kanonisk URL."
      },
      {
        "name" : "kind",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-kind",
        "type" : "token",
        "documentation" : "Filtrera på requirements (API-specifikation) eller instance (API-instans)."
      },
      {
        "name" : "instantiates",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates",
        "type" : "reference",
        "documentation" : "Sök API-instanser efter vilken specifikation de följer."
      }]
    }]
  }]
}

```
