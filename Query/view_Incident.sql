-- View Incident Information
SELECT DISTINCT Incident.id                                                                                       AS id,
                Incident_Ticket.operational_status                                                                AS operational_status,
                Incident_Ticket.ref                                                                               AS ref,
                Incident_Ticket.org_id                                                                            AS org_id,
                Organization_org_id.name                                                                          AS org_name,
                Incident_Ticket.caller_id                                                                         AS caller_id,
                Person_caller_id_Contact.name                                                                     AS caller_name,
                Incident_Ticket.team_id                                                                           AS team_id,
                Team_team_id_Contact.email                                                                        AS team_name,
                Incident_Ticket.agent_id                                                                          AS agent_id,
                Person_agent_id_Contact.name                                                                      AS agent_name,
                Incident_Ticket.title                                                                             AS title,
                Incident_Ticket.description                                                                       AS description,
                Incident_Ticket.start_date                                                                        AS start_date,
                Incident_Ticket.end_date                                                                          AS end_date,
                Incident_Ticket.last_update                                                                       AS last_update,
                Incident_Ticket.close_date                                                                        AS close_date,
                Incident_Ticket.private_log                                                                       AS private_log,
                Incident.status                                                                                   AS status,
                Incident.impact                                                                                   AS impact,
                Incident.priority                                                                                 AS priority,
                Incident.urgency                                                                                  AS urgency,
                Incident.origin                                                                                   AS origin,
                Incident.service_id                                                                               AS service_id,
                Service_service_id.name                                                                           AS service_name,
                Incident.servicesubcategory_id                                                                    AS servicesubcategory_id,
                ServiceSubcategory_servicesubcategory_id.name                                                     AS servicesubcategory_name,
                Incident.escalation_flag                                                                          AS escalation_flag,
                Incident.escalation_reason                                                                        AS escalation_reason,
                Incident.assignment_date                                                                          AS assignment_date,
                Incident.resolution_date                                                                          AS resolution_date,
                Incident.last_pending_date                                                                        AS last_pending_date,
                Incident.cumulatedpending_timespent                                                               AS cumulatedpending,
                Incident.tto_timespent                                                                            AS tto,
                Incident.ttr_timespent                                                                            AS ttr,
                Incident.tto_100_deadline                                                                         AS tto_escalation_deadline,
                Incident.tto_100_passed                                                                           AS sla_tto_passed,
                Incident.tto_100_overrun                                                                          AS sla_tto_over,
                Incident.ttr_100_deadline                                                                         AS ttr_escalation_deadline,
                Incident.ttr_100_passed                                                                           AS sla_ttr_passed,
                Incident.ttr_100_overrun                                                                          AS sla_ttr_over,
                Incident.time_spent                                                                               AS time_spent,
                Incident.resolution_code                                                                          AS resolution_code,
                Incident.solution                                                                                 AS solution,
                Incident.pending_reason                                                                           AS pending_reason,
                Incident.parent_incident_id                                                                       AS parent_incident_id,
                Incident_parent_incident_id_Ticket.ref                                                            AS parent_incident_ref,
                Incident.parent_problem_id                                                                        AS parent_problem_id,
                Problem_parent_problem_id_Ticket.ref                                                              AS parent_problem_ref,
                Incident.parent_change_id                                                                         AS parent_change_id,
                Change_parent_change_id_Ticket.ref                                                                AS parent_change_ref,
                Incident.public_log                                                                               AS public_log,
                Incident.user_satisfaction                                                                        AS user_satisfaction,
                Incident.user_commment                                                                            AS user_comment,
                Incident_Ticket.finalclass                                                                        AS finalclass,
                cast(concat(COALESCE(Incident_Ticket.ref, '')) AS CHAR charset utf8mb4)                           AS friendlyname,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4)                      AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                                            AS org_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_caller_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_caller_id_Contact.name, '')) AS CHAR charset utf8mb4
                )                                                                                                 AS caller_id_friendlyname,
                COALESCE((Person_caller_id_Contact.status = 'inactive'), 0)                                       AS caller_id_obsolescence_flag,
                cast(concat(COALESCE(Team_team_id_Contact.name, '')) AS CHAR charset utf8mb4)                     AS team_id_friendlyname,
                COALESCE((Team_team_id_Contact.status = 'inactive'), 0)                                           AS team_id_obsolescence_flag,
                cast(
                        concat(
                                COALESCE(Person_agent_id.first_name, ''),
                                COALESCE(' ', ''),
                                COALESCE(Person_agent_id_Contact.name, '')) AS CHAR charset utf8mb4
                )                                                                                                 AS agent_id_friendlyname,
                COALESCE((Person_agent_id_Contact.status = 'inactive'), 0)                                        AS agent_id_obsolescence_flag,
                cast(concat(COALESCE(Service_service_id.name, '')) AS CHAR charset utf8mb4)                       AS service_id_friendlyname,
                cast(concat(COALESCE(ServiceSubcategory_servicesubcategory_id.name, '')) AS CHAR charset utf8mb4) AS servicesubcategory_id_friendlyname,
                cast(concat(COALESCE(Incident_parent_incident_id_Ticket.ref, '')) AS CHAR charset utf8mb4)        AS parent_incident_id_friendlyname,
                cast(concat(COALESCE(Problem_parent_problem_id_Ticket.ref, '')) AS CHAR charset utf8mb4)          AS parent_problem_id_friendlyname,
                cast(concat(COALESCE(Change_parent_change_id_Ticket.ref, '')) AS CHAR charset utf8mb4)            AS parent_change_id_friendlyname,
                Change_parent_change_id_Ticket.finalclass                                                         AS parent_change_id_finalclass_recall,
                Incident.cumulatedpending_started                                                                 AS Incidentcumulatedpending_started,
                Incident.cumulatedpending_laststart                                                               AS Incidentcumulatedpending_laststart,
                Incident.cumulatedpending_stopped                                                                 AS Incidentcumulatedpending_stopped,
                Incident.tto_started                                                                              AS Incidenttto_started,
                Incident.tto_laststart                                                                            AS Incidenttto_laststart,
                Incident.tto_stopped                                                                              AS Incidenttto_stopped,
                Incident.tto_75_deadline                                                                          AS Incidenttto_75_deadline,
                Incident.tto_75_passed                                                                            AS Incidenttto_75_passed,
                Incident.tto_75_triggered                                                                         AS Incidenttto_75_triggered,
                Incident.tto_75_overrun                                                                           AS Incidenttto_75_overrun,
                Incident.tto_100_deadline                                                                         AS Incidenttto_100_deadline,
                Incident.tto_100_passed                                                                           AS Incidenttto_100_passed,
                Incident.tto_100_triggered                                                                        AS Incidenttto_100_triggered,
                Incident.tto_100_overrun                                                                          AS Incidenttto_100_overrun,
                Incident.ttr_started                                                                              AS Incidentttr_started,
                Incident.ttr_laststart                                                                            AS Incidentttr_laststart,
                Incident.ttr_stopped                                                                              AS Incidentttr_stopped,
                Incident.ttr_75_deadline                                                                          AS Incidentttr_75_deadline,
                Incident.ttr_75_passed                                                                            AS Incidentttr_75_passed,
                Incident.ttr_75_triggered                                                                         AS Incidentttr_75_triggered,
                Incident.ttr_75_overrun                                                                           AS Incidentttr_75_overrun,
                Incident.ttr_100_deadline                                                                         AS Incidentttr_100_deadline,
                Incident.ttr_100_passed                                                                           AS Incidentttr_100_passed,
                Incident.ttr_100_triggered                                                                        AS Incidentttr_100_triggered,
                Incident.ttr_100_overrun                                                                          AS Incidentttr_100_overrun,
                Incident.public_log_index                                                                         AS Incidentpublic_log_index,
                Incident_Ticket.description_format                                                                AS Incidentdescription_format,
                Incident_Ticket.private_log_index                                                                 AS Incidentprivate_log_index
