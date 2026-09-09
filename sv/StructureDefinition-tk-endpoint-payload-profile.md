# Stödd specifikation (payload profile) - Tjänstekatalogen v0.1.0

## Extension: Stödd specifikation (payload profile) 

Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)
* Exempel för denna Extension: [Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-endpoint-payload-profile)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen canonical: Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner.

 **DifferentialvyDifferential View** 

 **Ögonblicksbildsvy** 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen canonical: Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner.

 

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
  "version" : "0.1.0",
  "name" : "TKEndpointPayloadProfile",
  "title" : "Stödd specifikation (payload profile)",
  "status" : "draft",
  "date" : "2026-09-09T11:47:00+00:00",
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
      "short" : "Kanonisk URL till den stödda interoperabilitetsspecifikationen",
      "min" : 1,
      "type" : [{
        "code" : "canonical"
      }]
    }]
  }
}

```
