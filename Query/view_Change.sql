-- View Change
SELECT DISTINCT `Change`.id                                                                               AS id,
                Change_Ticket.operational_status                                                          AS operational_status,
                Change_Ticket.ref                                                                         AS ref,
                Change_Ticket.org_id                                                                      AS org_id,
                Organization_org_id.name                                                                  AS org_name,
                Change_Ticket.caller_id                                                                   AS caller_id,
                Person_caller_id_Contact.name                                                             AS caller_name,
                Change_Ticket.team_id                                                                     AS team_id,
                Team_team_id_Contact.email                                                                AS team_name,
                Change_Ticket.agent_id                                                                    AS agent_id,
                Person_agent_id_Contact.name                                                              AS agent_name,
                Change_Ticket.title                                                                       AS title,
                Change_Ticket.description                                                                 AS description,
                Change_Ticket.start_date                                                                  AS start_date,
                Change_Ticket.end_date                                                                    AS end_date,
                Change_Ticket.last_update                                                                 AS last_update,
                Change_Ticket.close_date                                                                  AS close_date,
                Change_Ticket.private_log                                                                 AS private_log,
                `Change`.status                                                                           AS status,
                `Change`.reason                                                                           AS reason,
                `Change`.requestor_id                                                                     AS requestor_id,
                Person_requestor_id_Contact.email                                                         AS requestor_email,
                `Change`.creation_date                                                                    AS creation_date,
                `Change`.impact                                                                           AS impact,
                `Change`.supervisor_group_id                                                              AS supervisor_group_id,
                Team_supervisor_group_id_Contact.name                                                     AS supervisor_group_name,
                `Change`.supervisor_id                                                                    AS supervisor_id,
                Person_supervisor_id_Contact.email                                                        AS supervisor_email,
                `Change`.manager_group_id                                                                 AS manager_group_id,
                Team_manager_group_id_Contact.name                                                        AS manager_group_name,
                `Change`.manager_id                                                                       AS manager_id,
                Person_manager_id_Contact.email                                                           AS manager_email,
                `Change`.outage                                                                           AS outage,
                `Change`.fallback                                                                         AS fallback,
                `Change`.parent_id                                                                        AS parent_id,
                Change_parent_id_Ticket.ref                                                               AS parent_name,
                Change_Ticket.finalclass                                                                  AS finalclass,
                cast(concat(COALESCE(Change_Ticket.ref, '')) AS CHAR charset utf8mb4)                     AS friendlyname,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4)              AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                                    AS org_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_caller_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_caller_id_Contact.name, '')) AS CHAR charset utf8mb4
                    )                                                                                     AS caller_id_friendlyname,
                COALESCE((Person_caller_id_Contact.status = 'inactive'), 0)                               AS caller_id_obsolescence_flag,
                cast(concat(COALESCE(Team_team_id_Contact.name, '')) AS CHAR charset utf8mb4)             AS team_id_friendlyname,
                COALESCE((Team_team_id_Contact.status = 'inactive'), 0)                                   AS team_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_agent_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_agent_id_Contact.name, '')) AS CHAR charset utf8mb4
                    )                                                                                     AS agent_id_friendlyname,
                COALESCE((Person_agent_id_Contact.status = 'inactive'), 0)                                AS agent_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_requestor_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_requestor_id_Contact.name, '')) AS CHAR charset utf8mb4
                    )                                                                                     AS requestor_id_friendlyname,
                COALESCE((Person_requestor_id_Contact.status = 'inactive'), 0)                            AS requestor_id_obsolescence_flag,
                cast(concat(COALESCE(Team_supervisor_group_id_Contact.name, '')) AS CHAR charset utf8mb4) AS supervisor_group_id_friendlyname,
                COALESCE((Team_supervisor_group_id_Contact.status = 'inactive'), 0)                       AS supervisor_group_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_supervisor_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_supervisor_id_Contact.name, '')) AS CHAR charset utf8mb4
                    )                                                                                     AS supervisor_id_friendlyname,
                COALESCE((Person_supervisor_id_Contact.status = 'inactive'), 0)                           AS supervisor_id_obsolescence_flag,
                cast(concat(COALESCE(Team_manager_group_id_Contact.name, '')) AS CHAR charset utf8mb4)    AS manager_group_id_friendlyname,
                COALESCE((Team_manager_group_id_Contact.status = 'inactive'), 0)                          AS manager_group_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_manager_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_manager_id_Contact.name, '')) AS CHAR charset utf8mb4
                    )                                                                                     AS manager_id_friendlyname,
                COALESCE((Person_manager_id_Contact.status = 'inactive'), 0)                              AS manager_id_obsolescence_flag,
                cast(concat(COALESCE(Change_parent_id_Ticket.ref, '')) AS CHAR charset utf8mb4)           AS parent_id_friendlyname,
                Change_parent_id_Ticket.finalclass                                                        AS parent_id_finalclass_recall,
                Change_Ticket.description_format                                                          AS Changedescription_format,
                Change_Ticket.private_log_index                                                           AS Changeprivate_log_index