FROM ((((((
    ticket_incident Incident
        LEFT JOIN service Service_service_id ON ((
        Incident.service_id = Service_service_id.id
        )))
    LEFT JOIN servicesubcategory ServiceSubcategory_servicesubcategory_id ON ((
    Incident.servicesubcategory_id = ServiceSubcategory_servicesubcategory_id.id
    )))
    LEFT JOIN ticket Incident_parent_incident_id_Ticket ON ((
    Incident.parent_incident_id = Incident_parent_incident_id_Ticket.id
    )))
    LEFT JOIN ticket Problem_parent_problem_id_Ticket ON ((
    Incident.parent_problem_id = Problem_parent_problem_id_Ticket.id
    )))
    LEFT JOIN ticket Change_parent_change_id_Ticket ON ((
    Incident.parent_change_id = Change_parent_change_id_Ticket.id
    )))
    JOIN ((((
        ticket Incident_Ticket
            JOIN organization Organization_org_id ON ((
            Incident_Ticket.org_id = Organization_org_id.id
            )))
        LEFT JOIN (
            person Person_caller_id
                JOIN contact Person_caller_id_Contact ON ((
                Person_caller_id.id = Person_caller_id_Contact.id
                ))) ON ((
        Incident_Ticket.caller_id = Person_caller_id.id
        )))
        LEFT JOIN contact Team_team_id_Contact ON ((
        Incident_Ticket.team_id = Team_team_id_Contact.id
        )))
        LEFT JOIN (
            person Person_agent_id
                JOIN contact Person_agent_id_Contact ON ((
                Person_agent_id.id = Person_agent_id_Contact.id
                ))) ON ((
        Incident_Ticket.agent_id = Person_agent_id.id
        ))) ON ((
    Incident.id = Incident_Ticket.id
    )))
WHERE ((
           0 <> COALESCE((Team_team_id_Contact.finalclass = 'Team'), 1))
    AND (
           0 <> COALESCE((Incident_parent_incident_id_Ticket.finalclass = 'Incident'), 1))
    AND (
           0 <> COALESCE((Problem_parent_problem_id_Ticket.finalclass = 'Problem'), 1))
    AND (
           0 <> COALESCE((Change_parent_change_id_Ticket.finalclass IN
                          ('RoutineChange', 'ApprovedChange', 'NormalChange', 'EmergencyChange', 'Change')), 1)))