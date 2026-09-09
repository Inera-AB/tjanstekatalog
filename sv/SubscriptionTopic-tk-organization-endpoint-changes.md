# Ändringar i Organisation/Ändpunkt (prenumerationsämne) - Tjänstekatalogen v0.1.0

## SubscriptionTopic: Ändringar i Organisation/Ändpunkt (prenumerationsämne) (Experimentell) 

 
Prenumerationsämne (topic) för att låta lokala kataloger prenumerera på förändringar i Organization och Endpoint i tjänstekatalogen, som ett alternativ till periodisk pollning. Klienter skapar en `Subscription` som refererar detta ämnes url som `Subscription.topic`. Se "Distribution och synkronisering" i rest-interactions.html för grundladdning (`_lastUpdated`) och återsynk. 



## Resource Content

```json
{
  "resourceType" : "SubscriptionTopic",
  "id" : "tk-organization-endpoint-changes",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes",
  "version" : "0.1.0",
  "name" : "TKOrganizationEndpointChangesTopic",
  "title" : "Ändringar i Organisation/Ändpunkt",
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
  "description" : "Prenumerationsämne (topic) för att låta lokala kataloger prenumerera på förändringar i Organization och Endpoint i tjänstekatalogen, som ett alternativ till periodisk pollning. Klienter skapar en `Subscription` som refererar detta ämnes url som `Subscription.topic`. Se \"Distribution och synkronisering\" i rest-interactions.html för grundladdning (`_lastUpdated`) och återsynk.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "resourceTrigger" : [{
    "description" : "En organisation skapas, uppdateras eller tas bort.",
    "resource" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "supportedInteraction" : ["create", "update", "delete"]
  },
  {
    "description" : "En ändpunkt skapas, uppdateras eller tas bort.",
    "resource" : "http://hl7.org/fhir/StructureDefinition/Endpoint",
    "supportedInteraction" : ["create", "update", "delete"]
  }]
}

```
