# Tjänstekatalogen: administrativt API - Tjänstekatalogen v0.1.0

## CapabilityStatement: Tjänstekatalogen: administrativt API (Experimentell) 

 
Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer, tekniska ändpunkter, API-specifikationer och API-instanser (inklusive sökning av ändpunkter per organisation, se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md)), samt registrering av administratörsbehörigheter. Registrering SKA ske via transaction-Bundle med en tillhörande Provenance-post (REQ-TRC-1/2). Läses av en Synkroniseringstjänst som separat, mot E-hälsomyndighetens (EHM) egna API, antar rollen "Organization Endpoint Writer" — se "Mappning mot EHM:s Organization Endpoint Writer" i mappings.html. Detta API är endast internt exponerat — se [TKSearchAPI](CapabilityStatement-tk-search-api.md) för det externt exponerade, läsande sök-API:et. 

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
  "description" : "Beskriver de FHIR REST-förmågor som tjänstekatalogens administrativa API stödjer: registrering och sökning av organisationer, tekniska ändpunkter, API-specifikationer och API-instanser (inklusive sökning av ändpunkter per organisation, se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)), samt registrering av administratörsbehörigheter. Registrering SKA ske via transaction-Bundle med en tillhörande Provenance-post (REQ-TRC-1/2). Läses av en Synkroniseringstjänst som separat, mot E-hälsomyndighetens (EHM) egna API, antar rollen \"Organization Endpoint Writer\" — se \"Mappning mot EHM:s Organization Endpoint Writer\" i mappings.html. Detta API är endast internt exponerat — se [TKSearchAPI](CapabilityStatement-tk-search-api.html) för det externt exponerade, läsande sök-API:et.",
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
      "documentation" : "Interoperabilitetsspecifikationer (kind=requirements, TKAPISpecificationCapability) och API-instanser (kind=instance, TKAPIInstance, med instantiates och implementation.custodian).",
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
        "name" : "url",
        "definition" : "http://hl7.org/fhir/SearchParameter/CanonicalResource-url",
        "type" : "uri",
        "documentation" : "Sök på kanonisk URL."
      },
      {
        "name" : "kind",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-kind",
        "type" : "token",
        "documentation" : "Filtrera på requirements (API-specifikation) eller instance (API-instans). Se SearchParameter-tk-capabilitystatement-kind.html."
      },
      {
        "name" : "instantiates",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-capabilitystatement-instantiates",
        "type" : "reference",
        "documentation" : "Sök API-instanser efter vilken specifikation de följer. Se SearchParameter-tk-capabilitystatement-instantiates.html."
      }]
    },
    {
      "type" : "Provenance",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance",
      "documentation" : "Spårbarhetsposter för registreringar (skapande/uppdatering) av Organization, Endpoint, CapabilityStatement (API-specifikation/API-instans).",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "target",
        "definition" : "http://hl7.org/fhir/SearchParameter/Provenance-target",
        "type" : "reference",
        "documentation" : "Den registrerade resursen, t.ex. Endpoint/{id}."
      }]
    },
    {
      "type" : "PractitionerRole",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role",
      "documentation" : "Administratörsbehörigheter: vilken organisation en administratör representerar (local-admin), eller att administratören är central-admin (organization utelämnad).",
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
        "definition" : "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization",
        "type" : "reference",
        "documentation" : "Sök administratörsbehörigheter efter representerad organisation."
      },
      {
        "name" : "practitioner",
        "definition" : "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner",
        "type" : "reference",
        "documentation" : "Sök administratörsbehörigheter efter innehavare."
      }]
    }],
    "interaction" : [{
      "code" : "transaction",
      "documentation" : "Registrering av en eller flera resurser (Organization, Endpoint, CapabilityStatement) tillsammans med en obligatorisk Provenance-post i samma transaction-Bundle. Se REQ-TRC-1/2."
    }]
  }]
}

```
