// Starter code system/value set for the "säkerhetsmetod" (security method)
// attribute on the Ändpunkt (Endpoint) entity of the attached logical model.
// The source model does not define a controlled vocabulary for this
// attribute — this is our own proposal, kept as an *example* binding
// (non-normative) until a value set owner and governance process is agreed.
// See requirements.html (REQ-END-6) and mappings.html.

CodeSystem: TKEndpointSecurityMethodCS
Id: tk-endpoint-security-method
Title: "Säkerhetsmetoder för tekniska ändpunkter (kodsystem)"
Description: "Kodsystem som anger vilken säkerhetsmetod som skyddar en teknisk ändpunkt (Ändpunkt.säkerhetsmetod i informationsunderlaget). Preliminärt förslag, se REQ-END-6 i kravkatalogen."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #oauth2-client-credentials "OAuth 2.0 client credentials" "Klientautentisering enligt OAuth 2.0 client credentials grant."
* #oauth2-authorization-code "OAuth 2.0 authorization code" "Användarautentisering enligt OAuth 2.0 authorization code grant, t.ex. via SITHS eller Freja eID."
* #mutual-tls "Ömsesidig TLS (mTLS)" "Klientcertifikatbaserad autentisering (mutual TLS) utan separat auktorisationsserver."
* #saml2 "SAML 2.0" "Federerad autentisering enligt SAML 2.0."
* #none "Ingen" "Ändpunkten kräver ingen ytterligare säkerhetsmetod utöver transportsäkerhet (TLS)."

ValueSet: TKEndpointSecurityMethodVS
Id: tk-endpoint-security-method
Title: "Säkerhetsmetoder för tekniska ändpunkter"
Description: "Tillåtna värden för Ändpunkt.säkerhetsmetod. Exempelbindning (example) i detta utkast — se REQ-END-6."
* ^status = #draft
* ^experimental = true
* include codes from system TKEndpointSecurityMethodCS
