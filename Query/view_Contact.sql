-- View Contact
SELECT DISTINCT Contact.id                                                                   AS id,
                Contact.name                                                                 AS name,
                Contact.status                                                               AS status,
                Contact.org_id                                                               AS org_id,
                Organization_org_id.name                                                     AS org_name,
                Contact.email                                                                AS email,
                Contact.phone                                                                AS phone,
                Contact.notify                                                               AS notify,
                Contact.function                                                             AS function,
                Contact.finalclass                                                           AS finalclass,
                IF
                    ((
                         Contact.finalclass IN ('Team', 'Contact')),
                     cast(concat(COALESCE(Contact.name, '')) AS CHAR charset utf8mb4),
                     cast(
                             concat(
                                     COALESCE(Contact_poly_Person.first_name, ''),
                                     COALESCE(' ', ''),
                                     COALESCE(Contact.name, '')) AS CHAR charset utf8mb4
                         ))                                                                  AS friendlyname,
                COALESCE((Contact.status = 'inactive'), 0)                                   AS obsolescence_flag,
                Contact.obsolescence_date                                                    AS obsolescence_date,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4) AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                       AS org_id_obsolescence_flag
FROM ((
    contact Contact
        JOIN organization Organization_org_id ON ((
        Contact.org_id = Organization_org_id.id
        )))
    LEFT JOIN person Contact_poly_Person ON ((
    Contact.id = Contact_poly_Person.id
    )))
WHERE (
          0 <> 1)