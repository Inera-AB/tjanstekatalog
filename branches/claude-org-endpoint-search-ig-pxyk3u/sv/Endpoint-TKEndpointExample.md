# Exempel: teknisk ändpunkt i tjänstekatalogen - Tjänstekatalogen v0.1.0

## Exempel Endpoint: Exempel: teknisk ändpunkt i tjänstekatalogen

Profil: [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)

**Säkerhetsmetod**: OAuth 2.0 client credentials

**URL till auktorisationsserver**: [https://auth.exempelregionen.se/oauth2/token](https://auth.exempelregionen.se/oauth2/token)

**status**: Active

**connectionType**: HL7 FHIR

**name**: Exempelregionens patientinformations-API

**managingOrganization**: [Organization Exempelregionen](Organization-TKOrganizationExample.md)

**period**: 2026-01-01 --> (pågående)

### Payloads

| | | |
| :--- | :--- | :--- |
| - | **Extension** | **Type** |
| * |  | Any |

**address**: [https://api.exempelregionen.se/patientinformation/fhir](https://api.exempelregionen.se/patientinformation/fhir)



## Resource Content

```json
{
  "resourceType" : "Endpoint",
  "id" : "TKEndpointExample",
  "meta" : {
    "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
  },
  "extension" : [{
    "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-endpoint-security-method",
        "code" : "oauth2-client-credentials"
      }]
    }
  },
  {
    "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url",
    "valueUrl" : "https://auth.exempelregionen.se/oauth2/token"
  }],
  "status" : "active",
  "connectionType" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/endpoint-connection-type",
      "code" : "hl7-fhir-rest",
      "display" : "HL7 FHIR"
    }]
  }],
  "name" : "Exempelregionens patientinformations-API",
  "managingOrganization" : {
    "reference" : "Organization/TKOrganizationExample"
  },
  "period" : {
    "start" : "2026-01-01"
  },
  "payload" : [{
    "extension" : [{
      "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile",
      "valueCanonical" : "https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation"
    }],
    "type" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/endpoint-payload-type",
        "code" : "any",
        "display" : "Any"
      }]
    }]
  }],
  "address" : "https://api.exempelregionen.se/patientinformation/fhir"
}

```
