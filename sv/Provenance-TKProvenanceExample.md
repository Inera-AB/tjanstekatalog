# Exempel: spårbarhetspost för registrering - Tjänstekatalogen v0.1.0

## Exempel Provenance: Exempel: spårbarhetspost för registrering

Profil: [Tjänstekatalogen Provenance](StructureDefinition-tk-provenance.md)

Härkomst för: 

* [Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)](Organization-TKOrganizationExample.md)
* [Exempelregionens patientinformations-API (HL7 FHIR): https://api.exempelregionen.se/patientinformation/fhir](Endpoint-TKEndpointExample.md)

Sammanfattning

| | |
| :--- | :--- |
| Registrerad | 2026-01-01 09:00:00+0000 |

**Agenter**

* **vem**: [Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)](Organization-TKOrganizationExample.md)



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
