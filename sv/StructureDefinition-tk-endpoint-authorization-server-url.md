# URL till auktorisationsserver - Tjänstekatalogen v0.1.0

## Extension: URL till auktorisationsserver 

URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [Tjänstekatalogen Endpoint](StructureDefinition-tk-endpoint.md)
* Exempel för denna Extension: [Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-endpoint-authorization-server-url)

### Formella vyer av extensioninnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen url: URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod.

 **DifferentialvyDifferential View** 

 **Ögonblicksbildsvy** 

#### Begränsningar

** Sammanfattning **

Enkel extension med typen url: URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod.

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-endpoint-authorization-server-url.csv), [Excel](../StructureDefinition-tk-endpoint-authorization-server-url.xlsx), [Schematron](../StructureDefinition-tk-endpoint-authorization-server-url.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-endpoint-authorization-server-url",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url",
  "version" : "0.1.0",
  "name" : "TKEndpointAuthorizationServerUrl",
  "title" : "URL till auktorisationsserver",
  "status" : "draft",
  "date" : "2026-09-10T07:38:29+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Endpoint"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "URL till auktorisationsserver",
      "definition" : "URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "url"
      }]
    }]
  }
}

```
