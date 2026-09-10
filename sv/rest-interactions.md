# REST-interaktioner och sökparametrar - Tjänstekatalogen v0.1.0

## REST-interaktioner och sökparametrar

# REST-interaktioner och sökparametrar

| | | | |
| :--- | :--- | :--- | :--- |
| [TKOrganization](StructureDefinition-tk-organization.md) | read, search-type (externt); create, update (endast internt) | `identifier`("logisk adress", se mappings.html REQ-ORG-5),`name` | [TKSearchAPI](CapabilityStatement-tk-search-api.md)externt,[TKAdminAPI](CapabilityStatement-tk-admin-api.md)internt |
| [TKEndpoint](StructureDefinition-tk-endpoint.md) | read, search-type (externt); create, update (endast internt) | `organization`(standard, "förvaltar"),[`listed-by`](SearchParameter-tk-endpoint-listed-by.md)(egen, "har"),`status`,[`implements`](SearchParameter-tk-endpoint-implements.md)(stödd interoperabilitetsspecifikation) | [TKSearchAPI](CapabilityStatement-tk-search-api.md)externt,[TKAdminAPI](CapabilityStatement-tk-admin-api.md)internt |
| `CapabilityStatement`([TKAPISpecificationCapability](StructureDefinition-tk-api-specification-capability.md)/[TKAPIInstance](StructureDefinition-tk-api-instance.md)) | read, search-type (externt); create, update (endast internt) | `url`,[`kind`](SearchParameter-tk-capabilitystatement-kind.md),[`instantiates`](SearchParameter-tk-capabilitystatement-instantiates.md) | [TKSearchAPI](CapabilityStatement-tk-search-api.md)externt,[TKAdminAPI](CapabilityStatement-tk-admin-api.md)internt |
| [TKProvenance](StructureDefinition-tk-provenance.md) | read, search-type | `target` | Endast[TKAdminAPI](CapabilityStatement-tk-admin-api.md)(internt) |
| [TKAdministratorRole](StructureDefinition-tk-administrator-role.md) | read, search-type, create, update | `organization`,`practitioner` | Endast[TKAdminAPI](CapabilityStatement-tk-admin-api.md)(internt) |

Exponeringsgräns (REQ-EXP-1/2, stakeholder-beslut): läsande sökning exponeras externt via gateway ([TKSearchAPI](CapabilityStatement-tk-search-api.md)); skrivinteraktioner och administratörsbehörigheter finns endast i det internt exponerade [TKAdminAPI](CapabilityStatement-tk-admin-api.md). Se [CapabilityStatement](capabilitystatement.md) och [Säkerhet och behörighet](security.md).

Tjänstekatalogens administrativa API exponerar inga egna skrivoperationer för att koppla organisation och ändpunkt — det görs istället hos E-hälsomyndigheten (EHM), av en Synkroniseringstjänst som läser härifrån. Se [Mappning mot EHM:s Organization Endpoint Writer](mappings.md) för EHM:s `$add-organization`/`$remove-organization`.

-------

### Registrering

Tillagt efter jämförelse med en annan implementation av samma problem — löser REQ-MDL-5:s tidigare uppskjutna spårbarhetsfråga (se [Mappning till profiler](mappings.md)).

Registrering (skapande/uppdatering av en `Organization`, `Endpoint` eller `CapabilityStatement`) SKA ske via systeminteraktionen `transaction`, med en obligatorisk [TKProvenance](StructureDefinition-tk-provenance.md)-post i samma Bundle (REQ-TRC-1/2):

```
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:8f2e...",
      "resource": { "resourceType": "Endpoint", "...": "..." },
      "request": { "method": "POST", "url": "Endpoint" }
    },
    {
      "resource": {
        "resourceType": "Provenance",
        "target": [{ "reference": "urn:uuid:8f2e..." }],
        "recorded": "2026-09-09T10:00:00Z",
        "agent": [{ "who": { "reference": "Organization/exempelregionen" } }]
      },
      "request": { "method": "POST", "url": "Provenance" }
    }
  ]
}

```

```
PUT [base]/

```

(FHIR:s systemnivå-transaktion skickas till bas-URL:en, inte till en resurstyps-URL.) Servern SKA behandla Bundlens poster atomiskt: antingen registreras samtliga poster, eller ingen. Enskilda `create`/`update`- interaktioner per resurstyp (se tabellen ovan) kvarstår som del av respektive resurstyps förmågor, men klienter SKA använda transaction-vägen för faktisk registrering, för att garantera att Provenance-posten alltid följer med.

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

### Distribution och synkronisering

Inte del av det ursprungliga informationsunderlaget — tillagt per stakeholder-beslut: "Distribution/federering kan tänkas på, prenumeration via fhir-mekanismer för det är bra + grundladdning." (REQ-DIST-*, se [Mappning till profiler](mappings.md)). Löses med inbyggda FHIR-mekanismer, inte en egen händelsemodell:

**Prenumeration (händelsebaserad distribution).** Servern BÖR stödja R5:s topic-baserade `Subscription`, mot ämnet [SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.md), som utlöses av `create`/`update`/`delete` på `Organization` respektive `Endpoint` (REQ-DIST-1). En lokal katalog skapar en `Subscription` som refererar ämnets url:

```
{
  "resourceType": "Subscription",
  "status": "requested",
  "topic": "https://fhir.inera.se/ig/tjanstekatalog/SubscriptionTopic/tk-organization-endpoint-changes",
  "channelType": {
    "system": "http://terminology.hl7.org/CodeSystem/subscription-channel-type",
    "code": "rest-hook"
  },
  "endpoint": "https://lokal-katalog.example.se/fhir-notifications",
  "content": "id-only"
}

```

En notifiering talar bara om **att** något ändrats och vilken interaktion det gällde — klienten hämtar det aktuella innehållet via [sök-API:et](CapabilityStatement-tk-search-api.md) (`content: id-only`) eller får resursen direkt om `content` sätts till `full-resource`.

**Grundladdning och återsynk.** Servern BÖR stödja att sökningar på `Organization`/`Endpoint` avgränsas med den generella FHIR-sökparametern `_lastUpdated` (tidsintervall), utan att en separat grundladdnings-operation behöver definieras (REQ-DIST-2):

```
GET [base]/Endpoint?_lastUpdated=ge2026-01-01&_lastUpdated=lt2026-02-01

```

En lokal katalog som initieras för första gången kan hämta allt (utan `_lastUpdated`); en katalog som ska återsynkas efter driftstopp kan avgränsa till perioden sedan senaste kända aktualitet.

**Rundgång i en dubbelriktad federerad miljö** (en lokal katalogs egna uppdateringar studsar tillbaka via prenumerationen) är inte löst i detta utkast — det kräver ett ursprungsmärke på posten, vilket lämnas som en öppen fråga (REQ-DIST-3, se mappings.html).

-------

> **Vägledning för författare:** Roller och deras verksamhetsansvar beskrivs under [Roller och ansvar](roles-and-responsibilities.md) (Funktionellt). Håll denna sida på ett konkret, tekniskt REST-plan.

