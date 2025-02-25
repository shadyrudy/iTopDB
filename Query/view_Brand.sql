-- View Brand information
SELECT DISTINCT Brand_Typology.id                                                       AS id,
                Brand_Typology.name                                                     AS name,
                Brand_Typology.finalclass                                               AS finalclass,
                cast(concat(COALESCE(Brand_Typology.name, '')) AS CHAR charset utf8mb4) AS friendlyname
FROM typology Brand_Typology
WHERE (
          0 <> COALESCE((Brand_Typology.finalclass = 'Brand'), 1))