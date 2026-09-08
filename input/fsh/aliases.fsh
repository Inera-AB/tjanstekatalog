// External code systems
Alias: $SCT = http://snomed.info/sct
Alias: $LOINC = http://loinc.org
Alias: $ICD10SE = http://hl7.org/fhir/sid/icd-10
Alias: $v3-NullFlavor = http://terminology.hl7.org/CodeSystem/v3-NullFlavor

// Swedish identifiers
Alias: $personnummer = http://electronichealth.se/identifier/personnummer
Alias: $samordningsnummer = http://electronichealth.se/identifier/samordningsnummer

// FHIR extensions
Alias: $patient-birthPlace = http://hl7.org/fhir/StructureDefinition/patient-birthPlace
Alias: $capabilitystatement-expectation = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

// Swedish organisation identifiers
// ASSUMPTION — not yet verified against Inera's authoritative OID/URI registry.
// Confirm this system URI (and whether Inera prefers an https:// identifier
// system over the legacy urn:oid: form) before implementation. Tracked as
// REQ-ORG-2 in the requirements catalog (see requirements.html).
Alias: $organisationsnummer = urn:oid:1.2.752.29.4.13
