// Realises the "Ändpunkt" entity from the attached logical model.
// See mappings.html for the full element-by-element mapping table and
// requirements.html for the requirements each element satisfies (traced via
// the "req" mapping below, resolved against the Requirements resource
// tk-tjanstekatalog-requirements).
Profile: TKEndpoint
Parent: Endpoint
Id: tk-endpoint
Title: "Tjänstekatalogen Endpoint"
Description: """
Teknisk ändpunkt i tjänstekatalogen. Realiserar entiteten Ändpunkt i det
bifogade informationsunderlaget: `Endpoint.address` bär ändpunktens URL,
`Endpoint.managingOrganization` bär "förvaltar"-relationen till den
förvaltande organisationen, och `Endpoint.payload` (tillsammans med
[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html))
bär "tillgängliggör"/"följer"-relationerna till de API:er och
interoperabilitetsspecifikationer som ändpunkten stödjer. Sök efter
ändpunkter som en organisation *listar* (Organization.endpoint, "har") med
[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html); sök
efter ändpunkter en organisation *förvaltar* med standardparametern
`organization`.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^identifier.value = "TKEndpoint"
* ^date = "2026-09-08"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* ^mapping.identity = "req"
* ^mapping.uri = "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements"
* ^mapping.name = "Kravkatalog"

// Ändpunkt.id
* id MS
* id ^mapping.identity = "req"
* id ^mapping.map = "REQ-END-1"

// Ändpunkt.status
* status MS
* status ^mapping.identity = "req"
* status ^mapping.map = "REQ-END-2"

// Ändpunkt.namn
* name 1..1 MS
* name ^short = "Ändpunktens namn"
* name ^mapping.identity = "req"
* name ^mapping.map = "REQ-END-3"

// Ändpunkt.adress — ändpunktens URL. Kärnkravet i denna IG (se REQ-SRCH-2).
* address 1..1 MS
* address ^short = "Ändpunktens URL"
* address ^mapping.identity = "req"
* address ^mapping.map = "REQ-END-4, REQ-SRCH-2"

// Ändpunkt.giltigFrom / giltigTom
* period MS
* period.start MS
* period.end MS
* period ^mapping.identity = "req"
* period ^mapping.map = "REQ-END-5"

// Ändpunkt.protokoll
* connectionType 1..* MS
* connectionType ^short = "Protokoll som ändpunkten stödjer"
* connectionType ^mapping.identity = "req"
* connectionType ^mapping.map = "REQ-END-8"

// "förvaltar": den förvaltande organisationen. Sök med standardparametern
// `organization` (Endpoint-organization) — se REQ-ORG-4.
* managingOrganization 1..1 MS
* managingOrganization only Reference(TKOrganization)
* managingOrganization ^short = "Förvaltande organisation (\"förvaltar\")"
* managingOrganization ^mapping.identity = "req"
* managingOrganization ^mapping.map = "REQ-ORG-4"

// säkerhetsmetod (extension, se EndpointExtensions.fsh)
* extension contains TKEndpointSecurityMethod named securityMethod 0..1 MS
* extension[securityMethod] ^mapping.identity = "req"
* extension[securityMethod] ^mapping.map = "REQ-END-6"

// urlTillAuktorisationsserver (extension, se EndpointExtensions.fsh)
* extension contains TKEndpointAuthorizationServerUrl named authorizationServerUrl 0..1 MS
* extension[authorizationServerUrl] ^mapping.identity = "req"
* extension[authorizationServerUrl] ^mapping.map = "REQ-END-7"

// "tillgängliggör" API / "följer" API-specifikation: varje payload
// representerar ett API som ändpunkten tillgängliggör; TKEndpointPayloadProfile
// namnger den/de interoperabilitetsspecifikation(er) (API-specifikation) som
// API:et följer. Se "Avvikelser och tillägg" i mappings.html för varför
// "API" inte realiseras som en egen resurs/logisk modell.
* payload MS
* payload.type 1..1 MS
* payload.type ^short = "Vilket API/vilken typ av innehåll som tillgängliggörs"
* payload.type ^mapping.identity = "req"
* payload.type ^mapping.map = "REQ-MDL-3"
* payload.extension contains TKEndpointPayloadProfile named supportedProfile 0..* MS
* payload.extension[supportedProfile] ^mapping.identity = "req"
* payload.extension[supportedProfile] ^mapping.map = "REQ-SRCH-3, REQ-MDL-3"

// Inte en del av det ursprungliga informationsunderlaget: en extra
// identifierarslice som bär E-hälsomyndighetens (EHM) eget logiska id för
// samma ändpunkt i deras register ("Swedish Medical Record Index And
// Endpoint Registry"). Krävs för att en Synkroniseringstjänst ska kunna
// anropa EHM:s $add-organization/$remove-organization, som adresserar
// Endpoint via EHM:s eget id, inte vårt (se REQ-WRT-4 och "Mappning mot
// EHM:s Organization Endpoint Writer" i mappings.html). `.system` nedan
// följer mönstret i EHM:s övriga kanoniska URL:er
// (http://electronichealth.se/fhir/NDI/<Resurstyp>) men är ett ANTAGANDE —
// EHM:s faktiska bas-URL för sin FHIR-server är inte bekräftad.
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Ändpunktsidentifierare, inklusive EHM:s motsvarande id"
* identifier contains ehmEndpointId 0..1 MS
* identifier[ehmEndpointId].system 1..1
* identifier[ehmEndpointId].system = "http://electronichealth.se/fhir/NDI/Endpoint"
* identifier[ehmEndpointId].value 1..1 MS
* identifier[ehmEndpointId].value ^short = "EHM:s logiska id (UUID) för samma ändpunkt i deras register"
* identifier[ehmEndpointId] ^mapping.identity = "req"
* identifier[ehmEndpointId] ^mapping.map = "REQ-WRT-4"
