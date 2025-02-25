-- View Contract Type
SELECT DISTINCT ContractType_Typology.id                                                       AS id,
                ContractType_Typology.name                                                     AS name,
                ContractType_Typology.finalclass                                               AS finalclass,
                cast(concat(COALESCE(ContractType_Typology.name, '')) AS CHAR charset utf8mb4) AS friendlyname
FROM typology ContractType_Typology
WHERE (
          0 <> COALESCE((ContractType_Typology.finalclass = 'ContractType'), 1))