# Exempel: underliggande enhet i tjänstekatalogen - Tjänstekatalogen v0.1.0

## Exempel Organization: Exempel: underliggande enhet i tjänstekatalogen

Profil: [Tjänstekatalogen Organization](StructureDefinition-tk-organization.md)

Exempelregionens vårdcentral (urn:oid:1.2.752.29.4.19#SE2321000016-2001)

-------

| | |
| :--- | :--- |
| Part Of: | [Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)](Organization-TKOrganizationExample.md) |



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "TKOrganizationUnitExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:1.2.752.29.4.19",
    "value" : "SE2321000016-2001"
  }],
  "name" : "Exempelregionens vårdcentral",
  "partOf" : {
    "reference" : "Organization/TKOrganizationExample"
  }
}

```
