# Tjänstekatalogen Endpoint - Tjänstekatalogen v0.1.0

## Resursprofil: Tjänstekatalogen Endpoint 

 
Teknisk ändpunkt i tjänstekatalogen. Realiserar entiteten Ändpunkt i det bifogade informationsunderlaget: `Endpoint.address` bär ändpunktens URL, `Endpoint.managingOrganization` bär "förvaltar"-relationen till den förvaltande organisationen, och `Endpoint.payload` (tillsammans med [TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.md)) bär "tillgängliggör"/"följer"-relationerna till de API:er och interoperabilitetsspecifikationer som ändpunkten stödjer. Sök efter ändpunkter som en organisation **listar** (Organization.endpoint, "har") med [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md); sök efter ändpunkter en organisation **förvaltar** med standardparametern `organization`. 

**Användningar:**

* Referera till denna Profil: [Tjänstekatalogen Organization](StructureDefinition-tk-organization.md)
* Exempel för denna Profil: [Exempelregionens patientinformations-API](Endpoint-TKEndpointExample.md)
* CapabilityStatements som använder denna Profil: [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.tjanstekatalog|current/StructureDefinition/tk-endpoint)

### Formella vyer av profilinnehåll

 [Beskrivningsdifferentialer, ögonblicksbilder och andra representationer](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tabell med nyckelelement](#tabs-key) 
*  [Differentialtabell](#tabs-diff) 
*  [Ögonblicksbildstabell](#tabs-snap) 
*  [Statistik/referenser](#tabs-summ) 
*  [Alla](#tabs-all) 

#### Terminologibindningar

#### Begränsningar

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 2 elements(3 nästlade obligatoriska elements)
 Måste stödjas: 17 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

**Extensions**

Denna struktur refererar till dessa extensions:

* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method](StructureDefinition-tk-endpoint-security-method.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url](StructureDefinition-tk-endpoint-authorization-server-url.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile](StructureDefinition-tk-endpoint-payload-profile.md)

**Skivor**

Denna struktur definierar följande [skivor](http://hl7.org/fhir/R5/profiling.html#slices):

* Elementet 1 är uppdelat baserat på värdet av Endpoint.identifier

 **Vy med nyckelelement** 

#### Terminologibindningar

#### Begränsningar

 **Differentialvy** 

 **ÖgonblicksbildsvyView** 

#### Terminologibindningar

#### Begränsningar

** Sammanfattning **

Obligatorisk: 2 elements(3 nästlade obligatoriska elements)
 Måste stödjas: 17 elements

**Strukturer**

Denna struktur refererar till dessa andra strukturer:

* [Tjänstekatalogen Organization (https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization)](StructureDefinition-tk-organization.md)

**Extensions**

Denna struktur refererar till dessa extensions:

* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method](StructureDefinition-tk-endpoint-security-method.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url](StructureDefinition-tk-endpoint-authorization-server-url.md)
* [https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile](StructureDefinition-tk-endpoint-payload-profile.md)

**Skivor**

Denna struktur definierar följande [skivor](http://hl7.org/fhir/R5/profiling.html#slices):

* Elementet 1 är uppdelat baserat på värdet av Endpoint.identifier

 

Andra representationer av profilen: [CSV](../StructureDefinition-tk-endpoint.csv), [Excel](../StructureDefinition-tk-endpoint.xlsx), [Schematron](../StructureDefinition-tk-endpoint.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tk-endpoint",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint",
  "identifier" : [{
    "value" : "TKEndpoint"
  }],
  "version" : "0.1.0",
  "name" : "TKEndpoint",
  "title" : "Tjänstekatalogen Endpoint",
  "status" : "draft",
  "date" : "2026-09-08",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Teknisk ändpunkt i tjänstekatalogen. Realiserar entiteten Ändpunkt i det\nbifogade informationsunderlaget: `Endpoint.address` bär ändpunktens URL,\n`Endpoint.managingOrganization` bär \"förvaltar\"-relationen till den\nförvaltande organisationen, och `Endpoint.payload` (tillsammans med\n[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html))\nbär \"tillgängliggör\"/\"följer\"-relationerna till de API:er och\ninteroperabilitetsspecifikationer som ändpunkten stödjer. Sök efter\nändpunkter som en organisation *listar* (Organization.endpoint, \"har\") med\n[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html); sök\nefter ändpunkter en organisation *förvaltar* med standardparametern\n`organization`.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "req",
    "uri" : "https://fhir.inera.se/ig/tjanstekatalog/Requirements/tk-tjanstekatalog-requirements",
    "name" : "Kravkatalog"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Endpoint",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Endpoint",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Endpoint",
      "path" : "Endpoint"
    },
    {
      "id" : "Endpoint.id",
      "path" : "Endpoint.id",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-1"
      }]
    },
    {
      "id" : "Endpoint.extension",
      "path" : "Endpoint.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Endpoint.extension:securityMethod",
      "path" : "Endpoint.extension",
      "sliceName" : "securityMethod",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-security-method"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-6"
      }]
    },
    {
      "id" : "Endpoint.extension:authorizationServerUrl",
      "path" : "Endpoint.extension",
      "sliceName" : "authorizationServerUrl",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-authorization-server-url"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-7"
      }]
    },
    {
      "id" : "Endpoint.identifier",
      "path" : "Endpoint.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "short" : "Ändpunktsidentifierare, inklusive EHM:s motsvarande id",
      "mustSupport" : true
    },
    {
      "id" : "Endpoint.identifier:ehmEndpointId",
      "path" : "Endpoint.identifier",
      "sliceName" : "ehmEndpointId",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-WRT-4"
      }]
    },
    {
      "id" : "Endpoint.identifier:ehmEndpointId.system",
      "path" : "Endpoint.identifier.system",
      "min" : 1,
      "patternUri" : "http://electronichealth.se/fhir/NDI/Endpoint"
    },
    {
      "id" : "Endpoint.identifier:ehmEndpointId.value",
      "path" : "Endpoint.identifier.value",
      "short" : "EHM:s logiska id (UUID) för samma ändpunkt i deras register",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Endpoint.status",
      "path" : "Endpoint.status",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-2"
      }]
    },
    {
      "id" : "Endpoint.connectionType",
      "path" : "Endpoint.connectionType",
      "short" : "Protokoll som ändpunkten stödjer",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-8"
      }]
    },
    {
      "id" : "Endpoint.name",
      "path" : "Endpoint.name",
      "short" : "Ändpunktens namn",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-3"
      }]
    },
    {
      "id" : "Endpoint.managingOrganization",
      "path" : "Endpoint.managingOrganization",
      "short" : "Förvaltande organisation (\"förvaltar\")",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-ORG-4"
      }]
    },
    {
      "id" : "Endpoint.period",
      "path" : "Endpoint.period",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-5"
      }]
    },
    {
      "id" : "Endpoint.period.start",
      "path" : "Endpoint.period.start",
      "mustSupport" : true
    },
    {
      "id" : "Endpoint.period.end",
      "path" : "Endpoint.period.end",
      "mustSupport" : true
    },
    {
      "id" : "Endpoint.payload",
      "path" : "Endpoint.payload",
      "mustSupport" : true
    },
    {
      "id" : "Endpoint.payload.extension",
      "path" : "Endpoint.payload.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Endpoint.payload.extension:supportedProfile",
      "path" : "Endpoint.payload.extension",
      "sliceName" : "supportedProfile",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint-payload-profile"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-SRCH-3, REQ-MDL-3"
      }]
    },
    {
      "id" : "Endpoint.payload.type",
      "path" : "Endpoint.payload.type",
      "short" : "Vilket API/vilken typ av innehåll som tillgängliggörs",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-MDL-3"
      }]
    },
    {
      "id" : "Endpoint.address",
      "path" : "Endpoint.address",
      "short" : "Ändpunktens URL",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "req",
        "map" : "REQ-END-4, REQ-SRCH-2"
      }]
    }]
  }
}

```
