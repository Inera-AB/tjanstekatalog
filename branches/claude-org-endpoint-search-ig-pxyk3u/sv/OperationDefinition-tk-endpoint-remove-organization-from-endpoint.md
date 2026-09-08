# Remove Organization From Endpoint - Tjänstekatalogen v0.1.0

## OperationDefinition: Remove Organization From Endpoint (Experimentell) 

 
Tar bort referensen till denna Endpoint från den angivna organisationens `Organization.endpoint`-lista ("har"-relationen i informationsunderlaget). Ändrar inte `Endpoint.managingOrganization` ("förvaltar"). Stöds av aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.md), konformansnivå MAY. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tk-endpoint-remove-organization-from-endpoint",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/OperationDefinition/tk-endpoint-remove-organization-from-endpoint",
  "version" : "0.1.0",
  "name" : "TKEndpointRemoveOrganizationFromEndpoint",
  "title" : "Remove Organization From Endpoint",
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
  "description" : "Tar bort referensen till denna Endpoint från den angivna organisationens `Organization.endpoint`-lista (\"har\"-relationen i informationsunderlaget). Ändrar inte `Endpoint.managingOrganization` (\"förvaltar\"). Stöds av aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html), konformansnivå MAY.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "code" : "remove-organization-from-endpoint",
  "comment" : "Konformansnivå MAY, se CapabilityStatement-tk-organization-endpoint-writer.html. Att ta bort en organisation som inte finns i listan SKA vara idempotent (dvs. inte ge fel).",
  "resource" : ["Endpoint"],
  "system" : false,
  "type" : true,
  "instance" : true,
  "parameter" : [{
    "name" : "organization",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Referens till den organisation som inte längre ska lista denna ändpunkt via Organization.endpoint.",
    "type" : "Reference",
    "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  },
  {
    "name" : "organization",
    "use" : "out",
    "min" : 0,
    "max" : "1",
    "documentation" : "Den uppdaterade Organization-resursen, utan den angivna Endpoint i Organization.endpoint. Servrar som svarar utan resurskropp (t.ex. 200 utan body, eller 204) behöver inte populera denna out-parameter; se expected-responses.html.",
    "type" : "Organization",
    "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
  }]
}

```
