# Exempel: spårbarhetspost för registrering - Tjänstekatalogen v0.1.0

## Exempel Provenance: Exempel: spårbarhetspost för registrering

Profil: [Tjänstekatalogen Provenance](StructureDefinition-tk-provenance.md)

Härkomst för: 

* [Organization Exempelregionen](Organization-TKOrganizationExample.md)
* [Endpoint Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)

Sammanfattning

| | |
| :--- | :--- |
| Registrerad | 2026-01-01 09:00:00+0000 |

**Agenter**

* **vem**: [Organization Exempelregionen](Organization-TKOrganizationExample.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "TKProvenanceExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-provenance"]
  },
  "target" : [{
    "reference" : "Organization/TKOrganizationExample"
  },
  {
    "reference" : "Endpoint/TKEndpointExample"
  }],
  "recorded" : "2026-01-01T09:00:00Z",
  "agent" : [{
    "who" : {
      "reference" : "Organization/TKOrganizationExample"
    }
  }]
}

```
