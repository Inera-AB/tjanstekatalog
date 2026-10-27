Instance: TKCentralAdministratorRoleExample
InstanceOf: TKAdministratorRole
Usage: #example
Title: "Exempel: central administratör"
Description: "Exempel på en central administratörsbehörighet. `organization` utelämnas, eftersom behörigheten gäller samtliga organisationer."

* active = true
* period.start = "2026-01-01"
* code = TKAdministratorRoleCS#central-admin "Central administratör"
* practitioner.identifier.system = $hsaid
* practitioner.identifier.value = "SE2321000016-ADM1"
* practitioner.display = "Central administratör, Inera"

Instance: TKLocalAdministratorRoleExample
InstanceOf: TKAdministratorRole
Usage: #example
Title: "Exempel: lokal administratör"
Description: "Exempel på en lokal administratörsbehörighet för Exempelregionen."

* active = true
* period.start = "2026-01-02"
* code = TKAdministratorRoleCS#local-admin "Lokal administratör"
* organization = Reference(TKOrganizationExample)
* practitioner.identifier.system = $hsaid
* practitioner.identifier.value = "SE2321000016-ADM2"
* practitioner.display = "Lokal administratör, Exempelregionen"
