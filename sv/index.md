# Hem - Tjänstekatalogen v0.1.0

## Hem

# Hem

### Tjänstekatalogen

Tjänstekatalogen är Ineras register över organisationers tekniska ändpunkter (endpoints) och de API:er dessa ändpunkter tillgängliggör. Denna IG definierar dels ett sökgränssnitt för att slå upp en organisations ändpunkter, dels ett administrativt API för att registrera organisationer, ändpunkter och kopplingen mellan dem.

-------

### Omfattning

Denna IG omfattar:

* **Sökning av tekniska ändpunkter per organisation** — hitta samtliga ändpunkter som en organisation listar i sin katalogpost (`Organization.endpoint`, "har"), skilt från vem som tekniskt förvaltar en given ändpunkt (`Endpoint.managingOrganization`, "förvaltar"). Se [Kravkatalog](requirements.md) (REQ-SRCH-*) och [REST-interaktioner och sökparametrar](rest-interactions.md).
* **Ett administrativt API** för att skapa, uppdatera, läsa och söka organisationer och ändpunkter i tjänstekatalogen. Se [CapabilityStatement](capabilitystatement.md).
* **Aktören Organization Endpoint Writer** — ett system som tillhandahåller ändpunktsinformation till tjänstekatalogen, inklusive att koppla/koppla loss en organisation från en ändpunkt via operationerna `$add-organization-to-endpoint` och `$remove-organization-from-endpoint`. Se [Roller och ansvar](roles-and-responsibilities.md).

Denna IG realiserar en delmängd av ett bredare informationsunderlag som även omfattar entiteterna Indexpost, Vård- och omsorgstagare och API-specifikation. Dessa är modellerade (se [Mappning till profiler](mappings.md)) och spårbara i [Kravkatalog](requirements.md), men REST-exponering av dem i det administrativa API:et ligger utanför detta utkast — se "Avvikelser och tillägg" i [Mappning till profiler](mappings.md) för motivering per entitet.

Denna IG är, liksom motsvarande register hos andra aktörer i den svenska e-hälsoinfrastrukturen, avsedd att kunna konsumeras av och samverka med andra nationella register över tekniska ändpunkter.

-------

### Syfte

Idag går det inte att via standardsökparametern `organization` på `Endpoint` få fram de ändpunkter en organisation **listar** i tjänstekatalogen — den parametern matchar endast `Endpoint.managingOrganization`, dvs. vem som tekniskt förvaltar ändpunkten. Syftet med denna IG är att göra det möjligt att slå upp "vilka ändpunkter hör till organisation X enligt tjänstekatalogen" med en enda, väldokumenterad sökning, samt att ge tjänstekatalogens administrativa API en formell, kravspårad definition.

-------

### Målgrupp

IG:n vänder sig i första hand till systemutvecklare och integrationsarkitekter hos organisationer som ska registrera sina tekniska ändpunkter i tjänstekatalogen (Organization Endpoint Writer), samt till konsumenter som söker fram ändpunkter. Nya läsare hänvisas till [Inledning](introduction.md); implementatörer till [REST-interaktioner och sökparametrar](rest-interactions.md) och [CapabilityStatement](capabilitystatement.md).

-------

### Terminologi

På [Inera Terminologitjänst](https://www.inera.se/tjanster/alla-tjanster-a-o/terminologitjanst-for-nationell-e-halsa/) finns alla refererade kodsystem och värdemängder som utvecklats av Inera. Kodsystemet för `Ändpunkt.säkerhetsmetod` som definieras i denna IG är preliminärt (se [Kravkatalog](requirements.md), REQ-END-6) och har ännu inte förvaltningsöverlämnats dit.

-------

### Beroenden

Denna IG bygger på FHIR R5 (5.0.0) och har inget beroende till SE-core (som för närvarande är definierat för FHIR R4).

-------

### Dokumentation

Mer information om FHIR på Inera finns [här](https://fhir.inera.se/). FHIR på Inera är en del av RIVTA – referensarkitekturen för svensk hälso- och sjukvård.

Information om hur denna IG förvaltas finns under [Om](about.md).

-------

### Om mallens struktur

Menyn i denna IG är medvetet utformad efter samma mönster som europeiska specifikationer, t.ex. FHIR ePS (Hem / Inledning / Funktionellt / Implementering / Om / Artefakter), för att ge implementatörer en igenkännbar ingång oavsett vilken europeisk FHIR-IG de arbetar med.

Informationsmodellen för denna förmåga publiceras externt och fristående i en egen informationsspecifikation (se [Informationsunderlag](information-basis.md) under Funktionellt) snarare än i denna IG. Det håller informationsspecifikationen som den auktoritativa källan för begrepp och informationsstruktur, och undviker att IG:n och specifikationen glider isär över tid.

