# Tjänstekatalogen Provenance - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen Provenance 

**Användningar:**

* Exempel för denna Profil: [Provenance/TKProvenanceExample](Provenance-TKProvenanceExample.md)
* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.infra.tjanstekatalog|current/StructureDefinition/tk-provenance)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tabell med nyckelelement](#tabs-key) 
*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

Denna struktur är härledd från [Provenance](http://hl7.org/fhir/R5/provenance.html) 

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [Provenance](http://hl7.org/fhir/R5/provenance.html) 

 **Vy med nyckelelement** 

#### Begränsningar

 **Differentialvy** 

Denna struktur är härledd från [Provenance](http://hl7.org/fhir/R5/provenance.html) 

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

Denna struktur är härledd från [Provenance](http://hl7.org/fhir/R5/provenance.html) 

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-provenance.csv), [Excel](../StructureDefinition-tk-provenance.xlsx), [Schematron](../StructureDefinition-tk-provenance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-provenance",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance",
  "identifier" : [{
    "value" : "TKProvenance"
  }],
  "version" : "0.1.0",
  "name" : "TKProvenance",
  "title" : "Tjänstekatalogen Provenance",
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
  "description" : "Spårbarhetspost för en registrering (skapande/uppdatering) av en eller flera\nresurser i tjänstekatalogen — vanligen skickad tillsammans med den/de\nregistrerade resurserna i samma transaction-Bundle. Se\n[Kravkatalog](requirements.html) REQ-TRC-1/2 och \"Distribution och\nsynkronisering\"/registrering i rest-interactions.html.",
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
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
    "identity" : "w3c.prov",
    "uri" : "http://www.w3.org/ns/prov",
    "name" : "W3C PROV"
  },
  {
    "identity" : "fhirauditevent",
    "uri" : "http://hl7.org/fhir/auditevent",
    "name" : "FHIR AuditEvent Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Provenance",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Provenance",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Provenance",
      "path" : "Provenance"
    },
    {
      "id" : "Provenance.target",
      "path" : "Provenance.target",
      "short" : "Den/de resurser som registrerades",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization",
        "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
        "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-instance",
        "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-api-specification-capability"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-TRC-1"
      }]
    },
    {
      "id" : "Provenance.recorded",
      "path" : "Provenance.recorded",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-TRC-1"
      }]
    },
    {
      "id" : "Provenance.agent",
      "path" : "Provenance.agent",
      "short" : "Vem/vilket system som utförde registreringen",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-TRC-1"
      }]
    },
    {
      "id" : "Provenance.agent.who",
      "path" : "Provenance.agent.who",
      "mustSupport" : true
    }]
  }
}

```
