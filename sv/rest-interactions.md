# REST-interaktioner och sökparametrar - Tjänstekatalogen v0.1.0

## REST-interaktioner och sökparametrar

# REST-interaktioner och sökparametrar

| | | |
| :--- | :--- | :--- |
| [TKOrganization](StructureDefinition-tk-organization.md) | read, search-type, create, update | `identifier`,`name` |
| [TKEndpoint](StructureDefinition-tk-endpoint.md) | read, search-type, create, update | `organization`(standard, "förvaltar"),[`listed-by`](SearchParameter-tk-endpoint-listed-by.md)(egen, "har"),`status` |
| [TKEndpoint](StructureDefinition-tk-endpoint.md) | operation`$add-organization-to-endpoint`(instans) | — |
| [TKEndpoint](StructureDefinition-tk-endpoint.md) | operation`$remove-organization-from-endpoint`(instans) | — |

-------

### Sök ändpunkter för en organisation

Hämta samtliga ändpunkter en organisation listar ("har"):

```
GET [base]/Endpoint?listed-by=Organization/123

```

eller med identifierare (kedjad sökning):

```
GET [base]/Endpoint?listed-by.identifier=urn:oid:1.2.752.29.4.13|232100-0016

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

-------

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

Se [OperationDefinition: add-organization-to-endpoint](OperationDefinition-tk-endpoint-add-organization-to-endpoint.md) och [OperationDefinition: remove-organization-from-endpoint](OperationDefinition-tk-endpoint-remove-organization-from-endpoint.md).

-------

> **Vägledning för författare:** Roller och deras verksamhetsansvar beskrivs under [Roller och ansvar](roles-and-responsibilities.md) (Funktionellt). Håll denna sida på ett konkret, tekniskt REST-plan.

