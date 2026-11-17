Instance: TKProvenanceExample
InstanceOf: TKProvenance
Usage: #example
Title: "Exempel: spårbarhetspost för registrering"
Description: "Exempel på en Provenance-post som spårar registreringen av Exempelregionens organisation och ändpunkt, skickad i samma transaction-Bundle. Användaren anges med HSA-id från Inera IdP och organisationen i `onBehalfOf` (REQ-TRC-3)."

* target[0] = Reference(TKOrganizationExample)
* target[+] = Reference(TKEndpointExample)
* recorded = "2026-01-01T09:00:00Z"
* agent[0].who.identifier.system = $hsaid
* agent[0].who.identifier.value = "SE2321000016-A1B2"
* agent[0].who.display = "Exempeladministratör"
* agent[0].onBehalfOf = Reference(TKOrganizationExample)
