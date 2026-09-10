# Specifikationskategori - Tjänstekatalogen v0.1.0

## Extension: Specifikationskategori 

Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt (API-specifikation.kategori i informationsunderlaget). Basresursen CapabilityStatement saknar ett eget element för klassificering av detta slag.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen API-specifikation](StructureDefinition-tk-api-specification-capability.md)
* Exempel för denna Extension: [IneraPatientinformation](CapabilityStatement-TKAPISpecificationCapabilityExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-api-specification-category)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen CodeableConcept: Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt (API-specifikation.kategori i informationsunderlaget). Basresursen CapabilityStatement saknar ett eget element för klassificering av detta slag.

 **DifferentialvyDifferential View** 

 **Ögonblicksbildsvy** 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen CodeableConcept: Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt (API-specifikation.kategori i informationsunderlaget). Basresursen CapabilityStatement saknar ett eget element för klassificering av detta slag.

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-api-specification-category.csv), [Excel](../StructureDefinition-tk-api-specification-category.xlsx), [Schematron](../StructureDefinition-tk-api-specification-category.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-api-specification-category",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-category",
  "version" : "0.1.0",
  "name" : "TKAPISpecificationCategory",
  "title" : "Specifikationskategori",
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
  "description" : "Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt (API-specifikation.kategori i informationsunderlaget). Basresursen CapabilityStatement saknar ett eget element för klassificering av detta slag.",
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
      "short" : "Specifikationskategori",
      "definition" : "Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt (API-specifikation.kategori i informationsunderlaget). Basresursen CapabilityStatement saknar ett eget element för klassificering av detta slag."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-category"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
