Instance: TKCentralAdministratorRoleExample
InstanceOf: TKAdministratorRole
Usage: #example
Title: "Exempel: central administratör"
Description: "Exempel på en central administratörsbehörighet. `organization` utelämnas, eftersom behörigheten gäller samtliga organisationer."

* code = TKAdministratorRoleCS#central-admin "Central administratör"
* practitioner.identifier.system = $hsaid
* practitioner.identifier.value = "SE2321000016-ADM1"
* practitioner.display = "Central administratör, Inera"

Instance: TKLocalAdministratorRoleExample
InstanceOf: TKAdministratorRole
Usage: #example
Title: "Exempel: lokal administratör"
Description: "Exempel på en lokal administratörsbehörighet för Exempelregionen."

* code = TKAdministratorRoleCS#local-admin "Lokal administratör"
* organization = Reference(TKOrganizationExample)
* practitioner.identifier.system = $hsaid
* practitioner.identifier.value = "SE2321000016-ADM2"
* practitioner.display = "Lokal administratör, Exempelregionen"
