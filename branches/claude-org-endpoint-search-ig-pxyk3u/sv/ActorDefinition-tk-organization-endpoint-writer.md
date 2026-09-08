# Organization Endpoint Writer - Tjänstekatalogen v0.1.0

## ActorDefinition: Organization Endpoint Writer (Experimentell) 

 
System som tillhandahåller information om organisationers tekniska ändpunkter till tjänstekatalogen, inklusive vilka ändpunkter en organisation listar ("har"). Realiseras tekniskt av [CapabilityStatement: Organization Endpoint Writer Capabilities](CapabilityStatement-tk-organization-endpoint-writer.md). 



## Resource Content

```json
{
  "resourceType" : "ActorDefinition",
  "id" : "tk-organization-endpoint-writer",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-organization-endpoint-writer",
  "version" : "0.1.0",
  "name" : "TKOrganizationEndpointWriter",
  "title" : "Organization Endpoint Writer",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-08",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "System som tillhandahåller information om organisationers tekniska ändpunkter till tjänstekatalogen, inklusive vilka ändpunkter en organisation listar (\"har\"). Realiseras tekniskt av [CapabilityStatement: Organization Endpoint Writer Capabilities](CapabilityStatement-tk-organization-endpoint-writer.html).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "type" : "system",
  "capabilities" : "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-organization-endpoint-writer"
}

```
