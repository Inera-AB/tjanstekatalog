# API-specifikation (logisk modell) - Tjänstekatalogen v0.1.0

## Logisk modell: API-specifikation (logisk modell) 

 
Logisk modell för entiteten API-specifikation i informationsunderlaget. REST-exponering i det administrativa API:et är inte del av detta utkast — se REQ-MDL-4. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-api-specification)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

** Sammanfattning **

Obligatorisk: 0 element(4 nästlade obligatoriska elements)

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

** Sammanfattning **

Obligatorisk: 0 element(4 nästlade obligatoriska elements)

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-api-specification.csv), [Excel](../StructureDefinition-tk-api-specification.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-api-specification",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification",
  "version" : "0.1.0",
  "name" : "TKAPISpecification",
  "title" : "API-specifikation (logisk modell)",
  "status" : "draft",
  "date" : "2026-09-08T11:28:32+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Logisk modell för entiteten API-specifikation i informationsunderlaget. REST-exponering i det administrativa API:et är inte del av detta utkast — se REQ-MDL-4.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "req",
    "uri" : "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements",
    "name" : "Kravkatalog"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "tk-api-specification",
      "path" : "tk-api-specification",
      "short" : "API-specifikation (logisk modell)",
      "definition" : "Logisk modell för entiteten API-specifikation i informationsunderlaget. REST-exponering i det administrativa API:et är inte del av detta utkast — se REQ-MDL-4."
    },
    {
      "id" : "tk-api-specification.id",
      "path" : "tk-api-specification.id",
      "short" : "Id",
      "definition" : "Unik identifierare för API-specifikationen i tjänstekatalogen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "id"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.kanoniskUrl",
      "path" : "tk-api-specification.kanoniskUrl",
      "short" : "Kanonisk URL",
      "definition" : "Specifikationens egen kanoniska/maskinläsbara identitet, t.ex. en FHIR IG:s canonical URL. Detta är värdet som Endpoint.payload-extensionen tk-endpoint-payload-profile förväntas referera.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4, REQ-SRCH-3"
      }]
    },
    {
      "id" : "tk-api-specification.status",
      "path" : "tk-api-specification.status",
      "short" : "Status",
      "definition" : "Specifikationens publiceringsstatus.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.maskinlasbartNamn",
      "path" : "tk-api-specification.maskinlasbartNamn",
      "short" : "Maskinläsbart namn",
      "definition" : "Kort, maskinläsbart namn på specifikationen. FSH-elementnamnet använder ASCII (maskinlasbartNamn) enligt rekommendationen för enkla alfanumeriska elementnamn; det affärsmässiga namnet i informationsunderlaget är \"maskinläsbartNamn\".",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.version",
      "path" : "tk-api-specification.version",
      "short" : "Version",
      "definition" : "Specifikationens versionsbeteckning.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.referensTillKalla",
      "path" : "tk-api-specification.referensTillKalla",
      "short" : "Referens till källa",
      "definition" : "Länk till specifikationens källa/publiceringsplats (t.ex. dokumentation eller repository), skild från den kanoniska maskinidentiteten. FSH-elementnamnet använder ASCII (referensTillKalla); det affärsmässiga namnet i informationsunderlaget är \"referensTillKälla\".",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "url"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.kategori",
      "path" : "tk-api-specification.kategori",
      "short" : "Kategori",
      "definition" : "Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.titel",
      "path" : "tk-api-specification.titel",
      "short" : "Titel",
      "definition" : "Specifikationens människoläsbara titel.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.beskrivning",
      "path" : "tk-api-specification.beskrivning",
      "short" : "Beskrivning",
      "definition" : "Fritextbeskrivning av specifikationen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "markdown"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.ansvarigUtgivare",
      "path" : "tk-api-specification.ansvarigUtgivare",
      "short" : "Ansvarig utgivare",
      "definition" : "Organisationen som ansvarar för och publicerar specifikationen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "tk-api-specification.utgivningsdatum",
      "path" : "tk-api-specification.utgivningsdatum",
      "short" : "Utgivningsdatum",
      "definition" : "Datum då denna version av specifikationen gavs ut.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    }]
  }
}

```