FROM (((((((
    `change` `Change`
        LEFT JOIN (
        person Person_requestor_id
            JOIN contact Person_requestor_id_Contact ON ((
            Person_requestor_id.id = Person_requestor_id_Contact.id
            ))) ON ((
        `Change`.requestor_id = Person_requestor_id.id
        )))
    LEFT JOIN contact Team_supervisor_group_id_Contact ON ((
    `Change`.supervisor_group_id = Team_supervisor_group_id_Contact.id
    )))
    LEFT JOIN (
        person Person_supervisor_id
            JOIN contact Person_supervisor_id_Contact ON ((
            Person_supervisor_id.id = Person_supervisor_id_Contact.id
            ))) ON ((
    `Change`.supervisor_id = Person_supervisor_id.id
    )))
    LEFT JOIN contact Team_manager_group_id_Contact ON ((
    `Change`.manager_group_id = Team_manager_group_id_Contact.id
    )))
    LEFT JOIN (
        person Person_manager_id
            JOIN contact Person_manager_id_Contact ON ((
            Person_manager_id.id = Person_manager_id_Contact.id
            ))) ON ((
    `Change`.manager_id = Person_manager_id.id
    )))
    LEFT JOIN ticket Change_parent_id_Ticket ON ((
    `Change`.parent_id = Change_parent_id_Ticket.id
    )))
    JOIN ((((
        ticket Change_Ticket
            JOIN organization Organization_org_id ON ((
            Change_Ticket.org_id = Organization_org_id.id
            )))
        LEFT JOIN (
            person Person_caller_id
                JOIN contact Person_caller_id_Contact ON ((
                Person_caller_id.id = Person_caller_id_Contact.id
                ))) ON ((
        Change_Ticket.caller_id = Person_caller_id.id
        )))
        LEFT JOIN contact Team_team_id_Contact ON ((
        Change_Ticket.team_id = Team_team_id_Contact.id
        )))
        LEFT JOIN (
            person Person_agent_id
                JOIN contact Person_agent_id_Contact ON ((
                Person_agent_id.id = Person_agent_id_Contact.id
                ))) ON ((
        Change_Ticket.agent_id = Person_agent_id.id
        ))) ON ((
    `Change`.id = Change_Ticket.id
    )))
WHERE ((
           0 <> COALESCE((Team_team_id_Contact.finalclass = 'Team'), 1))
    AND (
               0 <> COALESCE((Team_supervisor_group_id_Contact.finalclass = 'Team'), 1))
    AND (
           0 <> COALESCE((Team_manager_group_id_Contact.finalclass = 'Team'), 1))
    AND (
               0 <> COALESCE((Change_parent_id_Ticket.finalclass IN
                              ('RoutineChange', 'ApprovedChange', 'NormalChange', 'EmergencyChange', 'Change')), 1)))