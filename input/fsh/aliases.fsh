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
// urn:oid:2.5.4.97 is the identifier system E-hälsomyndigheten's Organization
// Endpoint Writer API requires for organisationsnummer (confirmed from their
// published OperationDefinition documentation for $add-organization /
// $remove-organization, see mappings.html). Adopting the same system here
// (rather than guessing at a different OID) means Organization.identifier
// values need no system translation when mapped to EHM's API — only the
// value's hyphen needs stripping, see mappings.html. This was changed from
// an earlier, unverified guess (urn:oid:1.2.752.29.4.13) once EHM's real
// requirement was confirmed. Still worth Inera separately confirming this is
// also Inera's own preferred canonical system for organisationsnummer, since
// it is adopted here for EHM-compatibility rather than from an Inera-internal
// OID/URI registry. Tracked as REQ-ORG-2 in the requirements catalog.
Alias: $organisationsnummer = urn:oid:2.5.4.97
