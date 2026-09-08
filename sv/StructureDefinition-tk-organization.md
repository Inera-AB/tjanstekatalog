# Tjänstekatalogen Organization - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen Organization 

 
Organisation i tjänstekatalogen. `Organization.endpoint` bär "har"-relationen — de ändpunkter organisationen listar i sin katalogpost, oavsett vem som förvaltar dem tekniskt. Sök efter dessa ändpunkter med [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md) på Endpoint, med organisationens id/referens som värde. Den separata "förvaltar"-relationen (vem som tekniskt driftar en given ändpunkt) uttrycks istället av [TKEndpoint](StructureDefinition-tk-endpoint.md)s `managingOrganization`, sökbar med standardparametern `organization`. 

**Användningar:**

* Referera till denna Profil: [API-specifikation (logisk modell)](StructureDefinition-tk-api-specification.md), [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md) and [Indexpost (logisk modell)](StructureDefinition-tk-indexpost.md)
* Exempel för denna Profil: [Exempelregionen](Organization-TKOrganizationExample.md)
* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-organization)

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

Obligatorisk: 1 element(2 nästlade obligatoriska elements)
 Måste stödjas: 6 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Endpoint (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint)](StructureDefinition-tk-endpoint.md)

**Skivor**

Denna struktur definierar följande [skivor](http://hl7.org/fhir/R5/profiling.html#slices):

* Elementet 1 är uppdelat baserat på värdet av Organization.identifier

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 1 element(2 nästlade obligatoriska elements)
 Måste stödjas: 6 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Endpoint (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint)](StructureDefinition-tk-endpoint.md)

**Skivor**

Denna struktur definierar följande [skivor](http://hl7.org/fhir/R5/profiling.html#slices):

* Elementet 1 är uppdelat baserat på värdet av Organization.identifier

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-organization.csv), [Excel](../StructureDefinition-tk-organization.xlsx), [Schematron](../StructureDefinition-tk-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-organization",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
  "identifier" : [{
    "value" : "TKOrganization"
  }],
  "version" : "0.1.0",
  "name" : "TKOrganization",
  "title" : "Tjänstekatalogen Organization",
  "status" : "draft",
  "date" : "2026-09-08",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Organisation i tjänstekatalogen. `Organization.endpoint` bär \"har\"-relationen\n— de ändpunkter organisationen listar i sin katalogpost, oavsett vem som\nförvaltar dem tekniskt. Sök efter dessa ändpunkter med\n[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) på\nEndpoint, med organisationens id/referens som värde. Den separata\n\"förvaltar\"-relationen (vem som tekniskt driftar en given ändpunkt) uttrycks\nistället av [TKEndpoint](StructureDefinition-tk-endpoint.html)s\n`managingOrganization`, sökbar med standardparametern `organization`.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "interface",
    "uri" : "http://hl7.org/fhir/interface",
    "name" : "Interface Pattern"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization"
    },
    {
      "id" : "Organization.id",
      "path" : "Organization.id",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-1"
      }]
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "short" : "Organisationsidentifierare, inklusive organisationsnummer",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:organisationsnummer",
      "path" : "Organization.identifier",
      "sliceName" : "organisationsnummer",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-2"
      }]
    },
    {
      "id" : "Organization.identifier:organisationsnummer.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "urn:oid:2.5.4.97"
    },
    {
      "id" : "Organization.identifier:organisationsnummer.value",
      "path" : "Organization.identifier.value",
      "short" : "Svenskt organisationsnummer",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "short" : "Organisationens namn",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-1"
      }]
    },
    {
      "id" : "Organization.endpoint",
      "path" : "Organization.endpoint",
      "short" : "Ändpunkter organisationen listar i tjänstekatalogen (\"har\")",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-3, REQ-SRCH-1"
      }]
    }]
  }
}

```
