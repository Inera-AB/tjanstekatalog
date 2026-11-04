// Identifier systems used in TKOrganization.identifier (REQ-ORG-2, REQ-ORG-6)
// and TKAdministratorRole.practitioner. Defining them here lets the
// validator resolve the system URLs instead of warning that they have no
// definition, and documents both systems in the IG. Both carry the system as
// a URI (what instances use) and as a bare OID.

Instance: TKHsaIdNamingSystem
InstanceOf: NamingSystem
Usage: #definition
Title: "HSA-id"
Description: "Identifierarsystemet för HSA-id, den primära organisationsidentifieraren i tjänstekatalogen (REQ-ORG-6). Formatet följer HSA:s styrande dokument: 1–31 tecken ur a–z, A–Z, 0–9 och bindestreck."

* id = "hsa-id"
* url = "https://fhir.inera.se/ig/tjanstekatalog/NamingSystem/hsa-id"
* name = "TKHsaIdNamingSystem"
* title = "HSA-id"
* status = #active
* kind = #identifier
* date = "2026-11-04"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* responsible = "Inera AB"
* description = "Identifierarsystemet för HSA-id, den primära organisationsidentifieraren i tjänstekatalogen (REQ-ORG-6). Formatet följer HSA:s styrande dokument: 1–31 tecken ur a–z, A–Z, 0–9 och bindestreck."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* usage = "Används i TKOrganization.identifier (slicen hsaId) och för administratörer i TKAdministratorRole.practitioner."
* uniqueId[0].type = #uri
* uniqueId[=].value = "urn:oid:1.2.752.29.4.19"
* uniqueId[=].preferred = true
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.752.29.4.19"

Instance: TKOrganisationsnummerNamingSystem
InstanceOf: NamingSystem
Usage: #definition
Title: "Organisationsnummer"
Description: "Identifierarsystemet för svenska organisationsnummer som tjänstekatalogen använder (REQ-ORG-2): samma system som E-hälsomyndighetens Organization Endpoint Writer kräver. Värdet anges som tio siffror utan bindestreck."

* id = "organisationsnummer"
* url = "https://fhir.inera.se/ig/tjanstekatalog/NamingSystem/organisationsnummer"
* name = "TKOrganisationsnummerNamingSystem"
* title = "Organisationsnummer"
* status = #active
* kind = #identifier
* date = "2026-11-04"
* publisher = "Inera AB"
* contact.name = "Inera AB"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.inera.se"
* description = "Identifierarsystemet för svenska organisationsnummer som tjänstekatalogen använder (REQ-ORG-2): samma system som E-hälsomyndighetens Organization Endpoint Writer kräver. Värdet anges som tio siffror utan bindestreck."
* jurisdiction = urn:iso:std:iso:3166#SE "Sweden"
* usage = "Används i TKOrganization.identifier (slicen organisationsnummer), bara på den juridiska personen (REQ-ORG-8)."
* uniqueId[0].type = #uri
* uniqueId[=].value = "urn:oid:2.5.4.97"
* uniqueId[=].preferred = true
* uniqueId[+].type = #oid
* uniqueId[=].value = "2.5.4.97"
