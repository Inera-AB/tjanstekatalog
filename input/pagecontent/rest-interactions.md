# REST-interaktioner och sökparametrar

| Resurs/Profil | Interaktion | Sökparametrar |
|----------------|-------------|----------------|
| [TKOrganization](StructureDefinition-tk-organization.html) | read, search-type, create, update | `identifier`, `name` |
| [TKEndpoint](StructureDefinition-tk-endpoint.html) | read, search-type, create, update | `organization` (standard, "förvaltar"), [`listed-by`](SearchParameter-tk-endpoint-listed-by.html) (egen, "har"), `status` |

Tjänstekatalogens administrativa API exponerar inga egna skrivoperationer för
att koppla organisation och ändpunkt — det görs istället hos
E-hälsomyndigheten (EHM), av en Synkroniseringstjänst som läser härifrån. Se
[Mappning mot EHM:s Organization Endpoint Writer](mappings.html) för EHM:s
`$add-organization`/`$remove-organization`.

---

### Sök ändpunkter för en organisation

Hämta samtliga ändpunkter en organisation listar ("har"):

```
GET [base]/Endpoint?listed-by=Organization/123
```

eller med identifierare (kedjad sökning):

```
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

---

> **Vägledning för författare:** Roller och deras verksamhetsansvar
> beskrivs under [Roller och ansvar](roles-and-responsibilities.html)
> (Funktionellt). Håll denna sida på ett konkret, tekniskt REST-plan.
