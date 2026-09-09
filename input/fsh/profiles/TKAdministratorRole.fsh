// Not part of the original attached logical model (Indexpost, Organisation,
// Vård- och omsorgstagare, Ändpunkt, API, API-specifikation) — added per
// stakeholder decision: "Behörighet att administrera behöver hållas reda
// på, kanske via fhir-attribut, så som managingOrganization." This profile
// follows that steer directly: it tracks, per administrator, which single
// organization they represent via TKAdministratorRole.organization — the
// same single-Reference shape as TKEndpoint.managingOrganization — rather
// than inventing a bespoke authorization resource. An administrator who
// represents several organizations is expressed as several
// TKAdministratorRole instances (one per organization), the normal FHIR
// PractitionerRole pattern.
//
// "Central administratör" (see REQ-ADM-1/TKAdministratorRoleVS) represents
// ALL organizations, which cannot be expressed as a single Reference — for
// that role, .organization is deliberately left absent. This mirrors the
// absence-implies-something-broader convention already used elsewhere in
// this IG (e.g. TKEndpointSecurityMethod's "none").
//
// Scope: this profile lets the administrative API answer "who may
// administer entries for organization X", the authorization *decision*
// (e.g. enforcing that a write's organization matches one of the caller's
// TKAdministratorRole entries) is a server implementation concern, not
// specified further by this IG — see security.md.
Profile: TKAdministratorRole
Parent: PractitionerRole
Id: tk-administrator-role
Title: "Tjänstekatalogen administratörsbehörighet"
Description: """
Behörighet för en administratör att registrera/ändra poster i
tjänstekatalogen för en given organisation (`local-admin`), eller att
dessutom administrera andra administratörers behörigheter för samtliga
organisationer (`central-admin`, `organization` utelämnad). Se
[Roller och ansvar](roles-and-responsibilities.html) och
[Kravkatalog](requirements.html) REQ-ADM-*.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKAdministratorRole"
* ^date = "2026-09-08"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

// Administratörsbehörighetens id
* id MS
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-ADM-1"

// Vilken administrationsnivå behörigheten avser (local-admin/central-admin)
* code 1..1 MS
* code from TKAdministratorRoleVS (example)
* code ^short = "Administrationsnivå (local-admin/central-admin)"
* code ^mapping.identity = "req"
* code ^mapping.map = "REQ-ADM-1"

// Den organisation administratören representerar. Krävs för local-admin;
// utelämnas medvetet för central-admin (= samtliga organisationer).
* organization MS
* organization only Reference(TKOrganization)
* organization ^short = "Organisationen administratören representerar (utelämnad för central-admin = alla)"
* organization ^mapping.identity = "req"
* organization ^mapping.map = "REQ-ADM-2"

// Kontot/systemet som innehar behörigheten. Basresursens
// Reference(Practitioner) räcker för detta utkast — en egen profil för
// administrationskonton bedöms inte nödvändig i denna version.
* practitioner MS
* practitioner ^short = "Kontot/systemet som innehar behörigheten"
* practitioner ^mapping.identity = "req"
* practitioner ^mapping.map = "REQ-ADM-3"
