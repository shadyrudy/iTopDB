-- View Location Information
SELECT DISTINCT Location.id                                                                  AS id,
                Location.name                                                                AS name,
                Location.status                                                              AS status,
                Location.org_id                                                              AS org_id,
                Organization_org_id.name                                                     AS org_name,
                Location.address                                                             AS address,
                Location.postal_code                                                         AS postal_code,
                Location.city                                                                AS city,
                Location.country                                                             AS country,
                cast(concat(COALESCE(Location.name, '')) AS CHAR charset utf8mb4)            AS friendlyname,
                COALESCE((Location.status = 'inactive'), 0)                                  AS obsolescence_flag,
                Location.obsolescence_date                                                   AS obsolescence_date,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4) AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                       AS org_id_obsolescence_flag
FROM (
         location Location
             JOIN organization Organization_org_id ON ((
             Location.org_id = Organization_org_id.id
             )))
WHERE (
          0 <> 1)