# Tjänstekatalogen API-specifikation - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen API-specifikation 

 
Metadata om en interoperabilitetsspecifikation (t.ex. en FHIR IG, ett RIVTA-tjänstekontrakt eller en OpenAPI/REST-beskrivning) som en [TKAPIInstance](StructureDefinition-tk-api-instance.md) kan referera via `.instantiates` ("följer"). `CapabilityStatement.url` är specifikationens egen kanoniska/maskinläsbara identitet — samma värde som [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.md) på `Endpoint.payload` refererar för snabb sökbarhet. Se [Kravkatalog](http://hl7.org/fhir/R5/requirements.html) REQ-MDL-4. 

**Användningar:**

* Referera till denna Profil: [Tjänstekatalogen Provenance](StructureDefinition-tk-provenance.md)
* Exempel för denna Profil: [IneraPatientinformation](CapabilityStatement-TKAPISpecificationCapabilityExample.md)
* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md) and [Tjänstekatalogen: sök-API (externt)](CapabilityStatement-tk-search-api.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-api-specification-capability)

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

Obligatorisk: 3 elements
 Måste stödjas: 12 elements

**Extensions**

Denna struktur refererar till dessa extensions:

* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-category](StructureDefinition-tk-api-specification-category.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-source-reference](StructureDefinition-tk-api-specification-source-reference.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-capabilitystatement-responsible-organization](StructureDefinition-tk-capabilitystatement-responsible-organization.md)

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 3 elements
 Måste stödjas: 12 elements

**Extensions**

Denna struktur refererar till dessa extensions:

* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-category](StructureDefinition-tk-api-specification-category.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-source-reference](StructureDefinition-tk-api-specification-source-reference.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-capabilitystatement-responsible-organization](StructureDefinition-tk-capabilitystatement-responsible-organization.md)

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-api-specification-capability.csv), [Excel](../StructureDefinition-tk-api-specification-capability.xlsx), [Schematron](../StructureDefinition-tk-api-specification-capability.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-api-specification-capability",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
    "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability",
  "identifier" : [{
    "value" : "TKAPISpecificationCapability"
  }],
  "version" : "0.1.0",
  "name" : "TKAPISpecificationCapability",
  "title" : "Tjänstekatalogen API-specifikation",
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
  "description" : "Metadata om en interoperabilitetsspecifikation (t.ex. en FHIR IG, ett\nRIVTA-tjänstekontrakt eller en OpenAPI/REST-beskrivning) som en\n[TKAPIInstance](StructureDefinition-tk-api-instance.html) kan referera via\n`.instantiates` (\"följer\"). `CapabilityStatement.url` är specifikationens\negen kanoniska/maskinläsbara identitet — samma värde som\n[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html)\npå `Endpoint.payload` refererar för snabb sökbarhet. Se\n[Kravkatalog](requirements.html) REQ-MDL-4.",
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
      }
    },
    {
      "id" : "CapabilityStatement.extension:category",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "category",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-category"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.extension:sourceReference",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "sourceReference",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-source-reference"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.extension:responsibleOrganization",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "responsibleOrganization",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-capabilitystatement-responsible-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.url",
      "path" : "CapabilityStatement.url",
      "short" : "Specifikationens kanoniska URL",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4, REQ-SRCH-3"
      }]
    },
    {
      "id" : "CapabilityStatement.version",
      "path" : "CapabilityStatement.version",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.name",
      "path" : "CapabilityStatement.name",
      "short" : "Maskinläsbart namn",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.title",
      "path" : "CapabilityStatement.title",
      "short" : "Människoläsbar titel",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.status",
      "path" : "CapabilityStatement.status",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.date",
      "path" : "CapabilityStatement.date",
      "short" : "Datum då denna version av specifikationen gavs ut",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.description",
      "path" : "CapabilityStatement.description",
      "short" : "Fritextbeskrivning av specifikationen",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-4"
      }]
    },
    {
      "id" : "CapabilityStatement.kind",
      "path" : "CapabilityStatement.kind",
      "short" : "Alltid requirements — detta är en specifikations kravbild, inte en körande instans",
      "patternCode" : "requirements"
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
    },
    {
      "id" : "CapabilityStatement.rest.documentation",
      "path" : "CapabilityStatement.rest.documentation",
      "short" : "Fritext, t.ex. hänvisning till specifikationens egen IG/dokumentation för fullständiga REST-förmågor",
      "mustSupport" : true
    }]
  }
}

```
