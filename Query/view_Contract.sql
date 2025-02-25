-- View Contract
SELECT DISTINCT Contract.id                                                                                    AS id,
                Contract.name                                                                                  AS name,
                Contract.org_id                                                                                AS org_id,
                Organization_org_id.name                                                                       AS organization_name,
                Contract.description                                                                           AS description,
                Contract.start_date                                                                            AS start_date,
                Contract.end_date                                                                              AS end_date,
                Contract.cost                                                                                  AS cost,
                Contract.cost_currency                                                                         AS cost_currency,
                Contract.contracttype_id                                                                       AS contracttype_id,
                ContractType_contracttype_id_Typology.name                                                     AS contracttype_name,
                Contract.billing_frequency                                                                     AS billing_frequency,
                Contract.cost_unit                                                                             AS cost_unit,
                Contract.provider_id                                                                           AS provider_id,
                Organization_provider_id.name                                                                  AS provider_name,
                Contract.status                                                                                AS status,
                Contract.finalclass                                                                            AS finalclass,
                cast(concat(COALESCE(Contract.name, '')) AS CHAR charset utf8mb4)                              AS friendlyname,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4)                   AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                                         AS org_id_obsolescence_flag,
                cast(concat(COALESCE(ContractType_contracttype_id_Typology.name, '')) AS CHAR charset utf8mb4) AS contracttype_id_friendlyname,
                cast(concat(COALESCE(Organization_provider_id.name, '')) AS CHAR charset utf8mb4)              AS provider_id_friendlyname,
                COALESCE((Organization_provider_id.status = 'inactive'), 0)                                    AS provider_id_obsolescence_flag
FROM (((
    contract Contract
        JOIN organization Organization_org_id ON ((
        Contract.org_id = Organization_org_id.id
        )))
    LEFT JOIN typology ContractType_contracttype_id_Typology ON ((
    Contract.contracttype_id = ContractType_contracttype_id_Typology.id
    )))
    JOIN organization Organization_provider_id ON ((
    Contract.provider_id = Organization_provider_id.id
    )))
WHERE (
              0 <> COALESCE((ContractType_contracttype_id_Typology.finalclass = 'ContractType'), 1))
			  