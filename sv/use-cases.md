# Användningsfall - Tjänstekatalogen v0.1.0

## Användningsfall

# Användningsfall

#### Sök ändpunkter för en organisation

En tjänstekonsument känner till en organisations identitet (t.ex. organisationsnummer eller FHIR-id) och behöver hitta samtliga tekniska ändpunkter organisationen listar i tjänstekatalogen, för att t.ex. kunna ansluta till dess API:er. Konsumenten söker `Endpoint` med sökparametern `listed-by` (se [REST-interaktioner och sökparametrar](rest-interactions.md)) och får tillbaka de ändpunkter organisationen "har" — oavsett vem som tekniskt förvaltar respektive ändpunkt. Resultatet listar, per ändpunkt, vilka interoperabilitetsspecifikationer (API:er) den stödjer.

-------

#### Registrera en ny ändpunkt

En Organization Endpoint Writer (se [Roller och ansvar](roles-and-responsibilities.md)) skapar en ny `Endpoint`-resurs i tjänstekatalogens administrativa API, med adress, protokoll, säkerhetsmetod och de interoperabilitetsspecifikationer ändpunkten stödjer.

-------

#### Koppla en organisation till en ändpunkt

En Organization Endpoint Writer känner till att en viss ändpunkt ska listas under en organisation, men saknar (eller vill undvika) skrivrättighet till hela `Organization`-resursen. Writern anropar operationen `$add-organization-to-endpoint` på ändpunkten med organisationen som parameter, vilket lägger till ändpunkten i organisationens `Organization.endpoint`-lista ("har"). Motsvarande operation `$remove-organization-from-endpoint` används för att koppla loss kopplingen. Se [CapabilityStatement](capabilitystatement.md).

-------

> **Vägledning för författare:** Roller och ansvar för de aktörer som deltar i användningsfallen beskrivs under [Roller och ansvar](roles-and-responsibilities.md).

