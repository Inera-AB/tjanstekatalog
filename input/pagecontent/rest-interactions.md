| Resurs/Profil | Interaktion | Sökparametrar | Exponering |
|----------------|-------------|----------------|------------|
| [TKOrganization](StructureDefinition-tk-organization.html) | read, search-type (externt); create, update (endast internt) | `identifier` ("logisk adress": HSA-id eller organisationsnummer, se REQ-ORG-5/6, REQ-SRCH-5), `name`, `_id`, `_lastUpdated`, `active`, `partof`; `_include=Organization:endpoint`; `_history` | [TKSearchAPI](CapabilityStatement-tk-search-api.html) externt, [TKAdminAPI](CapabilityStatement-tk-admin-api.html) internt |
| [TKEndpoint](StructureDefinition-tk-endpoint.html) | read, search-type (externt); create, update (endast internt) | `organization` (standard, "förvaltar"), [`listed-by`](SearchParameter-tk-endpoint-listed-by.html) (egen, "har"), `status`, [`implements`](SearchParameter-tk-endpoint-implements.html) (stödd interoperabilitetsspecifikation), `identifier`, `_id`, `_lastUpdated`; `_history` | [TKSearchAPI](CapabilityStatement-tk-search-api.html) externt, [TKAdminAPI](CapabilityStatement-tk-admin-api.html) internt |
| `CapabilityStatement` ([TKAPISpecificationCapability](StructureDefinition-tk-api-specification-capability.html) / [TKAPIInstance](StructureDefinition-tk-api-instance.html)) | read, search-type (externt); create, update (endast internt) | `url`, `version`, `date`, [`kind`](SearchParameter-tk-capabilitystatement-kind.html), [`instantiates`](SearchParameter-tk-capabilitystatement-instantiates.html), `_id`, `_lastUpdated` | [TKSearchAPI](CapabilityStatement-tk-search-api.html) externt, [TKAdminAPI](CapabilityStatement-tk-admin-api.html) internt |
| [TKProvenance](StructureDefinition-tk-provenance.html) | read, search-type | `target` | Endast [TKAdminAPI](CapabilityStatement-tk-admin-api.html) (internt) |
| [TKAdministratorRole](StructureDefinition-tk-administrator-role.html) | read, search-type, create, update | `organization`, `practitioner` | Endast [TKAdminAPI](CapabilityStatement-tk-admin-api.html) (internt) |

Exponeringsgräns (REQ-EXP-1/2, stakeholder-beslut): läsande sökning
exponeras externt via gateway ([TKSearchAPI](CapabilityStatement-tk-search-api.html));
skrivinteraktioner och administratörsbehörigheter finns endast i det internt
exponerade [TKAdminAPI](CapabilityStatement-tk-admin-api.html). Se
[CapabilityStatement](capabilitystatement.html) och
[Säkerhet och behörighet](security.html).

Tjänstekatalogens administrativa API exponerar inga egna skrivoperationer för
att koppla organisation och ändpunkt — det görs istället hos
E-hälsomyndigheten (EHM), av en Synkroniseringstjänst som läser härifrån. Se
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html) för EHM:s
`$add-organization`/`$remove-organization`.

---

### Registrering

Tillagt efter jämförelse med en annan implementation av samma problem —
löser REQ-MDL-5:s tidigare uppskjutna spårbarhetsfråga (se
[Mappning till profiler](mappings.html)).

Registrering (skapande/uppdatering av en `Organization`, `Endpoint` eller
`CapabilityStatement`) SKA ske via systeminteraktionen `transaction`, med
en obligatorisk [TKProvenance](StructureDefinition-tk-provenance.html)-post
i samma Bundle (REQ-TRC-1/2):

