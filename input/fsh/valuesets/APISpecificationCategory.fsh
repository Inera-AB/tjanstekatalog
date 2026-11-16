// Kodsystem/värdemängd för attributet "kategori" på entiteten
// API-specifikation i informationsunderlaget. Informationsunderlaget anger
// exempelvärdena FHIR, REST/OpenAPI och SOAP/RIVTA men definierar inget
// kontrollerat kodverk — detta är vårt förslag. Bindningen är extensible så
// att nya specifikationstyper kan registreras utan en ny release av IG:n.
// Se requirements.html (REQ-MDL-4) och mappings.html.

CodeSystem: TKAPISpecificationCategoryCS
Id: tk-api-specification-category
Title: "Kategorier för API-specifikationer (kodsystem)"
Description: "Kodsystem som anger vilken typ av interoperabilitetsspecifikation en API-specifikation är (API-specifikation.kategori i informationsunderlaget). Preliminärt förslag."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #fhir "FHIR" "Specifikationen är en HL7 FHIR-specifikation, t.ex. en implementationsguide (IG)."
* #rest-openapi "REST/OpenAPI" "Specifikationen är ett REST-API beskrivet med OpenAPI."
* #soap-rivta "SOAP/RIVTA" "Specifikationen är ett SOAP-baserat tjänstekontrakt enligt RIVTA."

ValueSet: TKAPISpecificationCategoryVS
Id: tk-api-specification-category
Title: "Kategorier för API-specifikationer"
Description: "Värden för API-specifikation.kategori. Extensible-bindning: använd en kod härifrån när någon passar, annars får en annan kod eller text anges."
* ^status = #draft
* ^experimental = true
* include codes from system TKAPISpecificationCategoryCS
