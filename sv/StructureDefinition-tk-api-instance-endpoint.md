# Tillgängliggörande ändpunkt - Tjänstekatalogen v0.1.0

## Extension: Tillgängliggörande ändpunkt 

Den ändpunkt (TKEndpoint) som tillgängliggör denna API-instans ("tillgängliggör"). Basresursen CapabilityStatement har inget element för detta.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen API-instans](StructureDefinition-tk-api-instance.md)
* Exempel för denna Extension: [CapabilityStatement/TKAPIInstanceExample](CapabilityStatement-TKAPIInstanceExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-api-instance-endpoint)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen Reference: Den ändpunkt (TKEndpoint) som tillgängliggör denna API-instans ("tillgängliggör"). Basresursen CapabilityStatement har inget element för detta.

 **DifferentialvyDifferential View** 

 **Ögonblicksbildsvy** 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen Reference: Den ändpunkt (TKEndpoint) som tillgängliggör denna API-instans ("tillgängliggör"). Basresursen CapabilityStatement har inget element för detta.

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-api-instance-endpoint.csv), [Excel](../StructureDefinition-tk-api-instance-endpoint.xlsx), [Schematron](../StructureDefinition-tk-api-instance-endpoint.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-api-instance-endpoint",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint",
  "version" : "0.1.0",
  "name" : "TKAPIInstanceEndpoint",
  "title" : "Tillgängliggörande ändpunkt",
  "status" : "draft",
  "date" : "2026-09-10T07:38:29+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Den ändpunkt (TKEndpoint) som tillgängliggör denna API-instans (\"tillgängliggör\"). Basresursen CapabilityStatement har inget element för detta.",
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
      "short" : "Tillgängliggörande ändpunkt",
      "definition" : "Den ändpunkt (TKEndpoint) som tillgängliggör denna API-instans (\"tillgängliggör\"). Basresursen CapabilityStatement har inget element för detta."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
      }]
    }]
  }
}

```
