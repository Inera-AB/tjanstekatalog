# Användningsfall

#### Sök ändpunkter för en organisation

En tjänstekonsument känner till en organisations identitet (t.ex.
organisationsnummer eller FHIR-id) och behöver hitta samtliga tekniska
ändpunkter organisationen listar i tjänstekatalogen, för att t.ex. kunna
ansluta till dess API:er. Konsumenten söker `Endpoint` med sökparametern
`listed-by` (se [REST-interaktioner och sökparametrar](rest-interactions.html))
och får tillbaka de ändpunkter organisationen "har" — oavsett vem som
tekniskt förvaltar respektive ändpunkt. Resultatet listar, per ändpunkt,
vilka interoperabilitetsspecifikationer (API:er) den stödjer.

---

#### Registrera en ny ändpunkt

En organisation, eller dess systemleverantör, skapar en ny `Endpoint`-resurs
i tjänstekatalogens administrativa API, med adress, protokoll, säkerhetsmetod
och de interoperabilitetsspecifikationer ändpunkten stödjer.

---

#### Synkronisera en organisation-ändpunkt-koppling mot EHM

En [Synkroniseringstjänst](ActorDefinition-tk-synkroniseringstjanst.html)
upptäcker, via `listed-by`, att en organisation listar en ändpunkt i
tjänstekatalogen som ännu inte är kopplad hos E-hälsomyndigheten (EHM).
Tjänsten säkerställer att motsvarande ändpunkt finns registrerad hos EHM och
anropar därefter EHM:s operation `$add-organization` — i rollen Organization
Endpoint Writer mot EHM:s API, inte mot tjänstekatalogens — med
organisationens identifierare mappad enligt
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html). Motsvarande
operation `$remove-organization` används för att koppla loss en koppling som
inte längre finns i tjänstekatalogen.

---

> **Vägledning för författare:** Roller och ansvar för de aktörer som deltar
> i användningsfallen beskrivs under
> [Roller och ansvar](roles-and-responsibilities.html).
