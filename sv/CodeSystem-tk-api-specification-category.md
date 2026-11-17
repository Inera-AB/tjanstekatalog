# Kategorier för API-specifikationer (kodsystem) - Tjänstekatalogen v0.2.0

## CodeSystem: Kategorier för API-specifikationer (kodsystem) (Experimentell) 

Detta kodsystem refereras i definitionen av följande värdemängder:

* [Kategorier för API-specifikationer](ValueSet-tk-api-specification-category.md)

-------

 [Beskrivning av ovanstående tabell(er)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tk-api-specification-category",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-api-specification-category",
  "version" : "0.2.0",
  "name" : "TKAPISpecificationCategoryCS",
  "title" : "Kategorier för API-specifikationer (kodsystem)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-11-17T13:36:46+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Kodsystem som anger vilken typ av interoperabilitetsspecifikation en API-specifikation är (API-specifikation.kategori i informationsunderlaget). Preliminärt förslag.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "fhir",
    "display" : "FHIR",
    "definition" : "Specifikationen är en HL7 FHIR-specifikation, t.ex. en implementationsguide (IG)."
  },
  {
    "code" : "rest-openapi",
    "display" : "REST/OpenAPI",
    "definition" : "Specifikationen är ett REST-API beskrivet med OpenAPI."
  },
  {
    "code" : "soap-rivta",
    "display" : "SOAP/RIVTA",
    "definition" : "Specifikationen är ett SOAP-baserat tjänstekontrakt enligt RIVTA."
  }]
}

```
