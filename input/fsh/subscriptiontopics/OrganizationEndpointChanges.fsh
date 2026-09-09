// Not part of the original attached logical model — added per stakeholder
// decision to address distribution/federation to local catalogues using
// native FHIR mechanisms: R5 topic-based Subscription (this SubscriptionTopic)
// for event-driven distribution, plus standard _lastUpdated-range search
// (documented in rest-interactions.html, no new artefact needed) for initial/
// bulk load ("grundladdning") and resynchronisation. See REQ-DIST-* in
// requirements.html and "Distribution och synkronisering" in
// rest-interactions.html.
//
// Scope: this topic only announces THAT Organization/Endpoint changed, and
// which interaction occurred — clients fetch the current state via the
// administrative API afterwards. It does not itself solve avoiding
// update loops in a bidirectional federated setup (see the open question in
// mappings.html) — that requires an origin marker on the resource, which is
// tracked as an open question, not solved by this topic alone.
Instance: TKOrganizationEndpointChangesTopic
InstanceOf: SubscriptionTopic
Usage: #definition
Title: "Ändringar i Organisation/Ändpunkt (prenumerationsämne)"
Description: "SubscriptionTopic för händelsebaserad distribution av förändringar i Organization/Endpoint till lokala kataloger. Se REQ-DIST-1."

* id = "tk-organization-endpoint-changes"
* url = "https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes"
* version = "0.1.0"
* name = "TKOrganizationEndpointChangesTopic"
* title = "Ändringar i Organisation/Ändpunkt"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Prenumerationsämne (topic) för att låta lokala kataloger prenumerera på förändringar i Organization och Endpoint i tjänstekatalogen, som ett alternativ till periodisk pollning. Klienter skapar en `Subscription` som refererar detta ämnes url som `Subscription.topic`. Se \"Distribution och synkronisering\" i rest-interactions.html för grundladdning (`_lastUpdated`) och återsynk."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"

* resourceTrigger[0].resource = "http://hl7.org/fhir/StructureDefinition/Organization"
* resourceTrigger[=].description = "En organisation skapas, uppdateras eller tas bort."
* resourceTrigger[=].supportedInteraction[0] = #create
* resourceTrigger[=].supportedInteraction[+] = #update
* resourceTrigger[=].supportedInteraction[+] = #delete

* resourceTrigger[+].resource = "http://hl7.org/fhir/StructureDefinition/Endpoint"
* resourceTrigger[=].description = "En ändpunkt skapas, uppdateras eller tas bort."
* resourceTrigger[=].supportedInteraction[0] = #create
* resourceTrigger[=].supportedInteraction[+] = #update
* resourceTrigger[=].supportedInteraction[+] = #delete
