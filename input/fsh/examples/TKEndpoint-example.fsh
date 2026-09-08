Instance: TKEndpointExample
InstanceOf: TKEndpoint
Usage: #example
Title: "Exempel: teknisk ändpunkt i tjänstekatalogen"
Description: "Exempel på en teknisk ändpunkt som förvaltas av en organisation, tillgängliggör ett FHIR-API och skyddas med OAuth 2.0 client credentials."

* status = #active
* name = "Exempelregionens patientinformations-API"
* address = "https://api.exempelregionen.se/patientinformation/fhir"
* period.start = "2026-01-01"
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest "HL7 FHIR"
* managingOrganization = Reference(TKOrganizationExample)
* extension[securityMethod].valueCodeableConcept = TKEndpointSecurityMethodCS#oauth2-client-credentials
* extension[authorizationServerUrl].valueUrl = "https://auth.exempelregionen.se/oauth2/token"
* payload.type = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any "Any"
* payload.extension[supportedProfile][0].valueCanonical = "https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation"
