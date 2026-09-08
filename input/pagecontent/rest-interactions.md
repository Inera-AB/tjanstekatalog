# REST-interaktioner och sökparametrar

| Resurs/Profil | Interaktion | Sökparametrar |
|----------------|-------------|----------------|
| [TKOrganization](StructureDefinition-tk-organization.html) | read, search-type, create, update | `identifier`, `name` |
| [TKEndpoint](StructureDefinition-tk-endpoint.html) | read, search-type, create, update | `organization` (standard, "förvaltar"), [`listed-by`](SearchParameter-tk-endpoint-listed-by.html) (egen, "har"), `status` |
| [TKEndpoint](StructureDefinition-tk-endpoint.html) | operation `$add-organization-to-endpoint` (instans) | — |
| [TKEndpoint](StructureDefinition-tk-endpoint.html) | operation `$remove-organization-from-endpoint` (instans) | — |

---

### Sök ändpunkter för en organisation

Hämta samtliga ändpunkter en organisation listar ("har"):

```
GET [base]/Endpoint?listed-by=Organization/123
```

eller med identifierare (kedjad sökning):

```
GET [base]/Endpoint?listed-by.identifier=urn:oid:1.2.752.29.4.13|232100-0016
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

### Koppla/koppla loss organisation och ändpunkt

```
POST [base]/Endpoint/456/$add-organization-to-endpoint
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [{
    "name": "organization",
    "valueReference": { "reference": "Organization/123" }
  }]
}
```

```
POST [base]/Endpoint/456/$remove-organization-from-endpoint
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [{
    "name": "organization",
    "valueReference": { "reference": "Organization/123" }
  }]
}
```

Se [OperationDefinition: add-organization-to-endpoint](OperationDefinition-tk-endpoint-add-organization-to-endpoint.html)
och [OperationDefinition: remove-organization-from-endpoint](OperationDefinition-tk-endpoint-remove-organization-from-endpoint.html).

---

> **Vägledning för författare:** Roller och deras verksamhetsansvar
> beskrivs under [Roller och ansvar](roles-and-responsibilities.html)
> (Funktionellt). Håll denna sida på ett konkret, tekniskt REST-plan.