```json
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

(FHIR:s systemnivå-transaktion skickas till bas-URL:en, inte till en
resurstyps-URL.) Servern SKA behandla Bundlens poster atomiskt: antingen
registreras samtliga poster, eller ingen. Enskilda `create`/`update`-
interaktioner per resurstyp (se tabellen ovan) kvarstår som del av
respektive resurstyps förmågor, men klienter SKA använda transaction-vägen
för faktisk registrering, för att garantera att Provenance-posten alltid
följer med.

---

### Sök ändpunkter för en organisation

Hämta samtliga ändpunkter en organisation listar ("har"):

```
GET [base]/Endpoint?listed-by=Organization/123
```

eller med identifierare (kedjad sökning), i första hand HSA-id:

```
GET [base]/Endpoint?listed-by.identifier=urn:oid:1.2.752.29.4.19|SE2321000016-1003
GET [base]/Endpoint?listed-by.identifier=urn:oid:2.5.4.97|2321000016
```

Detta skiljer sig från att söka på den förvaltande organisationen
("förvaltar"), som använder standardparametern:

```
GET [base]/Endpoint?organization=Organization/123
```

`listed-by` implementeras av servern likvärdigt med FHIR:s
standardmekanism för omvänd kedjning:

```
GET [base]/Endpoint?_has:Organization:endpoint:_id=123
```

Se [SearchParameter: listed-by](SearchParameter-tk-endpoint-listed-by.html)
och [Kravkatalog](requirements.html) REQ-SRCH-1 för den fullständiga
motiveringen.

#### Implementeringsanvisning: `listed-by` i HAPI FHIR

HAPI FHIR JPA-servern stödjer normalt egna sökparametrar genom att man
laddar upp dem som `SearchParameter`-resurser och sedan kör om indexeringen
(`$reindex`) — det fungerar för parametrar som har en `.expression`
(FHIRPath) att indexera på. `listed-by` har medvetet ingen `.expression`
(se ovan), så HAPI:s automatiska indexeringsmekanism kan inte användas rakt
av för den. Två praktiska sätt att ändå erbjuda `listed-by` i HAPI:

1. **Enklast:** låt klienter använda HAPI:s inbyggda stöd för `_has`
   direkt (`Endpoint?_has:Organization:endpoint:_id=[id]`) — det kräver
   ingen serverkonfiguration alls, eftersom `_has` bygger på `Organization`s
   redan existerande standardsökparameter `endpoint`.
2. **Om `listed-by` ändå ska exponeras som ett eget, vänligare
   parameternamn:** ladda upp `SearchParameter`-resursen (utan
   `.expression`, precis som den definieras här) så att den syns i
   serverns `CapabilityStatement`, men registrera dessutom en
   `IServerInterceptor` på en lämplig pointcut (t.ex.
   `SERVER_INCOMING_REQUEST_POST_PROCESSED`) som, innan sökningen
   exekveras, skriver om `listed-by=X` till motsvarande
   `_has:Organization:endpoint:_id=X`. Förlita dig inte på att HAPI
   indexerar `listed-by` automatiskt bara för att `SearchParameter`-resursen
   finns uppladdad.

---

### Organisationsidentifierare

En organisation identifieras i första hand med sitt HSA-id och i andra hand
med organisationsnummer (REQ-ORG-6..9). De två följer olika formatregler:

| Identifierare | System | Lagras och returneras som | Vid sökning |
|---|---|---|---|
| HSA-id | `urn:oid:1.2.752.29.4.19` | Exakt som det är skrivet, t.ex. `SE2321000016-1003` | Exakt matchning. Bindestrecket ingår i identifieraren och tas aldrig bort. |
| Organisationsnummer | `urn:oid:2.5.4.97` | Tio siffror utan bindestreck, t.ex. `2321000016` | Både `232100-0016` och `2321000016` ger samma träff. |

HSA-id består av prefixet `SE`, organisationsnumret för den direktanslutna
producenten i formatet tio siffror utan bindestreck, samt ett bindestreck
och en efterföljande identifierande del. Organisationsnumret i HSA-id:t
avser den direktanslutna producenten och behöver inte vara
organisationsnumret för den enhet som HSA-id:t identifierar. Klienter och
Synkroniseringstjänsten får därför aldrig härleda ett organisationsnummer
ur ett HSA-id.

```
GET [base]/Organization?identifier=urn:oid:1.2.752.29.4.19|SE2321000016-1003
GET [base]/Organization?identifier=urn:oid:2.5.4.97|232100-0016
```

Normaliseringen av organisationsnummer görs bara när systemet
`urn:oid:2.5.4.97` anges. Vid skrivning i admin-API:t avvisas
organisationsnummer som inte är exakt tio siffror (REQ-ORG-2), liksom
dubbletter (REQ-ORG-7) och okända identifierarsystem (REQ-ORG-9), med
`422 Unprocessable Entity`.

Organisationsnummer anges bara på den juridiska personen. Underliggande
enheter har eget HSA-id och pekar på den juridiska personen via
`Organization.partOf` (REQ-ORG-8):

```
GET [base]/Organization?partof=Organization/123
```

---

### Sökkonventioner

Hämtade från IHE mCSD (ITI-90) och anpassade till tjänstekatalogen
(REQ-SRCH-9). Uppslag från logisk adress till ändpunkter i ett enda anrop:

```
GET [base]/Organization?identifier=urn:oid:1.2.752.29.4.19|SE2321000016-1003&_include=Organization:endpoint
```

- `name` stödjer modifierarna `:contains` och `:exact`.
- `_count` och sidindelning stöds för alla sökningar.
- Sökning på `Endpoint` utan `status` utelämnar ändpunkter med status
  `entered-in-error`; se [Förväntade svar](expected-responses.html)
  (REQ-SRCH-7).
- Servern filtrerar inte på giltighetsperiod (REQ-SRCH-8). En ändpunkt kan
  användas om `status = active` och aktuell tidpunkt ligger inom `period`.

---

### Kanoniska referenser och versioner

`CapabilityStatement.instantiates` och extensionen
[TKEndpointPayloadProfile](StructureDefinition-tk-endpoint-payload-profile.html)
är av datatypen `canonical`. Sökparametrarna
[`instantiates`](SearchParameter-tk-capabilitystatement-instantiates.html) och
[`implements`](SearchParameter-tk-endpoint-implements.html) är därför av typen
`reference`, som FHIR använder för sökning på kanoniska referenser
(REQ-SRCH-6):

| Form | Matchar |
|---|---|
| `[url]` | Alla versioner, även referenser utan version. |
| `[url]\|[version]` | Endast den angivna versionen. |
| `CapabilityStatement/[id]` | Stöds inte — en canonical är ingen literal referens. |

```
GET [base]/CapabilityStatement?kind=instance&instantiates=https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation
GET [base]/Endpoint?implements=https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation|1.0.0
```

Flera versioner av samma API-specifikation får finnas samtidigt.
`version` är obligatoriskt och `url` + `version` är unik (REQ-MDL-8).
Sökning på `url` returnerar alla versioner; välj version med `version`,
eller sortera med `_sort=-date` för att få den senaste först:

```
GET [base]/CapabilityStatement?kind=requirements&url=https://fhir.inera.se/ig/patientinformation/ImplementationGuide/inera.patientinformation&_sort=-date
```

API-instanser och ändpunkter bör referera specifikationen som
`url|version`, så att klienten vet exakt vilken version som stöds.

---

### Distribution och synkronisering

Inte del av det ursprungliga informationsunderlaget — tillagt per
stakeholder-beslut: "Distribution/federering kan tänkas på, prenumeration
via fhir-mekanismer för det är bra + grundladdning." (REQ-DIST-*, se
[Mappning till profiler](mappings.html)). Löses med inbyggda FHIR-mekanismer,
inte en egen händelsemodell:

**Prenumeration (händelsebaserad distribution).** Servern BÖR stödja R5:s
topic-baserade `Subscription`, mot ämnet
[SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.html),
som utlöses av `create`/`update`/`delete` på `Organization` respektive
`Endpoint` (REQ-DIST-1). En lokal katalog skapar en `Subscription` som
refererar ämnets url:

```json
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

