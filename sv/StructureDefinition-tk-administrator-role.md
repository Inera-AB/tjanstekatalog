# Tjänstekatalogen administratörsbehörighet - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen administratörsbehörighet 

 
Behörighet för en administratör att registrera/ändra poster i tjänstekatalogen för en given organisation (`local-admin`), eller att dessutom administrera andra administratörers behörigheter för samtliga organisationer (`central-admin`, `organization` utelämnad). Se [Roller och ansvar](roles-and-responsibilities.md) och [Kravkatalog](http://hl7.org/fhir/R5/requirements.html) REQ-ADM-*. 

**Användningar:**

* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md)
* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-administrator-role)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tabell med nyckelelement](#tabs-key) 
*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Terminologibindningar

#### Begränsningar

#### Terminologibindningar (differential)

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 1 element
 Måste stödjas: 4 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

#### Terminologibindningar (differential)

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 1 element
 Måste stödjas: 4 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-administrator-role.csv), [Excel](../StructureDefinition-tk-administrator-role.xlsx), [Schematron](../StructureDefinition-tk-administrator-role.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-administrator-role",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role",
  "identifier" : [{
    "value" : "TKAdministratorRole"
  }],
  "version" : "0.1.0",
  "name" : "TKAdministratorRole",
  "title" : "Tjänstekatalogen administratörsbehörighet",
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
  "description" : "Behörighet för en administratör att registrera/ändra poster i\ntjänstekatalogen för en given organisation (`local-admin`), eller att\ndessutom administrera andra administratörers behörigheter för samtliga\norganisationer (`central-admin`, `organization` utelämnad). Se\n[Roller och ansvar](roles-and-responsibilities.html) och\n[Kravkatalog](requirements.html) REQ-ADM-*.",
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
  "type" : "PractitionerRole",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "PractitionerRole",
      "path" : "PractitionerRole"
    },
    {
      "id" : "PractitionerRole.id",
      "path" : "PractitionerRole.id",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ADM-1"
      }]
    },
    {
      "id" : "PractitionerRole.practitioner",
      "path" : "PractitionerRole.practitioner",
      "short" : "Kontot/systemet som innehar behörigheten",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ADM-3"
      }]
    },
    {
      "id" : "PractitionerRole.organization",
      "path" : "PractitionerRole.organization",
      "short" : "Organisationen administratören representerar (utelämnad för central-admin = alla)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ADM-2"
      }]
    },
    {
      "id" : "PractitionerRole.code",
      "path" : "PractitionerRole.code",
      "short" : "Administrationsnivå (local-admin/central-admin)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://fhir.inera.se/ig/tjanstekatalog/ValueSet/tk-administrator-role"
      },
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ADM-1"
      }]
    }]
  }
}

```
