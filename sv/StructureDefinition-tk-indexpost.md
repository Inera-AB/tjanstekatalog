# Indexpost (logisk modell) - Tjänstekatalogen v0.1.0

## Logisk modell: Indexpost (logisk modell) 

 
Logisk modell för entiteten Indexpost i informationsunderlaget. Ej REST-exponerad i detta utkast av det administrativa API:et — se REQ-MDL-1. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-indexpost)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

** Sammanfattning **

Obligatorisk: 0 element(3 nästlade obligatoriska elements)

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)
* [Vård- och omsorgstagare (logisk modell) (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare)](StructureDefinition-tk-vard-och-omsorgstagare.md)

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

** Sammanfattning **

Obligatorisk: 0 element(3 nästlade obligatoriska elements)

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)
* [Vård- och omsorgstagare (logisk modell) (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare)](StructureDefinition-tk-vard-och-omsorgstagare.md)

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-indexpost.csv), [Excel](../StructureDefinition-tk-indexpost.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-indexpost",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-indexpost",
  "version" : "0.1.0",
  "name" : "TKIndexpost",
  "title" : "Indexpost (logisk modell)",
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
  "description" : "Logisk modell för entiteten Indexpost i informationsunderlaget. Ej REST-exponerad i detta utkast av det administrativa API:et — se REQ-MDL-1.",
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
  "type" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-indexpost",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "tk-indexpost",
      "path" : "tk-indexpost",
      "short" : "Indexpost (logisk modell)",
      "definition" : "Logisk modell för entiteten Indexpost i informationsunderlaget. Ej REST-exponerad i detta utkast av det administrativa API:et — se REQ-MDL-1."
    },
    {
      "id" : "tk-indexpost.id",
      "path" : "tk-indexpost.id",
      "short" : "Indexpostens id",
      "definition" : "Unik identifierare för indexposten.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "id"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-1"
      }]
    },
    {
      "id" : "tk-indexpost.registreringstidpunkt",
      "path" : "tk-indexpost.registreringstidpunkt",
      "short" : "Registreringstidpunkt",
      "definition" : "Tidpunkt då indexposten registrerades.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-1"
      }]
    },
    {
      "id" : "tk-indexpost.avser",
      "path" : "tk-indexpost.avser",
      "short" : "Avser",
      "definition" : "Vad indexposten avser: antingen en organisation eller en vård- och omsorgstagare.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
        "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare"]
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-1, REQ-MDL-2"
      }]
    }]
  }
}

```
