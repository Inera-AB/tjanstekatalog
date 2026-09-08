# Säkerhetsmetoder för tekniska ändpunkter (kodsystem) - Tjänstekatalogen v0.1.0

## CodeSystem: Säkerhetsmetoder för tekniska ändpunkter (kodsystem) (Experimentell) 

 
Kodsystem som anger vilken säkerhetsmetod som skyddar en teknisk ändpunkt (Ändpunkt.säkerhetsmetod i informationsunderlaget). Preliminärt förslag, se REQ-END-6 i kravkatalogen. 

Detta kodsystem refereras i definitionen av följande värdemängder:

* [Säkerhetsmetoder för tekniska ändpunkter](ValueSet-tk-endpoint-security-method.md)

-------

 [Beskrivning av ovanstående tabell(er)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tk-endpoint-security-method",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-endpoint-security-method",
  "version" : "0.1.0",
  "name" : "TKEndpointSecurityMethodCS",
  "title" : "Säkerhetsmetoder för tekniska ändpunkter (kodsystem)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-08T11:05:42+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Kodsystem som anger vilken säkerhetsmetod som skyddar en teknisk ändpunkt (Ändpunkt.säkerhetsmetod i informationsunderlaget). Preliminärt förslag, se REQ-END-6 i kravkatalogen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [{
    "code" : "oauth2-client-credentials",
    "display" : "OAuth 2.0 client credentials",
    "definition" : "Klientautentisering enligt OAuth 2.0 client credentials grant."
  },
  {
    "code" : "oauth2-authorization-code",
    "display" : "OAuth 2.0 authorization code",
    "definition" : "Användarautentisering enligt OAuth 2.0 authorization code grant, t.ex. via SITHS eller Freja eID."
  },
  {
    "code" : "mutual-tls",
    "display" : "Ömsesidig TLS (mTLS)",
    "definition" : "Klientcertifikatbaserad autentisering (mutual TLS) utan separat auktorisationsserver."
  },
  {
    "code" : "saml2",
    "display" : "SAML 2.0",
    "definition" : "Federerad autentisering enligt SAML 2.0."
  },
  {
    "code" : "none",
    "display" : "Ingen",
    "definition" : "Ändpunkten kräver ingen ytterligare säkerhetsmetod utöver transportsäkerhet (TLS)."
  }]
}

```
