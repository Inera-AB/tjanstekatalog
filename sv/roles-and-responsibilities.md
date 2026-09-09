# Roller och ansvar - Tjänstekatalogen v0.1.0

## Roller och ansvar

# Roller och ansvar

| | |
| :--- | :--- |
| **Tjänstekatalogen (server)** | Tillhandahåller det administrativa API:et: tar emot och lagrar organisationer och ändpunkter, exponerar sökning (inklusive`listed-by`). |
| **Synkroniseringstjänst** | System som läser organisationer och tekniska ändpunkter från tjänstekatalogens administrativa API, och håller E-hälsomyndighetens (EHM) nationella register — Swedish Medical Record Index And Endpoint Registry — synkroniserat genom att i**EHM:s**system anta rollen**Organization Endpoint Writer**. Se[ActorDefinition: Synkroniseringstjänst](ActorDefinition-tk-synkroniseringstjanst.md)och[Mappning mot EHM:s Organization Endpoint Writer](mappings.md)för hur data mappas mellan de två gränssnitten. |
| **Sökande konsument** | System som söker fram en organisations tekniska ändpunkter, t.ex. inför en integration, via sökparametern`listed-by`på`Endpoint`. Använder det externt exponerade[sök-API:et](CapabilityStatement-tk-search-api.md)(via gateway) — se säkerhet och behörighet i security.html. |
| **Lokal administratör**(`local-admin`) | Får registrera och ändra poster i tjänstekatalogen för den eller de organisationer administratören representerar. Behörigheten registreras som[TKAdministratorRole](StructureDefinition-tk-administrator-role.md)(`organization`satt). Inte del av det ursprungliga informationsunderlaget — se REQ-ADM-* och mappings.html. |
| **Central administratör**(`central-admin`) | Utöver lokal administratörs rättigheter: får administrera andra administratörers behörigheter, för samtliga organisationer. Registreras som[TKAdministratorRole](StructureDefinition-tk-administrator-role.md)med`organization`medvetet utelämnad (= alla). Se REQ-ADM-*. |
| **Lokal katalog** | System som håller en lokal kopia av (delar av) tjänstekatalogens innehåll aktuell, antingen genom att prenumerera på[SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.md)eller genom periodisk grundladdning/återsynk via`_lastUpdated`. Se "Distribution och synkronisering" i rest-interactions.html och REQ-DIST-*. |

Organization Endpoint Writer är alltså inte en roll denna IG:s administrativa API själv tar emot anrop i — det är **EHM:s** aktörsroll, definierad i deras egen IG ([Swedish Medical Record Index And Endpoint Registry](https://simplifier.net/guide/SwedishMedicalRecordIndexAndEndpointRegistry/)). Synkroniseringstjänsten är den part som antar den rollen mot EHM, efter att först ha läst data härifrån.

Förväntningar per roll, uttryckta enligt HL7 FHIR:s terminologi för förmågor (SHALL/SHOULD/MAY):

| | |
| :--- | :--- |
| Tjänstekatalogen (server) | SKA kunna producera`Organization`- och`Endpoint`-resurser som uppfyller[TKOrganization](StructureDefinition-tk-organization.md)respektive[TKEndpoint](StructureDefinition-tk-endpoint.md). SKA stödja sökparametern`listed-by`på`Endpoint`(REQ-SRCH-1). SKA exponera sökning externt via gateway och hålla skrivinteraktioner internt (REQ-EXP-1/2). BÖR stödja prenumeration och grundladdning för distribution till lokala kataloger (REQ-DIST-1/2). |
| Synkroniseringstjänst | SKA läsa organisationer/ändpunkter härifrån (REQ-WRT-1). FÅR anropa EHM:s`$add-organization`/`$remove-organization`för att hantera "har"-relationen i EHM:s register (REQ-WRT-2, REQ-WRT-3), med data mappad enligt[mappningstabellen](mappings.md)(REQ-WRT-4, REQ-WRT-5). |
| Sökande konsument | SKA kunna konsumera och bearbeta`Bundle`-resultat från sökningar på`Endpoint`, inklusive resultat från`listed-by`. |
| Lokal/central administratör | SKA ha en registrerad[TKAdministratorRole](StructureDefinition-tk-administrator-role.md)med rätt administrationsnivå (REQ-ADM-1); lokal administratör SKA representera den organisation vars poster ändras (REQ-ADM-2). |
| Lokal katalog | BÖR hålla sin kopia aktuell via prenumeration på[SubscriptionTopic: tk-organization-endpoint-changes](SubscriptionTopic-tk-organization-endpoint-changes.md)och/eller grundladdning/återsynk via`_lastUpdated`(REQ-DIST-1/2). |

Fr.o.m. FHIR R5 kan `CapabilityStatement` uttrycka denna typ av förväntningar formellt via elementet `obligations`. Denna IG definierar ett formellt CapabilityStatement för sin egen serverroll — [administrativt API](CapabilityStatement-tk-admin-api.md) — se [CapabilityStatement](capabilitystatement.md) under Implementering. EHM:s Organization Endpoint Writer Capabilities är ett separat CapabilityStatement, definierat och publicerat av EHM i deras egen IG, inte här.

Arbetsflödet för att koppla en ändpunkt till en organisation utlöses av att Synkroniseringstjänsten upptäcker en ny eller ändrad koppling i tjänstekatalogen (t.ex. via `listed-by`). Den säkerställer att motsvarande ändpunkt finns hos EHM och anropar därefter EHM:s `$add-organization` för att koppla rätt organisation till den, enligt mappningen i [Mappning mot EHM:s Organization Endpoint Writer](mappings.md); en sökande konsument kan hela tiden hitta ändpunkten i tjänstekatalogen via `listed-by`, oberoende av EHM-synkroniseringen. Se [Informationsunderlag](information-basis.md) för den fullständiga, auktoritativa beskrivningen av entiteterna som ingår.

-------

> **Vägledning för författare:** Referera till relevanta nationella föreskrifter eller RIVTA-tjänstekontrakt där det är tillämpligt.

