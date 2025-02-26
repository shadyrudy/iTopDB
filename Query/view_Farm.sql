-- View Farm Information
SELECT DISTINCT Farm.id                                                                      AS id,
                Farm_FunctionalCI.name                                                       AS name,
                Farm_FunctionalCI.description                                                AS description,
                Farm_FunctionalCI.org_id                                                     AS org_id,
                Organization_org_id.name                                                     AS organization_name,
                Farm_FunctionalCI.business_criticity                                         AS business_criticity,
                Farm_FunctionalCI.move2production                                            AS move2production,
                Farm_VirtualDevice.status                                                    AS status,
                Farm.redundancy                                                              AS redundancy,
                Farm_FunctionalCI.finalclass                                                 AS finalclass,
                cast(concat(COALESCE(Farm_FunctionalCI.name, '')) AS CHAR charset utf8mb4)   AS friendlyname,
                COALESCE((Farm_VirtualDevice.status = 'obsolete'), 0)                        AS obsolescence_flag,
                Farm_FunctionalCI.obsolescence_date                                          AS obsolescence_date,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4) AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                       AS org_id_obsolescence_flag
FROM ((
    farm Farm
        JOIN virtualdevice Farm_VirtualDevice ON ((
        Farm.id = Farm_VirtualDevice.id
        )))
    JOIN (
        functionalci Farm_FunctionalCI
            JOIN organization Organization_org_id ON ((
            Farm_FunctionalCI.org_id = Organization_org_id.id
            ))) ON ((
    Farm.id = Farm_FunctionalCI.id
    )))
WHERE (
          0 <> 1)