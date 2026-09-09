Instance: TKAPISpecificationCapabilityExample
InstanceOf: TKAPISpecificationCapability
Usage: #example
Title: "Exempel: API-specifikation i tjänstekatalogen"
Description: "Exempel på en interoperabilitetsspecifikation (en FHIR IG) registrerad i tjänstekatalogen."

* url = "https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation"
* status = #active
* name = "IneraPatientinformation"
* title = "Patientinformation (Inera FHIR IG)"
* version = "1.0.0"
* date = "2026-01-15"
* description = "Interoperabilitetsspecifikation för utbyte av patientinformation mellan vårdgivare."
* fhirVersion = #5.0.0
* format[0] = #json
* rest.mode = #server
* rest.documentation = "Se specifikationens egen IG för fullständiga REST-förmågor."
* extension[category].valueCodeableConcept.text = "FHIR"
* extension[sourceReference].valueUrl = "https://fhir.inera.se/ig/patientinformation/"
