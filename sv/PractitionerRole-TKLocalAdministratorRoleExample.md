# Exempel: lokal administratör - Tjänstekatalogen v0.1.0

## Exempel PractitionerRole: Exempel: lokal administratör

Profil: [Tjänstekatalogen administratörsbehörighet](StructureDefinition-tk-administrator-role.md)

Lokal administratör, Exempelregionen: Lokal administratör at Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)

-------

| | | | |
| :--- | :--- | :--- | :--- |
| Aktiv: | true | Giltig period: | 2026-01-02 --> (pågående) |
| Practitioner: | Lokal administratör, Exempelregionen (Identifier:`urn:oid:1.2.752.29.4.19`/SE2321000016-ADM2) | | |
| Organization: | [Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)](Organization-TKOrganizationExample.md) | | |
| Role: | Lokal administratör | | |



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "TKLocalAdministratorRoleExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"]
  },
  "active" : true,
  "period" : {
    "start" : "2026-01-02"
  },
  "practitioner" : {
    "identifier" : {
      "system" : "urn:oid:1.2.752.29.4.19",
      "value" : "SE2321000016-ADM2"
    },
    "display" : "Lokal administratör, Exempelregionen"
  },
  "organization" : {
    "reference" : "Organization/TKOrganizationExample"
  },
  "code" : [{
    "coding" : [{
      "system" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-administrator-role",
      "code" : "local-admin",
      "display" : "Lokal administratör"
    }]
  }]
}

```
