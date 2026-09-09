# Administratörsroller - Tjänstekatalogen v0.1.0

## ValueSet: Administratörsroller (Experimentell) 

 
Tillåtna värden för TKAdministratorRole.code. Exempelbindning (example) i detta utkast — se REQ-ADM-1. 

 **References** 

* [Tjänstekatalogen administratörsbehörighet](StructureDefinition-tk-administrator-role.md)

### Logisk definition (CLD)

 

### Expansion

-------

 [Beskrivning av ovanstående tabell(er)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "tk-administrator-role",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/ValueSet/tk-administrator-role",
  "version" : "0.1.0",
  "name" : "TKAdministratorRoleVS",
  "title" : "Administratörsroller",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-09T11:47:00+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Tillåtna värden för TKAdministratorRole.code. Exempelbindning (example) i detta utkast — se REQ-ADM-1.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-administrator-role"
    }]
  }
}

```
