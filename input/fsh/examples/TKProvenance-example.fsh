Instance: TKProvenanceExample
InstanceOf: TKProvenance
Usage: #example
Title: "Exempel: spårbarhetspost för registrering"
Description: "Exempel på en Provenance-post som spårar registreringen av Exempelregionens organisation och ändpunkt, skickad i samma transaction-Bundle."

* target[0] = Reference(TKOrganizationExample)
* target[+] = Reference(TKEndpointExample)
* recorded = "2026-01-01T09:00:00Z"
* agent[0].who = Reference(TKOrganizationExample)

Instance: TKProvenanceAdministratorRoleExample
InstanceOf: TKProvenance
Usage: #example
Title: "Exempel: spårbarhetspost för ändrad administratörsbehörighet"
Description: "Exempel på en Provenance-post som visar att den centrala administratören gav Exempelregionens lokala administratör sin behörighet. `agent.who` är den ändrande administratörens egen behörighet (REQ-TRC-3)."

* target[0] = Reference(TKLocalAdministratorRoleExample)
* recorded = "2026-01-02T10:00:00Z"
* agent[0].who = Reference(TKCentralAdministratorRoleExample)
