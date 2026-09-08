# Säkerhetsmetod - Tjänstekatalogen v0.1.0

## Extension: Säkerhetsmetod 

Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)
* Exempel för denna Extension: [Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-endpoint-security-method)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Terminologibindningar (differential)

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Enkel extension med typen CodeableConcept: Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5.

 **DifferentialvyDifferential View** 

#### Terminologibindningar (differential)

 **Ögonblicksbildsvy** 

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Enkel extension med typen CodeableConcept: Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5.

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-endpoint-security-method.csv), [Excel](../StructureDefinition-tk-endpoint-security-method.xlsx), [Schematron](../StructureDefinition-tk-endpoint-security-method.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-endpoint-security-method",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method",
  "version" : "0.1.0",
  "name" : "TKEndpointSecurityMethod",
  "title" : "Säkerhetsmetod",
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
  "description" : "Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5.",
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
    "expression" : "Endpoint"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Säkerhetsmetod",
      "definition" : "Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://fhir.inera.se/ig/tjanstekatalog/ValueSet/tk-endpoint-security-method"
      }
    }]
  }
}

```
