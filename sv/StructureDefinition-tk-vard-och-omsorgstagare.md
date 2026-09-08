# Vård- och omsorgstagare (logisk modell) - Tjänstekatalogen v0.1.0

## Logisk modell: Vård- och omsorgstagare (logisk modell) 

 
Logisk modell för entiteten Vård- och omsorgstagare i informationsunderlaget. Tunn, avsiktligt begränsad till id — se REQ-MDL-2. 

**Användningar:**

* Referera till denna Logisk modell: [Indexpost (logisk modell)](StructureDefinition-tk-indexpost.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-vard-och-omsorgstagare)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

** Sammanfattning **

Obligatorisk: 0 element(1 nästlade obligatoriska element)

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

** Sammanfattning **

Obligatorisk: 0 element(1 nästlade obligatoriska element)

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-vard-och-omsorgstagare.csv), [Excel](../StructureDefinition-tk-vard-och-omsorgstagare.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-vard-och-omsorgstagare",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare",
  "version" : "0.1.0",
  "name" : "TKVardOchOmsorgstagare",
  "title" : "Vård- och omsorgstagare (logisk modell)",
  "status" : "draft",
  "date" : "2026-09-08T11:37:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Logisk modell för entiteten Vård- och omsorgstagare i informationsunderlaget. Tunn, avsiktligt begränsad till id — se REQ-MDL-2.",
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
  "type" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-vard-och-omsorgstagare",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "tk-vard-och-omsorgstagare",
      "path" : "tk-vard-och-omsorgstagare",
      "short" : "Vård- och omsorgstagare (logisk modell)",
      "definition" : "Logisk modell för entiteten Vård- och omsorgstagare i informationsunderlaget. Tunn, avsiktligt begränsad till id — se REQ-MDL-2."
    },
    {
      "id" : "tk-vard-och-omsorgstagare.id",
      "path" : "tk-vard-och-omsorgstagare.id",
      "short" : "Id",
      "definition" : "Unik identifierare för vård- och omsorgstagaren i detta sammanhang.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "id"
      }],
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-2"
      }]
    }]
  }
}

```
