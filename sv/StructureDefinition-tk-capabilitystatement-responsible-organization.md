# Ansvarig organisation (strukturerad referens) - Tjänstekatalogen v0.1.0

## Extension: Ansvarig organisation (strukturerad referens) 

Strukturerad referens till organisationen som ansvarar för en TKAPISpecificationCapability (API-specifikation.ansvarigUtgivare i informationsunderlaget). Komplement till CapabilityStatement.publisher (string).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen API-specifikation](StructureDefinition-tk-api-specification-capability.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-capabilitystatement-responsible-organization)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen Reference: Strukturerad referens till organisationen som ansvarar för en TKAPISpecificationCapability (API-specifikation.ansvarigUtgivare i informationsunderlaget). Komplement till CapabilityStatement.publisher (string).

 **DifferentialvyDifferential View** 

 **Ögonblicksbildsvy** 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen Reference: Strukturerad referens till organisationen som ansvarar för en TKAPISpecificationCapability (API-specifikation.ansvarigUtgivare i informationsunderlaget). Komplement till CapabilityStatement.publisher (string).

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-capabilitystatement-responsible-organization.csv), [Excel](../StructureDefinition-tk-capabilitystatement-responsible-organization.xlsx), [Schematron](../StructureDefinition-tk-capabilitystatement-responsible-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-capabilitystatement-responsible-organization",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-capabilitystatement-responsible-organization",
  "version" : "0.1.0",
  "name" : "TKCapabilityStatementResponsibleOrganization",
  "title" : "Ansvarig organisation (strukturerad referens)",
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
  "description" : "Strukturerad referens till organisationen som ansvarar för en TKAPISpecificationCapability (API-specifikation.ansvarigUtgivare i informationsunderlaget). Komplement till CapabilityStatement.publisher (string).",
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
      "short" : "Ansvarig organisation (strukturerad referens)",
      "definition" : "Strukturerad referens till organisationen som ansvarar för en TKAPISpecificationCapability (API-specifikation.ansvarigUtgivare i informationsunderlaget). Komplement till CapabilityStatement.publisher (string)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-capabilitystatement-responsible-organization"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
      }]
    }]
  }
}

```
