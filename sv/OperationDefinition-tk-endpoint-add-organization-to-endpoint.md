# Add Organization To Endpoint - Tjänstekatalogen v0.1.0

## OperationDefinition: Add Organization To Endpoint (Experimentell) 

 
Lägger till en referens till denna Endpoint i den angivna organisationens `Organization.endpoint`-lista ("har"-relationen i informationsunderlaget). Ändrar inte `Endpoint.managingOrganization` ("förvaltar"). Stöds av aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.md), konformansnivå MAY. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tk-endpoint-add-organization-to-endpoint",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-add-organization-to-endpoint",
  "version" : "0.1.0",
  "name" : "TKEndpointAddOrganizationToEndpoint",
  "title" : "Add Organization To Endpoint",
  "status" : "draft",
  "kind" : "operation",
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
  "description" : "Lägger till en referens till denna Endpoint i den angivna organisationens `Organization.endpoint`-lista (\"har\"-relationen i informationsunderlaget). Ändrar inte `Endpoint.managingOrganization` (\"förvaltar\"). Stöds av aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html), konformansnivå MAY.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "code" : "add-organization-to-endpoint",
  "comment" : "Konformansnivå MAY, se CapabilityStatement-tk-organization-endpoint-writer.html.",
  "resource" : ["Endpoint"],
  "system" : false,
  "type" : true,
  "instance" : true,
  "parameter" : [{
    "name" : "organization",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Referens till den organisation som ska lista denna ändpunkt via Organization.endpoint.",
    "type" : "Reference",
    "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "name" : "organization",
    "use" : "out",
    "min" : 0,
    "max" : "1",
    "documentation" : "Den uppdaterade Organization-resursen, med den angivna Endpoint tillagd i Organization.endpoint. Servrar som svarar utan resurskropp (t.ex. 200 utan body, eller 204) behöver inte populera denna out-parameter; se expected-responses.html.",
    "type" : "Organization",
    "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  }]
}

```
