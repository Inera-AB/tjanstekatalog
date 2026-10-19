Instance: TKOrganizationExample
InstanceOf: TKOrganization
Usage: #example
Title: "Exempel: organisation i tjänstekatalogen"
Description: "Exempel på en organisation som listar (\"har\") en ändpunkt i tjänstekatalogen."

* name = "Exempelregionen"
* identifier[hsaId].system = $hsaid
* identifier[hsaId].value = "SE2321000016-1003"
* identifier[organisationsnummer].system = $organisationsnummer
* identifier[organisationsnummer].value = "2321000016"
* endpoint[0] = Reference(TKEndpointExample)

Instance: TKOrganizationUnitExample
InstanceOf: TKOrganization
Usage: #example
Title: "Exempel: underliggande enhet i tjänstekatalogen"
Description: "Exempel på en vårdenhet under Exempelregionen. Enheten har eget HSA-id men inget eget organisationsnummer; den juridiska personen nås via partOf."

* name = "Exempelregionens vårdcentral"
* identifier[hsaId].system = $hsaid
* identifier[hsaId].value = "SE2321000016-2001"
* partOf = Reference(TKOrganizationExample)
