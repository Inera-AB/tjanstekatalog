# Stödd specifikation (payload profile) - Tjänstekatalogen v0.2.0

## Extension: Stödd specifikation (payload profile) 

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)
* Exempel för denna Extension: [Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)
* Sökparametrar som använder denna Extension: [Endpoint: implements](SearchParameter-tk-endpoint-implements.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/resource/inera.infra.tjanstekatalog|current/StructureDefinition/StructureDefinition-tk-endpoint-payload-profile.json)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

Denna struktur är härledd från [Extension](http://hl7.org/fhir/R5/extensibility.html#Extension) 

#### Begränsningar

#### Begränsningar

Denna struktur är härledd från [Extension](http://hl7.org/fhir/R5/extensibility.html#Extension) 

 **Differentialvy** 

Denna struktur är härledd från [Extension](http://hl7.org/fhir/R5/extensibility.html#Extension) 

#### Begränsningar

 **Ögonblicksbildsvy** 

#### Begränsningar

Denna struktur är härledd från [Extension](http://hl7.org/fhir/R5/extensibility.html#Extension) 

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-endpoint-payload-profile.csv), [Excel](../StructureDefinition-tk-endpoint-payload-profile.xlsx), [Schematron](../StructureDefinition-tk-endpoint-payload-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-endpoint-payload-profile",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile",
  "version" : "0.2.0",
  "name" : "TKEndpointPayloadProfile",
  "title" : "Stödd specifikation (payload profile)",
  "status" : "draft",
  "date" : "2026-11-17T13:36:46+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner.",
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
    "expression" : "Endpoint.payload"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Stödd specifikation (payload profile)",
      "definition" : "Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Kanonisk URL med version (url|version) till den stödda interoperabilitetsspecifikationen, se REQ-MDL-9",
      "min" : 1,
      "type" : [{
        "code" : "canonical"
      }],
      "constraint" : [{
        "key" : "tk-canonical-versioned",
        "severity" : "error",
        "human" : "Referensen till API-specifikationen anger version: url|version, t.ex. https://example.org/spec|1.0.0.",
        "expression" : "matches('^[^|]+[|][^|]+$')",
        "source" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"
      }]
    }]
  }
}

```
