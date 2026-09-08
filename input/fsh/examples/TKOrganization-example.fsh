Instance: TKOrganizationExample
InstanceOf: TKOrganization
Usage: #example
Title: "Exempel: organisation i tjänstekatalogen"
Description: "Exempel på en organisation som listar (\"har\") en ändpunkt i tjänstekatalogen."

* name = "Exempelregionen"
* identifier[organisationsnummer].system = $organisationsnummer
* identifier[organisationsnummer].value = "232100-0016"
* endpoint[0] = Reference(TKEndpointExample)
