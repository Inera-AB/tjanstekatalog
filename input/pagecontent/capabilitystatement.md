# CapabilityStatement

Denna IG definierar två formella CapabilityStatements:

| CapabilityStatement | Roll | Beskriver |
|---|---|---|
| [Tjänstekatalogen: administrativt API](CapabilityStatement-tk-admin-api.html) | Server | Tjänstekatalogens egna REST-förmågor: registrering och sökning av [TKOrganization](StructureDefinition-tk-organization.html) och [TKEndpoint](StructureDefinition-tk-endpoint.html) (inklusive sökparametern `listed-by`), samt mottagning av de två skrivoperationerna. |
| [Organization Endpoint Writer Capabilities](CapabilityStatement-tk-organization-endpoint-writer.html) | Klient | De FHIR REST-förmågor som aktören [Organization Endpoint Writer](ActorDefinition-tk-organization-endpoint-writer.html) ska stödja: `$add-organization-to-endpoint` och `$remove-organization-from-endpoint` på `Endpoint`, båda med konformansnivå MAY. Strukturen är hämtad från motsvarande "Organization Endpoint Writer Capabilities"-mönster hos andra nationella register över tekniska ändpunkter, anpassad till tjänstekatalogens egna operationer. |

Fr.o.m. FHIR R5 kan `CapabilityStatement` uttrycka formella konformanskrav
per roll via elementet `obligations`, som ett maskinläsbart alternativ eller
komplement till de förväntningar som beskrivs under
[Roller och ansvar](roles-and-responsibilities.html) under Funktionellt. De
två operationerna ovan uttrycker sin konformansnivå (MAY) med den relaterade
extensionen `capabilitystatement-expectation` snarare än `obligations`, i
linje med mönstret i den refererade Organization Endpoint Writer-modellen.
