# Exempel: teknisk ändpunkt i tjänstekatalogen - Tjänstekatalogen v0.1.0

## Exempel Endpoint: Exempel: teknisk ändpunkt i tjänstekatalogen

Profil: [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)

Exempelregionens patientinformations-API (HL7 FHIR): https://api.exempelregionen.se/patientinformation/fhir

-------

| | | | |
| :--- | :--- | :--- | :--- |
| Status: | Active | Giltig period: | 2026-01-01 --> (pågående) |
| Address: | [https://api.exempelregionen.se/patientinformation/fhir](https://api.exempelregionen.se/patientinformation/fhir) | | |
| Connection Type: | HL7 FHIR | | |
| Payload: | * Payload Type: Any
 | | |
| Managed By: | [Exempelregionen (urn:oid:1.2.752.29.4.19#SE2321000016-1003)](Organization-TKOrganizationExample.md) | | |
| [Säkerhetsmetod](StructureDefinition-tk-endpoint-security-method.md) | OAuth 2.0 client credentials | | |
| [URL till auktorisationsserver](StructureDefinition-tk-endpoint-authorization-server-url.md) | [https://auth.exempelregionen.se/oauth2/token](https://auth.exempelregionen.se/oauth2/token) | | |



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
  "identifier" : [{
    "system" : "http://electronichealth.se/fhir/NDI/Endpoint",
    "value" : "625aac66-a744-472c-8496-417fce2ada44"
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
      "valueCanonical" : "https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation|1.0.0"
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
