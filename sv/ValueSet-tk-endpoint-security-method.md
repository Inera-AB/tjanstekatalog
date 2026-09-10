# Säkerhetsmetoder för tekniska ändpunkter - Tjänstekatalogen v0.1.0

## ValueSet: Säkerhetsmetoder för tekniska ändpunkter (Experimentell) 

 
Tillåtna värden för Ändpunkt.säkerhetsmetod. Exempelbindning (example) i detta utkast — se REQ-END-6. 

 **References** 

* [Säkerhetsmetod](StructureDefinition-tk-endpoint-security-method.md)

### Logisk definition (CLD)

 

### Expansion

-------

 [Beskrivning av ovanstående tabell(er)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "tk-endpoint-security-method",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/ValueSet/tk-endpoint-security-method",
  "version" : "0.1.0",
  "name" : "TKEndpointSecurityMethodVS",
  "title" : "Säkerhetsmetoder för tekniska ändpunkter",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-10T07:38:29+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Tillåtna värden för Ändpunkt.säkerhetsmetod. Exempelbindning (example) i detta utkast — se REQ-END-6.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://fhir.inera.se/ig/tjanstekatalog/CodeSystem/tk-endpoint-security-method"
    }]
  }
}

```
