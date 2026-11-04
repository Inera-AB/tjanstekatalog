# HSA-id - Tjänstekatalogen v0.1.0

## NamingSystem: HSA-id 



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "hsa-id",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/NamingSystem/hsa-id",
  "version" : "0.1.0",
  "name" : "TKHsaIdNamingSystem",
  "title" : "HSA-id",
  "status" : "active",
  "kind" : "identifier",
  "date" : "2026-11-04",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "responsible" : "Inera AB",
  "description" : "Identifierarsystemet för HSA-id, den primära organisationsidentifieraren i tjänstekatalogen (REQ-ORG-6). Formatet följer HSA:s styrande dokument: 1–31 tecken ur a–z, A–Z, 0–9 och bindestreck.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "usage" : "Används i TKOrganization.identifier (slicen hsaId) och för administratörer i TKAdministratorRole.practitioner.",
  "uniqueId" : [{
    "type" : "uri",
    "value" : "urn:oid:1.2.752.29.4.19",
    "preferred" : true
  },
  {
    "type" : "oid",
    "value" : "1.2.752.29.4.19"
  }]
}

```
