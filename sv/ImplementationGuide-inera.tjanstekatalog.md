# Resource Tjänstekatalogen



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "inera.tjanstekatalog",
  "language" : "sv",
  "url" : "https://fhir.inera.se/ig/tjanstekatalog/ImplementationGuide/inera.tjanstekatalog",
  "version" : "0.1.0",
  "name" : "IneraTjanstekatalog",
  "title" : "Tjänstekatalogen",
  "status" : "draft",
  "date" : "2026-09-08T11:37:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "FHIR-gränssnitt för sökning av organisationers tekniska ändpunkter (endpoints) i tjänstekatalogen, samt administrativt API för att registrera organisationer, ändpunkter och deras kopplingar. Definierar även aktören Organization Endpoint Writer, som tillhandahåller ändpunktsinformation till katalogen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "packageId" : "inera.tjanstekatalog",
  "license" : "CC0-1.0",
  "fhirVersion" : ["5.0.0"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r5",
    "version" : "7.3.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r5",
    "version" : "5.3.0"
  }],
  "definition" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r5#1.1.2"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "OperationDefinition-tk-endpoint-add-organization-to-endpoint.html"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tk-endpoint-add-organization-to-endpoint"
      },
      "name" : "Add Organization To Endpoint",
      "description" : "Lägger till en referens till denna Endpoint i den angivna organisationens Organization.endpoint-lista (\"har\"-relationen). Ändrar inte Endpoint.managingOrganization (\"förvaltar\").",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-api-specification.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-api-specification"
      },
      "name" : "API-specifikation (logisk modell)",
      "description" : "Logisk modell för entiteten API-specifikation i informationsunderlaget. REST-exponering i det administrativa API:et är inte del av detta utkast — se REQ-MDL-4.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-tk-endpoint-listed-by.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/tk-endpoint-listed-by"
      },
      "name" : "Endpoint: listed-by (organisation som listar ändpunkten)",
      "description" : "Söker fram de Endpoint-resurser som en angiven Organization listar i sin ändpunktskatalog, dvs. de ändpunkter som förekommer i Organization.endpoint (\"har\"-relationen i informationsunderlaget) — till skillnad från standardparametern `organization`, som endast matchar den förvaltande organisationen (Endpoint.managingOrganization, \"förvaltar\"-relationen). Servrar SKA implementera denna parameter med sökbeteende likvärdigt med `_has:Organization:endpoint:_id=[organization-id]`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-TKOrganizationExample.html"
      }],
      "reference" : {
        "reference" : "Organization/TKOrganizationExample"
      },
      "name" : "Exempel: organisation i tjänstekatalogen",
      "description" : "Exempel på en organisation som listar (\"har\") en ändpunkt i tjänstekatalogen.",
      "isExample" : true,
      "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-organization"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Endpoint"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Endpoint-TKEndpointExample.html"
      }],
      "reference" : {
        "reference" : "Endpoint/TKEndpointExample"
      },
      "name" : "Exempel: teknisk ändpunkt i tjänstekatalogen",
      "description" : "Exempel på en teknisk ändpunkt som förvaltas av en organisation, tillgängliggör ett FHIR-API och skyddas med OAuth 2.0 client credentials.",
      "isExample" : true,
      "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/tk-endpoint"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-indexpost.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-indexpost"
      },
      "name" : "Indexpost (logisk modell)",
      "description" : "Logisk modell för entiteten Indexpost i informationsunderlaget. Ej REST-exponerad i detta utkast av det administrativa API:et — se REQ-MDL-1.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-IneraPatient.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/IneraPatient"
      },
      "name" : "Inera Patient",
      "description" : "A template patient profile demonstrating Inera's FHIR profiling conventions.\nAuthors should replace this description with the clinical purpose and scope of the profile.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-IneraPatientExample.html"
      }],
      "reference" : {
        "reference" : "Patient/IneraPatientExample"
      },
      "name" : "Inera Patient Example",
      "description" : "A minimal example of a patient conforming to the IneraPatient profile.",
      "isExample" : true,
      "profile" : ["https://fhir.inera.se/ig/tjanstekatalog/StructureDefinition/IneraPatient"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Requirements"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Requirements-tk-tjanstekatalog-requirements.html"
      }],
      "reference" : {
        "reference" : "Requirements/tk-tjanstekatalog-requirements"
      },
      "name" : "Kravkatalog: Tjänstekatalogen",
      "description" : "Formell kravkatalog för tjänstekatalogen, med spårning från krav till realiserande FHIR-artefakter.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-tk-organization-endpoint-writer.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/tk-organization-endpoint-writer"
      },
      "name" : "Organization Endpoint Writer",
      "description" : "Aktör: System som tillhandahåller information om organisationers tekniska ändpunkter till tjänstekatalogen.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-tk-organization-endpoint-writer.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/tk-organization-endpoint-writer"
      },
      "name" : "Organization Endpoint Writer Capabilities",
      "description" : "Detta CapabilityStatement beskriver de FHIR REST-förmågor som aktören Organization Endpoint Writer ska stödja.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "OperationDefinition-tk-endpoint-remove-organization-from-endpoint.html"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tk-endpoint-remove-organization-from-endpoint"
      },
      "name" : "Remove Organization From Endpoint",
      "description" : "Tar bort referensen till denna Endpoint från den angivna organisationens Organization.endpoint-lista (\"har\"-relationen). Ändrar inte Endpoint.managingOrganization (\"förvaltar\").",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-endpoint-payload-profile.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-endpoint-payload-profile"
      },
      "name" : "Stödd specifikation (payload profile)",
      "description" : "Kanonisk URL för en interoperabilitetsspecifikation (t.ex. en FHIR IG eller profil) som denna nyttolast/API stödjer. Motsvarar det kommande elementet Endpoint.payload.profile. Kan upprepas om nyttolasten stödjer flera specifikationer eller versioner.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-endpoint-security-method.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-endpoint-security-method"
      },
      "name" : "Säkerhetsmetod",
      "description" : "Anger vilken säkerhetsmetod som skyddar åtkomst till ändpunkten (Ändpunkt.säkerhetsmetod i informationsunderlaget). Basresursen Endpoint saknar ett eget element för detta i R5.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-tk-endpoint-security-method.html"
      }],
      "reference" : {
        "reference" : "ValueSet/tk-endpoint-security-method"
      },
      "name" : "Säkerhetsmetoder för tekniska ändpunkter",
      "description" : "Tillåtna värden för Ändpunkt.säkerhetsmetod. Exempelbindning (example) i detta utkast — se REQ-END-6.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-tk-endpoint-security-method.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/tk-endpoint-security-method"
      },
      "name" : "Säkerhetsmetoder för tekniska ändpunkter (kodsystem)",
      "description" : "Kodsystem som anger vilken säkerhetsmetod som skyddar en teknisk ändpunkt (Ändpunkt.säkerhetsmetod i informationsunderlaget). Preliminärt förslag, se REQ-END-6 i kravkatalogen.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-endpoint.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-endpoint"
      },
      "name" : "Tjänstekatalogen Endpoint",
      "description" : "Teknisk ändpunkt i tjänstekatalogen. Realiserar entiteten Ändpunkt i det\nbifogade informationsunderlaget: `Endpoint.address` bär ändpunktens URL,\n`Endpoint.managingOrganization` bär \"förvaltar\"-relationen till den\nförvaltande organisationen, och `Endpoint.payload` (tillsammans med\n[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html))\nbär \"tillgängliggör\"/\"följer\"-relationerna till de API:er och\ninteroperabilitetsspecifikationer som ändpunkten stödjer. Sök efter\nändpunkter som en organisation *listar* (Organization.endpoint, \"har\") med\n[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html); sök\nefter ändpunkter en organisation *förvaltar* med standardparametern\n`organization`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-organization.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-organization"
      },
      "name" : "Tjänstekatalogen Organization",
      "description" : "Organisation i tjänstekatalogen. `Organization.endpoint` bär \"har\"-relationen\n— de ändpunkter organisationen listar i sin katalogpost, oavsett vem som\nförvaltar dem tekniskt. Sök efter dessa ändpunkter med\n[SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html) på\nEndpoint, med organisationens id/referens som värde. Den separata\n\"förvaltar\"-relationen (vem som tekniskt driftar en given ändpunkt) uttrycks\nistället av [TKEndpoint](StructureDefinition-tk-endpoint.html)s\n`managingOrganization`, sökbar med standardparametern `organization`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-tk-admin-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/tk-admin-api"
      },
      "name" : "Tjänstekatalogen: administrativt API",
      "description" : "CapabilityStatement för tjänstekatalogens administrativa API (serverroll).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-endpoint-authorization-server-url.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-endpoint-authorization-server-url"
      },
      "name" : "URL till auktorisationsserver",
      "description" : "URL till den auktorisationsserver (t.ex. OAuth 2.0-token-endpoint) som klienter ska använda för att erhålla åtkomst till ändpunkten (Ändpunkt.urlTillAuktorisationsserver i informationsunderlaget). Relevant framför allt när Ändpunkt.säkerhetsmetod anger en OAuth 2.0-baserad metod.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-tk-vard-och-omsorgstagare.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tk-vard-och-omsorgstagare"
      },
      "name" : "Vård- och omsorgstagare (logisk modell)",
      "description" : "Logisk modell för entiteten Vård- och omsorgstagare i informationsunderlaget. Tunn, avsiktligt begränsad till id — se REQ-MDL-2.",
      "isExample" : false
    }],
    "page" : {
      "sourceUrl" : "toc.html",
      "name" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "sourceUrl" : "index.html",
        "name" : "index.html",
        "title" : "Hem",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "introduction.html",
        "name" : "introduction.html",
        "title" : "Inledning",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "information-basis.html",
        "name" : "information-basis.html",
        "title" : "Informationsunderlag",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "use-cases.html",
        "name" : "use-cases.html",
        "title" : "Användningsfall",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "requirements.html",
        "name" : "requirements.html",
        "title" : "Kravkatalog",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "roles-and-responsibilities.html",
        "name" : "roles-and-responsibilities.html",
        "title" : "Roller och ansvar",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "mappings.html",
        "name" : "mappings.html",
        "title" : "Mappning till profiler",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "rest-interactions.html",
        "name" : "rest-interactions.html",
        "title" : "REST-interaktioner och sökparametrar",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "expected-responses.html",
        "name" : "expected-responses.html",
        "title" : "Förväntade svar",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "capabilitystatement.html",
        "name" : "capabilitystatement.html",
        "title" : "CapabilityStatement",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "error-handling.html",
        "name" : "error-handling.html",
        "title" : "Felhantering",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "security.html",
        "name" : "security.html",
        "title" : "Säkerhet och behörighet",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "testing.html",
        "name" : "testing.html",
        "title" : "Testning och validering",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "about.html",
        "name" : "about.html",
        "title" : "Om",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "downloads.html",
        "name" : "downloads.html",
        "title" : "Nedladdningar",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "version-history.html",
        "name" : "version-history.html",
        "title" : "Versionshistorik",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "copyrightyear"
      },
      "value" : "2026+"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "releaselabel"
      },
      "value" : "ci-build"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "show-inherited-invariants"
      },
      "value" : "false"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "usage-stats-opt-out"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "i18n-default-lang"
      },
      "value" : "sv"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "autoload-resources"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/capabilities"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/examples"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/extensions"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/models"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/operations"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/profiles"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/resources"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/vocabulary"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/maps"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/testing"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/history"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "fsh-generated/resources"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "template/config"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "input/assets"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "input/images"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-liquid-template"
      },
      "value" : "template/liquid"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-liquid-template"
      },
      "value" : "input/liquid"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-qa"
      },
      "value" : "temp/qa"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-temp"
      },
      "value" : "temp/pages"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-output"
      },
      "value" : "output"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-tx-cache"
      },
      "value" : "input-cache/txcache"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-suppressed-warnings"
      },
      "value" : "input/ignoreWarnings.txt"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-history"
      },
      "value" : "https://fhir.inera.se/ig/tjanstekatalog/history.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "template-html"
      },
      "value" : "template-page.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "template-md"
      },
      "value" : "template-page-md.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-contact"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-context"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-copyright"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-jurisdiction"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-license"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-publisher"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-version"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-wg"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "active-tables"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "fmm-definition"
      },
      "value" : "http://hl7.org/fhir/versions.html#maturity"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "propagate-status"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "excludelogbinaryformat"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "tabbed-snapshots"
      },
      "value" : "true"
    }]
  }
}

```
