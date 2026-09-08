# Roller och ansvar - Tjänstekatalogen v0.1.0

## Roller och ansvar

# Roller och ansvar

| | |
| :--- | :--- |
| **Tjänstekatalogen (server)** | Tillhandahåller det administrativa API:et: tar emot och lagrar organisationer och ändpunkter, exponerar sökning (inklusive`listed-by`), och tar emot anrop från Organization Endpoint Writer-system. |
| **Organization Endpoint Writer** | System som tillhandahåller information om organisationers tekniska ändpunkter till tjänstekatalogen — skapar/uppdaterar ändpunkter och kopplar/kopplar loss dem till organisationer. Se[Actor Definition: Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.md). Mönstret är hämtat från och avsett att vara kompatibelt med motsvarande aktör hos andra nationella register över tekniska ändpunkter. |
| **Sökande konsument** | System som söker fram en organisations tekniska ändpunkter, t.ex. inför en integration, via sökparametern`listed-by`på`Endpoint`. |

Förväntningar per roll, uttryckta enligt HL7 FHIR:s terminologi för förmågor (SHALL/SHOULD/MAY):

| | |
| :--- | :--- |
| Tjänstekatalogen (server) | SKA kunna producera`Organization`- och`Endpoint`-resurser som uppfyller[TKOrganization](StructureDefinition-tk-organization.md)respektive[TKEndpoint](StructureDefinition-tk-endpoint.md). SKA stödja sökparametern`listed-by`på`Endpoint`(REQ-SRCH-1). FÅR ta emot anrop till`$add-organization-to-endpoint`och`$remove-organization-from-endpoint`(REQ-WRT-1, REQ-WRT-2). |
| Organization Endpoint Writer | SKA kunna producera`Endpoint`-resurser som uppfyller[TKEndpoint](StructureDefinition-tk-endpoint.md). FÅR anropa`$add-organization-to-endpoint`och`$remove-organization-from-endpoint`för att hantera "har"-relationen till en organisation, som ett alternativ till att skriva direkt till`Organization.endpoint`. |
| Sökande konsument | SKA kunna konsumera och bearbeta`Bundle`-resultat från sökningar på`Endpoint`, inklusive resultat från`listed-by`. |

Fr.o.m. FHIR R5 kan `CapabilityStatement` uttrycka denna typ av förväntningar formellt via elementet `obligations`. Denna IG definierar två formella CapabilityStatements — [administrativt API](CapabilityStatement-tk-admin-api.md) (serverroll) och [Organization Endpoint Writer Capabilities](CapabilityStatement-tk-organization-endpoint-writer.md) (klientroll) — se [CapabilityStatement](capabilitystatement.md) under Implementering. Konformansnivåerna för de två operationerna uttrycks där med `capabilitystatement-expectation` (MAY), i linje med motsvarande aktör hos andra nationella register.

Arbetsflödet för att koppla en ändpunkt till en organisation utlöses av att en Organization Endpoint Writer identifierar en ny eller ändrad ändpunkt hos sin egen organisation. Writern registrerar (eller uppdaterar) ändpunkten i tjänstekatalogen och anropar därefter `$add-organization-to-endpoint` för att lista den under rätt organisation; en sökande konsument kan därefter hitta ändpunkten via `listed-by`. Se [Informationsunderlag](information-basis.md) för den fullständiga, auktoritativa beskrivningen av entiteterna som ingår.

-------

> **Vägledning för författare:** Referera till relevanta nationella föreskrifter eller RIVTA-tjänstekontrakt där det är tillämpligt.

