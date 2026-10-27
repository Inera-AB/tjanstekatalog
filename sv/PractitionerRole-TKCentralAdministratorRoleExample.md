# Exempel: central administratör - Tjänstekatalogen v0.1.0

## Exempel PractitionerRole: Exempel: central administratör

Profil: [Tjänstekatalogen administratörsbehörighet](StructureDefinition-tk-administrator-role.md)

Central administratör, Inera: Central administratör

-------

| | | | |
| :--- | :--- | :--- | :--- |
| Aktiv: | true | Giltig period: | 2026-01-01 --> (pågående) |
| Practitioner: | Central administratör, Inera (Identifier:`urn:oid:1.2.752.29.4.19`/SE2321000016-ADM1) | | |
| Role: | Central administratör | | |



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "TKCentralAdministratorRoleExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-administrator-role"]
  },
  "active" : true,
  "period" : {
    "start" : "2026-01-01"
  },
  "practitioner" : {
    "identifier" : {
      "system" : "urn:oid:1.2.752.29.4.19",
      "value" : "SE2321000016-ADM1"
    },
    "display" : "Central administratör, Inera"
  },
  "code" : [{
    "coding" : [{
      "system" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-administrator-role",
      "code" : "central-admin",
      "display" : "Central administratör"
    }]
  }]
}

```
