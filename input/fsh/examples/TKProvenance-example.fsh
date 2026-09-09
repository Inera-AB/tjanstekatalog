Instance: TKProvenanceExample
InstanceOf: TKProvenance
Usage: #example
Title: "Exempel: spårbarhetspost för registrering"
Description: "Exempel på en Provenance-post som spårar registreringen av Exempelregionens organisation och ändpunkt, skickad i samma transaction-Bundle."

* target[0] = Reference(TKOrganizationExample)
* target[+] = Reference(TKEndpointExample)
* recorded = "2026-01-01T09:00:00Z"
* agent[0].who = Reference(TKOrganizationExample)
