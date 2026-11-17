# Tjänstekatalogen OperationOutcome - Tjänstekatalogen v0.2.0

## Resursprofil: Tjänstekatalogen OperationOutcome 

**Användningar:**

* Exempel för denna Profil: [OperationOutcome/TKOperationOutcomeExample](OperationOutcome-TKOperationOutcomeExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/resource/inera.infra.tjanstekatalog|current/StructureDefinition/StructureDefinition-tk-operation-outcome.json)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tabell med nyckelelement](#tabs-key) 
*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [OperationOutcome](http://hl7.org/fhir/R5/operationoutcome.html) 

#### Begränsningar

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [OperationOutcome](http://hl7.org/fhir/R5/operationoutcome.html) 

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

Denna struktur är härledd från [OperationOutcome](http://hl7.org/fhir/R5/operationoutcome.html) 

#### Begränsningar

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [OperationOutcome](http://hl7.org/fhir/R5/operationoutcome.html) 

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-operation-outcome.csv), [Excel](../StructureDefinition-tk-operation-outcome.xlsx), [Schematron](../StructureDefinition-tk-operation-outcome.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-operation-outcome",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-operation-outcome",
  "identifier" : [{
    "value" : "TKOperationOutcome"
  }],
  "version" : "0.2.0",
  "name" : "TKOperationOutcome",
  "title" : "Tjänstekatalogen OperationOutcome",
  "status" : "draft",
  "date" : "2026-11-17",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Felsvar från tjänstekatalogens API:er. Varje `issue` bär anropets\nkorrelations-id i standardextensionen\n[operationoutcome-instance-id](http://hl7.org/fhir/extensions/StructureDefinition-operationoutcome-instance-id.html),\nmed anropets `traceparent` enligt [W3C Trace Context](https://www.w3.org/TR/trace-context/)\nsom värde. Se [Felhantering](error-handling.html) och REQ-ERR-1.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "OperationOutcome",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/OperationOutcome",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "OperationOutcome",
      "path" : "OperationOutcome"
    },
    {
      "id" : "OperationOutcome.issue",
      "path" : "OperationOutcome.issue",
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.issue.extension",
      "path" : "OperationOutcome.issue.extension",
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
      "id" : "OperationOutcome.issue.extension:correlationId",
      "path" : "OperationOutcome.issue.extension",
      "sliceName" : "correlationId",
      "short" : "Korrelations-id: anropets traceparent (W3C Trace Context)",
      "definition" : "Anropets korrelations-id, i form av anropets traceparent enligt W3C Trace Context (version-trace-id-parent-id-flaggor). Samma värde returneras i svarshuvudet traceparent och används för att hitta anropet i serverns loggar vid ett supportärende.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/operationoutcome-instance-id"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ERR-1"
      }]
    },
    {
      "id" : "OperationOutcome.issue.extension:correlationId.value[x]",
      "path" : "OperationOutcome.issue.extension.value[x]",
      "constraint" : [{
        "key" : "tk-traceparent-format",
        "severity" : "error",
        "human" : "Värdet ska ha formatet för traceparent enligt W3C Trace Context: version, trace-id, parent-id och flaggor, med gemena hexadecimala tecken.",
        "expression" : "matches('^[0-9a-f]{2}-[0-9a-f]{32}-[0-9a-f]{16}-[0-9a-f]{2}$')",
        "source" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-operation-outcome"
      }]
    },
    {
      "id" : "OperationOutcome.issue.severity",
      "path" : "OperationOutcome.issue.severity",
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.issue.code",
      "path" : "OperationOutcome.issue.code",
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.issue.diagnostics",
      "path" : "OperationOutcome.issue.diagnostics",
      "short" : "Läsbar beskrivning av felet",
      "mustSupport" : true
    }]
  }
}

```
