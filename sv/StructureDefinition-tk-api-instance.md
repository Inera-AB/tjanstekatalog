# Tjänstekatalogen API-instans - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen API-instans 

 
Ett API som en teknisk ändpunkt tillgängliggör ("tillgängliggör"), och den eller de interoperabilitetsspecifikationer det följer ("följer"), som en egen resurs med egen identitet och egen giltighetsperiod — se [Kravkatalog](http://hl7.org/fhir/R5/requirements.html) REQ-MDL-3, REQ-MDL-6, REQ-MDL-7. 

**Användningar:**

* Referera till denna Profil: [Tjänstekatalogen Provenance](StructureDefinition-tk-provenance.md)
* Exempel för denna Profil: [CapabilityStatement/TKAPIInstanceExample](CapabilityStatement-TKAPIInstanceExample.md)
* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md) and [Tjänstekatalogen: sök-API (externt)](CapabilityStatement-tk-search-api.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-api-instance)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tabell med nyckelelement](#tabs-key) 
*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Terminologibindningar

#### Begränsningar

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 6 elements
 Måste stödjas: 8 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

**Extensions**

Denna struktur refererar till dessa extensions:

* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint](StructureDefinition-tk-api-instance-endpoint.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period](StructureDefinition-tk-api-instance-period.md)

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 6 elements
 Måste stödjas: 8 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

**Extensions**

Denna struktur refererar till dessa extensions:

* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint](StructureDefinition-tk-api-instance-endpoint.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period](StructureDefinition-tk-api-instance-period.md)

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-api-instance.csv), [Excel](../StructureDefinition-tk-api-instance.xlsx), [Schematron](../StructureDefinition-tk-api-instance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-api-instance",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
    "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance",
  "identifier" : [{
    "value" : "TKAPIInstance"
  }],
  "version" : "0.1.0",
  "name" : "TKAPIInstance",
  "title" : "Tjänstekatalogen API-instans",
  "status" : "draft",
  "date" : "2026-09-09",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Ett API som en teknisk ändpunkt tillgängliggör (\"tillgängliggör\"), och den\neller de interoperabilitetsspecifikationer det följer (\"följer\"), som en\negen resurs med egen identitet och egen giltighetsperiod — se\n[Kravkatalog](requirements.html) REQ-MDL-3, REQ-MDL-6, REQ-MDL-7.",
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
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "objimpl",
    "uri" : "http://hl7.org/fhir/object-implementation",
    "name" : "Object Implementation Information"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "CapabilityStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CapabilityStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "CapabilityStatement",
      "path" : "CapabilityStatement"
    },
    {
      "id" : "CapabilityStatement.extension",
      "path" : "CapabilityStatement.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "CapabilityStatement.extension:endpoint",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "endpoint",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-endpoint"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-7"
      }]
    },
    {
      "id" : "CapabilityStatement.extension:period",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "period",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance-period"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-6"
      }]
    },
    {
      "id" : "CapabilityStatement.kind",
      "path" : "CapabilityStatement.kind",
      "short" : "Alltid instance — detta är en körande API-instans, inte en abstrakt kravbild",
      "patternCode" : "instance"
    },
    {
      "id" : "CapabilityStatement.instantiates",
      "path" : "CapabilityStatement.instantiates",
      "short" : "Den/de API-specifikationer denna instans följer (\"följer\")",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-7"
      }]
    },
    {
      "id" : "CapabilityStatement.implementation",
      "path" : "CapabilityStatement.implementation",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-7"
      }]
    },
    {
      "id" : "CapabilityStatement.implementation.description",
      "path" : "CapabilityStatement.implementation.description",
      "short" : "Fritextbeskrivning av denna API-instans",
      "mustSupport" : true
    },
    {
      "id" : "CapabilityStatement.implementation.url",
      "path" : "CapabilityStatement.implementation.url",
      "short" : "Teknisk anropsadress (samma värde som TKEndpoint.address)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "CapabilityStatement.implementation.custodian",
      "path" : "CapabilityStatement.implementation.custodian",
      "short" : "Ansvarig organisation för denna API-instans, om annan än ändpunktens förvaltande organisation",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CapabilityStatement.rest",
      "path" : "CapabilityStatement.rest",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "CapabilityStatement.rest.mode",
      "path" : "CapabilityStatement.rest.mode",
      "patternCode" : "server"
    }]
  }
}

```
