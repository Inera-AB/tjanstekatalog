# Synkroniseringstjänst - Tjänstekatalogen v0.1.0

## ActorDefinition: Synkroniseringstjänst (Experimentell) 

 
System som läser organisationer och tekniska ändpunkter från tjänstekatalogens administrativa API (se [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.md)), särskilt vilka ändpunkter en organisation listar via [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md). Håller därefter E-hälsomyndighetens (EHM) nationella register — Swedish Medical Record Index And Endpoint Registry — synkroniserat genom att i EHM:s system anta rollen [Organization Endpoint Writer](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/) och anropa deras `$add-organization`/`$remove-organization`. Se "Mappning mot EHM:s Organization Endpoint Writer" i mappings.html för hur informationen mappas mellan de två gränssnitten. 



## Resource Content

```json
{
  "resourceType" : "ActorDefinition",
  "id" : "tk-synkroniseringstjanst",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-synkroniseringstjanst",
  "version" : "0.1.0",
  "name" : "TKSynkroniseringstjanst",
  "title" : "Synkroniseringstjänst",
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
  "description" : "System som läser organisationer och tekniska ändpunkter från tjänstekatalogens administrativa API (se [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html)), särskilt vilka ändpunkter en organisation listar via [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html). Håller därefter E-hälsomyndighetens (EHM) nationella register — Swedish Medical Record Index And Endpoint Registry — synkroniserat genom att i EHM:s system anta rollen [Organization Endpoint Writer](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/) och anropa deras `$add-organization`/`$remove-organization`. Se \"Mappning mot EHM:s Organization Endpoint Writer\" i mappings.html för hur informationen mappas mellan de två gränssnitten.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "type" : "system",
  "capabilities" : "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"
}

```
