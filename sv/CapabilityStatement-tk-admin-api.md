# Tjänstekatalogen: administrativt API - Tjänstekatalogen v0.1.0

## CapabilityStatement: Tjänstekatalogen: administrativt API (Experimentell) 

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
      },
      {
        "code" : "history-type",
        "documentation" : "BÖR stödjas för återsynkronisering: `GET [base]/Organization/_history?_since=[tidpunkt]`. Till skillnad från sökning med `_lastUpdated` syns även borttagna poster. Se REQ-DIST-4."
      }],
      "searchInclude" : ["Organization:endpoint"],
      "searchParam" : [{
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-identifier",
        "type" : "token",
        "documentation" : "Sök organisation på identifierare (\"logisk adress\"). HSA-id (`urn:oid:1.2.752.29.4.19`) matchas exakt, bindestrecket ingår i identifieraren. För organisationsnummer (`urn:oid:2.5.4.97`) godtas värdet med eller utan bindestreck. Se REQ-SRCH-5."
      },
      {
        "name" : "name",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-name",
        "type" : "string",
        "documentation" : "Sök organisation på namn. Modifierarna `:contains` och `:exact` stöds."
      },
      {
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Sök organisation på logiskt id."
      },
      {
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "Avgränsa organisationer på senaste ändringstidpunkt, t.ex. för grundladdning. Se REQ-DIST-2."
      },
      {
        "name" : "active",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-active",
        "type" : "token",
        "documentation" : "Sök aktiva eller inaktiva organisationer. Inaktiva organisationer filtreras inte bort som standard."
      },
      {
        "name" : "partof",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-partof",
        "type" : "reference",
        "documentation" : "Sök underliggande enheter till en organisation, t.ex. vårdenheter under en vårdgivare. Se REQ-ORG-8."
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
      },
      {
        "code" : "history-type",
        "documentation" : "BÖR stödjas för återsynkronisering: `GET [base]/Endpoint/_history?_since=[tidpunkt]`. Till skillnad från sökning med `_lastUpdated` syns även borttagna poster. Se REQ-DIST-4."
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
        "documentation" : "Sök ändpunkter efter status. Ändpunkter med status `entered-in-error` returneras bara när de efterfrågas uttryckligen (`status=entered-in-error`). Se REQ-SRCH-7."
      },
      {
        "name" : "implements",
        "definition" : "https://fhir.inera.se/ig/tjanstekatalog/SearchParameter/tk-endpoint-implements",
        "type" : "reference",
        "documentation" : "Sök ändpunkter efter stödd interoperabilitetsspecifikation, som kanonisk URL (alla versioner) eller `url|version` (endast den versionen). Se SearchParameter-tk-endpoint-implements.html och REQ-SRCH-6."
      },
      {
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Sök ändpunkt på logiskt id."
      },
      {
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "Avgränsa ändpunkter på senaste ändringstidpunkt, t.ex. för grundladdning. Se REQ-DIST-2."
      },
      {
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Endpoint-identifier",
        "type" : "token",
        "documentation" : "Sök ändpunkt på identifierare, t.ex. EHM:s Endpoint-id."
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
        "documentation" : "Sök på kanonisk URL. Returnerar alla versioner av specifikationen, se REQ-MDL-8."
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
        "documentation" : "Sök API-instanser efter vilken specifikation de följer, som kanonisk URL (alla versioner) eller `url|version` (endast den versionen). Literala referenser (`CapabilityStatement/[id]`) stöds inte. Se SearchParameter-tk-capabilitystatement-instantiates.html och REQ-SRCH-6."
      },
      {
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Sök på logiskt id."
      },
      {
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "Avgränsa API-specifikationer och API-instanser på senaste ändringstidpunkt, t.ex. för grundladdning. Se REQ-DIST-2."
      },
      {
        "name" : "version",
        "definition" : "http://hl7.org/fhir/SearchParameter/CanonicalResource-version",
        "type" : "token",
        "documentation" : "Sök på version, t.ex. tillsammans med `url`. Se REQ-MDL-8."
      },
      {
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/CanonicalResource-date",
        "type" : "date",
        "documentation" : "Sök på utgivningsdatum. Används med `_sort=-date` för att få den senaste versionen först. Se REQ-MDL-8."
      }]
    },
    {
      "type" : "Provenance",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance",
      "documentation" : "Spårbarhetsposter för registreringar (skapande/uppdatering) av Organization, Endpoint, CapabilityStatement (API-specifikation/API-instans) och PractitionerRole (administratörsbehörighet). Se REQ-TRC-1/3.",
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
        "documentation" : "Den registrerade resursen, t.ex. Endpoint/{id} eller PractitionerRole/{id} (vem som ändrat en administratörsbehörighet)."
      }]
    },
    {
      "type" : "PractitionerRole",
      "profile" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role",
      "documentation" : "Administratörsbehörigheter: vilken organisation en administratör representerar (local-admin), eller att administratören är central-admin (organization utelämnad). Registreras, liksom övriga resurser, via transaction-Bundle med en Provenance-post (REQ-TRC-1/3). Återkallas med update (active = false och/eller period.end), aldrig delete (REQ-ADM-4).",
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
      },
      {
        "name" : "active",
        "definition" : "http://hl7.org/fhir/SearchParameter/PractitionerRole-active",
        "type" : "token",
        "documentation" : "Sök gällande (true) eller återkallade (false) behörigheter. Kontrollera även period, se REQ-ADM-4."
      }]
    }],
    "interaction" : [{
      "code" : "transaction",
      "documentation" : "Registrering av en eller flera resurser (Organization, Endpoint, CapabilityStatement, PractitionerRole) tillsammans med en obligatorisk Provenance-post i samma transaction-Bundle. Se REQ-TRC-1/2."
    }]
  }]
}

```
