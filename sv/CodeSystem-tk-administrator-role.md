# Administratörsroller (kodsystem) - Tjänstekatalogen v0.1.0

## CodeSystem: Administratörsroller (kodsystem) (Experimentell) 

 
Kodsystem för vilken behörighetsnivå en administratör av tjänstekatalogens innehåll har. Preliminärt förslag, se REQ-ADM-1 i kravkatalogen. 

Detta kodsystem refereras i definitionen av följande värdemängder:

* [Administratörsroller](ValueSet-tk-administrator-role.md)

-------

 [Beskrivning av ovanstående tabell(er)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tk-administrator-role",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-administrator-role",
  "version" : "0.1.0",
  "name" : "TKAdministratorRoleCS",
  "title" : "Administratörsroller (kodsystem)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-10T07:38:29+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Kodsystem för vilken behörighetsnivå en administratör av tjänstekatalogens innehåll har. Preliminärt förslag, se REQ-ADM-1 i kravkatalogen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "local-admin",
    "display" : "Lokal administratör",
    "definition" : "Får registrera och ändra poster för den eller de organisationer administratören representerar (TKAdministratorRole.organization)."
  },
  {
    "code" : "central-admin",
    "display" : "Central administratör",
    "definition" : "Får utöver lokal administratörs rättigheter även administrera andra administratörers behörigheter, för samtliga organisationer (TKAdministratorRole.organization utelämnas medvetet — se profilen)."
  }]
}

```
