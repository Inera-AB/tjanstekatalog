// Starter code system/value set for the administrator role attribute on
// TKAdministratorRole. Not part of the original attached logical model —
// added per stakeholder decision to track catalogue-administration
// authorization using a FHIR attribute (TKAdministratorRole.organization),
// mirroring the existing managingOrganization pattern on TKEndpoint. See
// requirements.html (REQ-ADM-*) and mappings.html.
//
// Two levels, matching the pre-study "Förstudie T2 Tjänstekatalog":
// - local-admin: may register/change entries for the organization(s) it
//   represents (TKAdministratorRole.organization present, one instance per
//   represented organization).
// - central-admin: may additionally administer other administrators'
//   authorizations, for all organizations (TKAdministratorRole.organization
//   deliberately absent — see TKAdministratorRole.fsh for why absence means
//   "all", the same absence-implies-something-broader convention already
//   used elsewhere in this IG, e.g. the "none" security method).

CodeSystem: TKAdministratorRoleCS
Id: tk-administrator-role
Title: "Administratörsroller (kodsystem)"
Description: "Kodsystem för vilken behörighetsnivå en administratör av tjänstekatalogens innehåll har. Preliminärt förslag, se REQ-ADM-1 i kravkatalogen."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #local-admin "Lokal administratör" "Får registrera och ändra poster för den eller de organisationer administratören representerar (TKAdministratorRole.organization)."
* #central-admin "Central administratör" "Får utöver lokal administratörs rättigheter även administrera andra administratörers behörigheter, för samtliga organisationer (TKAdministratorRole.organization utelämnas medvetet — se profilen)."

ValueSet: TKAdministratorRoleVS
Id: tk-administrator-role
Title: "Administratörsroller"
Description: "Tillåtna värden för TKAdministratorRole.code. Exempelbindning (example) i detta utkast — se REQ-ADM-1."
* ^status = #draft
* ^experimental = true
* include codes from system TKAdministratorRoleCS
