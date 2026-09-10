# API-instansens giltighetsperiod - Tjänstekatalogen v0.1.0

## Extension: API-instansens giltighetsperiod 

API-instansens (TKAPIInstance) egen giltighetsperiod, oberoende av den ändpunkt som tillgängliggör den (API.giltigFrom/giltigTom i informationsunderlaget).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen API-instans](StructureDefinition-tk-api-instance.md)
* Exempel för denna Extension: [CapabilityStatement/TKAPIInstanceExample](CapabilityStatement-TKAPIInstanceExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-api-instance-period)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen Period: API-instansens (TKAPIInstance) egen giltighetsperiod, oberoende av den ändpunkt som tillgängliggör den (API.giltigFrom/giltigTom i informationsunderlaget).

 **DifferentialvyDifferential View** 

 **Ögonblicksbildsvy** 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen Period: API-instansens (TKAPIInstance) egen giltighetsperiod, oberoende av den ändpunkt som tillgängliggör den (API.giltigFrom/giltigTom i informationsunderlaget).

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-api-instance-period.csv), [Excel](../StructureDefinition-tk-api-instance-period.xlsx), [Schematron](../StructureDefinition-tk-api-instance-period.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-api-instance-period",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period",
  "version" : "0.1.0",
  "name" : "TKAPIInstancePeriod",
  "title" : "API-instansens giltighetsperiod",
  "status" : "draft",
  "date" : "2026-09-10T06:56:47+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "API-instansens (TKAPIInstance) egen giltighetsperiod, oberoende av den ändpunkt som tillgängliggör den (API.giltigFrom/giltigTom i informationsunderlaget).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "CapabilityStatement"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "API-instansens giltighetsperiod",
      "definition" : "API-instansens (TKAPIInstance) egen giltighetsperiod, oberoende av den ändpunkt som tillgängliggör den (API.giltigFrom/giltigTom i informationsunderlaget)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Period"
      }]
    }]
  }
}

```
