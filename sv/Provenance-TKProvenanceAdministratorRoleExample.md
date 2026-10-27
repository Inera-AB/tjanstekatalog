# Exempel: spårbarhetspost för ändrad administratörsbehörighet - Tjänstekatalogen v0.1.0

## Exempel Provenance: Exempel: spårbarhetspost för ändrad administratörsbehörighet

Profil: [Tjänstekatalogen Provenance](StructureDefinition-tk-provenance.md)

Härkomst för [Lokal administratör, Exempelregionen: Lokal administratör at Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)](PractitionerRole-TKLocalAdministratorRoleExample.md)

Sammanfattning

| | |
| :--- | :--- |
| Registrerad | 2026-01-02 10:00:00+0000 |

**Agenter**

* **vem**: [Central administratör, Inera: Central administratör](PractitionerRole-TKCentralAdministratorRoleExample.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "TKProvenanceAdministratorRoleExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"]
  },
  "target" : [{
    "reference" : "PractitionerRole/TKLocalAdministratorRoleExample"
  }],
  "recorded" : "2026-01-02T10:00:00Z",
  "agent" : [{
    "who" : {
      "reference" : "PractitionerRole/TKCentralAdministratorRoleExample"
    }
  }]
}

```
