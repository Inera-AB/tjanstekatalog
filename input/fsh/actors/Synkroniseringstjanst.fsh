// The actor that consumes tjänstekatalogens administrative API. Distinct
// from — but the bridge to — E-hälsomyndighetens (EHM) own "Organization
// Endpoint Writer" actor: this system reads Organization/Endpoint data here,
// then separately assumes that role when calling EHM's API to keep EHM's
// national register in sync. See roles-and-responsibilities.html and
// "Mappning mot EHM:s Organization Endpoint Writer" in mappings.html.
//
// EHM's own actor (defined in their IG, not this one — referenced here by
// its real canonical URL, not redefined under this IG's namespace):
// http://electronichealth.se/fhir/NDI/ActorDefinition/organization-endpoint-writer-actor-er
// https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/
Instance: TKSynkroniseringstjanst
InstanceOf: ActorDefinition
Usage: #definition
Title: "Synkroniseringstjänst"
Description: "Aktör: System som läser organisationer och ändpunkter från tjänstekatalogens administrativa API och håller E-hälsomyndighetens nationella register synkroniserat genom att, i deras system, anta rollen Organization Endpoint Writer."

* id = "tk-synkroniseringstjanst"
* url = "https://fhir.inera.se/ig/tjanstekatalog/ActorDefinition/tk-synkroniseringstjanst"
* version = "0.1.0"
* name = "TKSynkroniseringstjanst"
* title = "Synkroniseringstjänst"
* status = #draft
* experimental = true
* date = "2026-09-08"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "System som läser organisationer och tekniska ändpunkter från tjänstekatalogens administrativa API (se [CapabilityStatement: administrativt API](CapabilityStatement-tk-admin-api.html)), särskilt vilka ändpunkter en organisation listar via [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html). Håller därefter E-hälsomyndighetens (EHM) nationella register — Swedish Medical Record Index And Endpoint Registry — synkroniserat genom att i EHM:s system anta rollen [Organization Endpoint Writer](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/) och anropa deras `$add-organization`/`$remove-organization`. Se \"Mappning mot EHM:s Organization Endpoint Writer\" i mappings.html för hur informationen mappas mellan de två gränssnitten."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* type = #system
* capabilities = "https://fhir.inera.se/ig/tjanstekatalog/CapabilityStatement/tk-admin-api"
