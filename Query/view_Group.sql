-- View Group Information
SELECT DISTINCT Group1.id                                                                    AS id,
                Group1.name                                                                  AS name,
                Group1.status                                                                AS status,
                Group1.org_id                                                                AS org_id,
                Organization_org_id.name                                                     AS owner_name,
                Group1.description                                                           AS description,
                Group1.type                                                                  AS type,
                Group1.parent_id                                                             AS parent_id,
                Group_parent_id.name                                                         AS parent_name,
                cast(concat(COALESCE(Group1.name, '')) AS CHAR charset utf8mb4)              AS friendlyname,
                COALESCE((Group1.status = 'obsolete'), 0)                                    AS obsolescence_flag,
                Group1.obsolescence_date                                                     AS obsolescence_date,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4) AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                       AS org_id_obsolescence_flag,
                cast(concat(COALESCE(Group_parent_id.name, '')) AS CHAR charset utf8mb4)     AS parent_id_friendlyname,
                COALESCE((Group_parent_id.status = 'obsolete'), 0)                           AS parent_id_obsolescence_flag
FROM ((
    `group` Group1
        JOIN organization Organization_org_id ON ((
        Group1.org_id = Organization_org_id.id
        )))
    LEFT JOIN `group` Group_parent_id ON ((
    Group1.parent_id = Group_parent_id.id
    )))
WHERE (
          0 <> 1)