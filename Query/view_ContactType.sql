-- View Contact Type
SELECT DISTINCT ContactType_Typology.id                                                       AS id,
                ContactType_Typology.name                                                     AS name,
                ContactType_Typology.finalclass                                               AS finalclass,
                cast(concat(COALESCE(ContactType_Typology.name, '')) AS CHAR charset utf8mb4) AS friendlyname
FROM typology ContactType_Typology
WHERE (
          0 <> COALESCE((ContactType_Typology.finalclass = 'ContactType'), 1))
