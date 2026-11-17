# Kategorier för API-specifikationer - Tjänstekatalogen v0.2.0

## ValueSet: Kategorier för API-specifikationer (Experimentell) 

 **References** 

* [Specifikationskategori](StructureDefinition-tk-api-specification-category.md)

### Logisk definition (CLD)

 

### Expansion

-------

 [Beskrivning av ovanstående tabell(er)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "tk-api-specification-category",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/ValueSet/tk-api-specification-category",
  "version" : "0.2.0",
  "name" : "TKAPISpecificationCategoryVS",
  "title" : "Kategorier för API-specifikationer",
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
  "description" : "Värden för API-specifikation.kategori. Extensible-bindning: använd en kod härifrån när någon passar, annars får en annan kod eller text anges.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-api-specification-category"
    }]
  }
}

```
