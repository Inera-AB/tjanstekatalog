Instance: TKAPIInstanceExample
InstanceOf: TKAPIInstance
Usage: #example
Title: "Exempel: API-instans i tjänstekatalogen"
Description: "Exempel på ett API som Exempelregionens ändpunkt tillgängliggör, och som följer specifikationen IneraPatientinformation."

* status = #active
* date = "2026-01-15"
* kind = #instance
* instantiates[0] = "https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation"
* fhirVersion = #5.0.0
* format[0] = #json
* rest.mode = #server
* implementation.description = "Exempelregionens patientinformations-API"
* implementation.url = "https://api.exempelregionen.se/patientinformation/fhir"
* implementation.custodian = Reference(TKOrganizationExample)
* extension[endpoint].valueReference = Reference(TKEndpointExample)
* extension[period].valuePeriod.start = "2026-01-01"
