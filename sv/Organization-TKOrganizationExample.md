# Exempel: organisation i tjänstekatalogen - Tjänstekatalogen v0.1.0

## Exempel Organization: Exempel: organisation i tjänstekatalogen

Profil: [Tjänstekatalogen Organization](StructureDefinition-tk-organization.md)

Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)

-------

| | |
| :--- | :--- |
| Annat id: | `urn:oid:2.5.4.97`/2321000016 |
| Endpoint: | [Exempelregionens patientinformations-API (HL7 FHIR): https://api.exempelregionen.se/patientinformation/fhir](Endpoint-TKEndpointExample.md) |



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "TKOrganizationExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:1.2.752.29.4.19",
    "value" : "SE2321000016-1003"
  },
  {
    "system" : "urn:oid:2.5.4.97",
    "value" : "2321000016"
  }],
  "name" : "Exempelregionen",
  "endpoint" : [{
    "reference" : "Endpoint/TKEndpointExample"
  }]
}

```
