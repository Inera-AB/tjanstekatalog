// Not part of the original attached logical model — added per stakeholder
// decision, informed by a comparison against another team's implementation
// of the same problem: registration (create/update of TKOrganization,
// TKEndpoint, the CapabilityStatement profiles and TKAdministratorRole)
// SHALL be traceable via a mandatory Provenance entry, replacing
// the earlier "deferred to a future version" stance on REQ-MDL-5. See
// REQ-TRC-1/2 and "Avvikelser och tillägg" in mappings.html.
Profile: TKProvenance
Parent: Provenance
Id: tk-provenance
Title: "Tjänstekatalogen Provenance"
Description: """
Spårbarhetspost för en registrering (skapande/uppdatering) av en eller flera
resurser i tjänstekatalogen, inklusive administratörsbehörigheter
([TKAdministratorRole](StructureDefinition-tk-administrator-role.html)) —
vanligen skickad tillsammans med den/de
registrerade resurserna i samma transaction-Bundle. Se
[Kravkatalog](requirements.html) REQ-TRC-1/2 och "Distribution och
synkronisering"/registrering i rest-interactions.html.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKProvenance"
* ^date = "2026-09-09"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

// Den/de resurser som registrerades (t.ex. TKOrganization, TKEndpoint,
// TKAPIInstance, TKAPISpecificationCapability, TKAdministratorRole) i samma
// transaction-Bundle.
* target 1..* MS
* target only Reference(TKOrganization or TKEndpoint or TKAPIInstance or TKAPISpecificationCapability or TKAdministratorRole)
* target ^short = "Den/de resurser som registrerades"
* target ^mapping.identity = "req"
* target ^mapping.map = "REQ-TRC-1"

// När registreringen skedde.
* recorded 1..1 MS
* recorded ^mapping.identity = "req"
* recorded ^mapping.map = "REQ-TRC-1"

// Vem/vilket system som utförde registreringen. Vid ändring av en
// administratörsbehörighet BÖR det vara den ändrande administratörens egen
// TKAdministratorRole, så att det framgår med vilken behörighet (REQ-TRC-3).
* agent 1..* MS
* agent.who 1..1 MS
* agent ^short = "Vem/vilket system som utförde registreringen"
* agent ^mapping.identity = "req"
* agent ^mapping.map = "REQ-TRC-1, REQ-TRC-3"