En notifiering talar bara om *att* något ändrats och vilken interaktion det
gällde — klienten hämtar det aktuella innehållet via
[sök-API:et](CapabilityStatement-tk-search-api.html) (`content: id-only`)
eller får resursen direkt om `content` sätts till `full-resource`.

**Grundladdning och återsynk.** Servern BÖR stödja att sökningar på
`Organization`/`Endpoint` avgränsas med den generella FHIR-sökparametern
`_lastUpdated` (tidsintervall), utan att en separat grundladdnings-operation
behöver definieras (REQ-DIST-2):

```
GET [base]/Endpoint?_lastUpdated=ge2026-01-01&_lastUpdated=lt2026-02-01
```

En lokal katalog som initieras för första gången kan hämta allt (utan
`_lastUpdated`). `_lastUpdated` finns i både sök-API:t och admin-API:t, för
`Organization`, `Endpoint` och `CapabilityStatement`.

**Återsynk.** En katalog som ska återsynkas efter driftstopp BÖR använda
`_history` med `_since` (REQ-DIST-4), samma mönster som IHE mCSD (ITI-91):

```
GET [base]/Organization/_history?_since=2026-10-01T00:00:00Z
GET [base]/Endpoint/_history?_since=2026-10-01T00:00:00Z
```

Till skillnad från en sökning med `_lastUpdated` syns här även borttagna
poster. Bulkexport (`$export`) behövs inte, eftersom datamängderna väntas
vara små.

**Ändrade kopplingar.** Kopplingen "har" lagras i `Organization.endpoint`.
En ändring av den är därför en uppdatering av `Organization`: ny version,
nytt `meta.lastUpdated` och en notifiering (REQ-DIST-5). Det omvända gäller
inte — en ändrad `Endpoint`, inklusive `managingOrganization` ("förvaltar"),
ändrar inte organisationen. En klient som cachar "organisation med
ändpunkter" behöver därför synkronisera båda resurstyperna.

**Rundgång i en dubbelriktad federerad miljö** (en lokal katalogs egna
uppdateringar studsar tillbaka via prenumerationen) är inte löst i detta
utkast — det kräver ett ursprungsmärke på posten, vilket lämnas som en
öppen fråga (REQ-DIST-3, se mappings.html).

---

> **Vägledning för författare:** Roller och deras verksamhetsansvar
> beskrivs under [Roller och ansvar](roles-and-responsibilities.html)
> (Funktionellt). Håll denna sida på ett konkret, tekniskt REST-plan.
