# Exempel: organisation i tjänstekatalogen - Tjänstekatalogen v0.1.0

## Exempel Organization: Exempel: organisation i tjänstekatalogen

Profil: [Tjänstekatalogen Organization](StructureDefinition-tk-organization.md)

**identifier**: `urn:oid:2.5.4.97`/232100-0016

**name**: Exempelregionen

**endpoint**: [Endpoint Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "TKOrganizationExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.5.4.97",
    "value" : "232100-0016"
  }],
  "name" : "Exempelregionen",
  "endpoint" : [{
    "reference" : "Endpoint/TKEndpointExample"
  }]
}

```
