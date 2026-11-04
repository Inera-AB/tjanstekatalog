# Organisationsnummer - Tjänstekatalogen v0.1.0

## NamingSystem: Organisationsnummer 



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "organisationsnummer",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/NamingSystem/organisationsnummer",
  "version" : "0.1.0",
  "name" : "TKOrganisationsnummerNamingSystem",
  "title" : "Organisationsnummer",
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
  "description" : "Identifierarsystemet för svenska organisationsnummer som tjänstekatalogen använder (REQ-ORG-2): samma system som E-hälsomyndighetens Organization Endpoint Writer kräver. Värdet anges som tio siffror utan bindestreck.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "usage" : "Används i TKOrganization.identifier (slicen organisationsnummer), bara på den juridiska personen (REQ-ORG-8).",
  "uniqueId" : [{
    "type" : "uri",
    "value" : "urn:oid:2.5.4.97",
    "preferred" : true
  },
  {
    "type" : "oid",
    "value" : "2.5.4.97"
  }]
}

```
