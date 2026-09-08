# REST-interaktioner och sökparametrar - Tjänstekatalogen v0.1.0

## REST-interaktioner och sökparametrar

# REST-interaktioner och sökparametrar

| | | |
| :--- | :--- | :--- |
| [TKOrganization](StructureDefinition-tk-organization.md) | read, search-type, create, update | `identifier`,`name` |
| [TKEndpoint](StructureDefinition-tk-endpoint.md) | read, search-type, create, update | `organization`(standard, "förvaltar"),[`listed-by`](SearchParameter-tk-endpoint-listed-by.md)(egen, "har"),`status` |

Tjänstekatalogens administrativa API exponerar inga egna skrivoperationer för att koppla organisation och ändpunkt — det görs istället hos E-hälsomyndigheten (EHM), av en Synkroniseringstjänst som läser härifrån. Se [Mappning mot EHM:s Organization Endpoint Writer](mappings.md) för EHM:s `$add-organization`/`$remove-organization`.

-------

### Sök ändpunkter för en organisation

Hämta samtliga ändpunkter en organisation listar ("har"):

```
GET [base]/Endpoint?listed-by=Organization/123

```

eller med identifierare (kedjad sökning):

```
GET [base]/Endpoint?listed-by.identifier=urn:oid:2.5.4.97|2321000016

```

Detta skiljer sig från att söka på den förvaltande organisationen ("förvaltar"), som använder standardparametern:

```
GET [base]/Endpoint?organization=Organization/123

```

`listed-by` implementeras av servern likvärdigt med FHIR:s standardmekanism för omvänd kedjning:

```
GET [base]/Endpoint?_has:Organization:endpoint:_id=123

```

Se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.md) och [Kravkatalog](requirements.md) REQ-SRCH-1 för den fullständiga motiveringen.

#### Implementeringsanvisning: listed-by i HAPI FHIR

HAPI FHIR JPA-servern stödjer normalt egna sökparametrar genom att man laddar upp dem som `SearchParameter`-resurser och sedan kör om indexeringen (`$reindex`) — det fungerar för parametrar som har en `.expression` (FHIRPath) att indexera på. `listed-by` har medvetet ingen `.expression` (se ovan), så HAPI:s automatiska indexeringsmekanism kan inte användas rakt av för den. Två praktiska sätt att ändå erbjuda `listed-by` i HAPI:

1. **Enklast:**låt klienter använda HAPI:s inbyggda stöd för`_has`direkt (`Endpoint?_has:Organization:endpoint:_id=[id]`) — det kräver ingen serverkonfiguration alls, eftersom`_has`bygger på`Organization`s redan existerande standardsökparameter`endpoint`.
1. **Om `listed-by` ändå ska exponeras som ett eget, vänligare parameternamn:**ladda upp`SearchParameter`-resursen (utan`.expression`, precis som den definieras här) så att den syns i serverns`CapabilityStatement`, men registrera dessutom en`IServerInterceptor`på en lämplig pointcut (t.ex.`SERVER_INCOMING_REQUEST_POST_PROCESSED`) som, innan sökningen exekveras, skriver om`listed-by=X`till motsvarande`_has:Organization:endpoint:_id=X`. Förlita dig inte på att HAPI indexerar`listed-by`automatiskt bara för att`SearchParameter`-resursen finns uppladdad.

-------

> **Vägledning för författare:** Roller och deras verksamhetsansvar beskrivs under [Roller och ansvar](roles-and-responsibilities.md) (Funktionellt). Håll denna sida på ett konkret, tekniskt REST-plan.

