# Tjänstekatalogen Organization - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen Organization 

**Användningar:**

* Referera till denna Profil: [Tjänstekatalogen administratörsbehörighet](StructureDefinition-tk-administrator-role.md), [Tjänstekatalogen API-instans](StructureDefinition-tk-api-instance.md), [Ansvarig organisation (strukturerad referens)](StructureDefinition-tk-capabilitystatement-responsible-organization.md), [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)... Show 3 more, [Indexpost (logisk modell)](StructureDefinition-tk-indexpost.md), [Tjänstekatalogen Organization](StructureDefinition-tk-organization.md) and [Tjänstekatalogen Provenance](StructureDefinition-tk-provenance.md)
* Exempel för denna Profil: [Exempelregionen](Organization-TKOrganizationExample.md) and [Exempelregionens vårdcentral](Organization-TKOrganizationUnitExample.md)
* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md) and [Tjänstekatalogen: sök-API (externt)](CapabilityStatement-tk-search-api.md)

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

Denna struktur är härledd från [Organization](http://hl7.org/fhir/R5/organization.html) 

#### Begränsningar

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [Organization](http://hl7.org/fhir/R5/organization.html) 

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

Denna struktur är härledd från [Organization](http://hl7.org/fhir/R5/organization.html) 

#### Begränsningar

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [Organization](http://hl7.org/fhir/R5/organization.html) 

 

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
      "short" : "Organisationsidentifierare (\"logisk adress\"): HSA-id (primär) och organisationsnummer",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:hsaId",
      "path" : "Organization.identifier",
      "sliceName" : "hsaId",
      "short" : "HSA-id (primär identifierare och logisk adress)",
      "definition" : "Organisationens HSA-id. Består av prefixet `SE`, organisationsnumret för den direktanslutna producenten i formatet tio siffror utan bindestreck, samt ett bindestreck och en efterföljande identifierande del. Organisationsnumret i HSA-id:t behöver inte vara organisationsnumret för den organisatoriska enhet som HSA-id:t identifierar. Värdet lagras, returneras och söks exakt som det är skrivet.",
      "min" : 1,
      "max" : "1",
      "constraint" : [{
        "key" : "tk-org-hsaid-format",
        "severity" : "error",
        "human" : "HSA-id består av SE, tio siffror (den direktanslutna producentens organisationsnummer utan bindestreck), ett bindestreck och en efterföljande identifierande del.",
        "expression" : "value.matches('^SE[0-9]{10}-.+$')",
        "source" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-6, REQ-ORG-7"
      }]
    },
    {
      "id" : "Organization.identifier:hsaId.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "urn:oid:1.2.752.29.4.19"
    },
    {
      "id" : "Organization.identifier:hsaId.value",
      "path" : "Organization.identifier.value",
      "short" : "HSA-id, t.ex. SE2321000016-1003",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:organisationsnummer",
      "path" : "Organization.identifier",
      "sliceName" : "organisationsnummer",
      "short" : "Organisationsnummer (anges bara på den juridiska personen)",
      "min" : 0,
      "max" : "1",
      "constraint" : [{
        "key" : "tk-org-orgnr-format",
        "severity" : "error",
        "human" : "Organisationsnummer anges som tio siffror utan bindestreck.",
        "expression" : "value.matches('^[0-9]{10}$')",
        "source" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-2, REQ-ORG-8, REQ-WRT-5"
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
      "short" : "Svenskt organisationsnummer, 10 siffror utan bindestreck (t.ex. 2321000016)",
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
      "id" : "Organization.partOf",
      "path" : "Organization.partOf",
      "short" : "Överordnad organisation, t.ex. vårdgivaren för en vårdenhet",
      "type" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy",
          "valueBoolean" : true
        }],
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-8"
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
