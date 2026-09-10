// Extensions supporting TKAPISpecificationCapability and TKAPIInstance
// (CapabilityStatementExtensions.fsh) — see mappings.html and
// requirements.html (REQ-MDL-4, REQ-MDL-6, REQ-MDL-7). Not part of the
// original attached logical model's FHIR realisation; added when
// API-specifikation and API (the join entity) were upgraded from
// deferred/logical-model-only to real, REST-exposed CapabilityStatement
// profiles.

// --- API-specifikation.kategori ---
Extension: TKAPISpecificationCategory
Id: tk-api-specification-category
Title: "Specifikationskategori"
Description: "Typ av specifikation, t.ex. FHIR, REST/OpenAPI, SOAP/RIVTA-tjänstekontrakt (API-specifikation.kategori i informationsunderlaget). Basresursen CapabilityStatement saknar ett eget element för klassificering av detta slag."
Context: CapabilityStatement
* value[x] only CodeableConcept
* valueCodeableConcept 1..1

// --- API-specifikation.referensTillKälla ---
Extension: TKAPISpecificationSourceReference
Id: tk-api-specification-source-reference
Title: "Referens till källa"
Description: "Länk till specifikationens källa/publiceringsplats (t.ex. dokumentation eller repository), skild från den kanoniska maskinidentiteten CapabilityStatement.url (API-specifikation.referensTillKälla i informationsunderlaget)."
Context: CapabilityStatement
* value[x] only url
* valueUrl 1..1

// --- API-specifikation.ansvarigUtgivare ---
// CapabilityStatement.publisher är string, inte Reference — samma
// begränsning som redan dokumenterats för ImplementationGuide.publisher i
// mappings.html. Denna extension bär en strukturerad referens när den
// behövs, som komplement till (inte ersättning för) .publisher.
Extension: TKCapabilityStatementResponsibleOrganization
Id: tk-capabilitystatement-responsible-organization
Title: "Ansvarig organisation (strukturerad referens)"
Description: "Strukturerad referens till organisationen som ansvarar för en TKAPISpecificationCapability (API-specifikation.ansvarigUtgivare i informationsunderlaget). Komplement till CapabilityStatement.publisher (string)."
Context: CapabilityStatement
* value[x] only Reference(TKOrganization)
* valueReference 1..1

// --- API.giltigFrom / giltigTom (TKAPIInstance) ---
// Basresursen CapabilityStatement har inget giltighetsperiod-element.
// Denna extension ger "API" (TKAPIInstance) den egna, oberoende
// giltighetsperiod informationsunderlaget beskriver — se avsteget som
// tidigare dokumenterades i mappings.html (giltigFrom/giltigTom "ej
// separat realiserat"), nu löst.
Extension: TKAPIInstancePeriod
Id: tk-api-instance-period
Title: "API-instansens giltighetsperiod"
Description: "API-instansens (TKAPIInstance) egen giltighetsperiod, oberoende av den ändpunkt som tillgängliggör den (API.giltigFrom/giltigTom i informationsunderlaget)."
Context: CapabilityStatement
* value[x] only Period
* valuePeriod 1..1

// --- API.tillgängliggörs av Ändpunkt (TKAPIInstance → TKEndpoint) ---
Extension: TKAPIInstanceEndpoint
Id: tk-api-instance-endpoint
Title: "Tillgängliggörande ändpunkt"
Description: "Den ändpunkt (TKEndpoint) som tillgängliggör denna API-instans (\"tillgängliggör\"). Basresursen CapabilityStatement har inget element för detta."
Context: CapabilityStatement
* value[x] only Reference(TKEndpoint)
* valueReference 1..1
