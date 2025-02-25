-- View approved changes
SELECT DISTINCT
	ApprovedChange.id AS id,
	ApprovedChange_Ticket.operational_status AS operational_status,
	ApprovedChange_Ticket.ref AS ref,
	ApprovedChange_Ticket.org_id AS org_id,
	Organization_org_id.name AS org_name,
	ApprovedChange_Ticket.caller_id AS caller_id,
	Person_caller_id_Contact.name AS caller_name,
	ApprovedChange_Ticket.team_id AS team_id,
	Team_team_id_Contact.email AS team_name,
	ApprovedChange_Ticket.agent_id AS agent_id,
	Person_agent_id_Contact.name AS agent_name,
	ApprovedChange_Ticket.title AS title,
	ApprovedChange_Ticket.description AS description,
	ApprovedChange_Ticket.start_date AS start_date,
	ApprovedChange_Ticket.end_date AS end_date,
	ApprovedChange_Ticket.last_update AS last_update,
	ApprovedChange_Ticket.close_date AS close_date,
	ApprovedChange_Ticket.private_log AS private_log,
	ApprovedChange_Change.status AS status,
	ApprovedChange_Change.reason AS reason,
	ApprovedChange_Change.requestor_id AS requestor_id,
	Person_requestor_id_Contact.email AS requestor_email,
	ApprovedChange_Change.creation_date AS creation_date,
	ApprovedChange_Change.impact AS impact,
	ApprovedChange_Change.supervisor_group_id AS supervisor_group_id,
	Team_supervisor_group_id_Contact.name AS supervisor_group_name,
	ApprovedChange_Change.supervisor_id AS supervisor_id,
	Person_supervisor_id_Contact.email AS supervisor_email,
	ApprovedChange_Change.manager_group_id AS manager_group_id,
	Team_manager_group_id_Contact.name AS manager_group_name,
	ApprovedChange_Change.manager_id AS manager_id,
	Person_manager_id_Contact.email AS manager_email,
	ApprovedChange_Change.outage AS outage,
	ApprovedChange_Change.fallback AS fallback,
	ApprovedChange_Change.parent_id AS parent_id,
	Change_parent_id_Ticket.ref AS parent_name,
	ApprovedChange.approval_date AS approval_date,
	ApprovedChange.approval_comment AS approval_comment,
	ApprovedChange_Ticket.finalclass AS finalclass,
	cast( concat( COALESCE ( ApprovedChange_Ticket.ref, '' )) AS CHAR charset utf8mb4 ) AS friendlyname,
	cast( concat( COALESCE ( Organization_org_id.name, '' )) AS CHAR charset utf8mb4 ) AS org_id_friendlyname,
	COALESCE (( Organization_org_id.status = 'inactive' ), 0 ) AS org_id_obsolescence_flag,
	cast(
		concat(
			COALESCE ( Person_caller_id.first_name, '' ),
			COALESCE ( ' ', '' ),
		COALESCE ( Person_caller_id_Contact.name, '' )) AS CHAR charset utf8mb4 
	) AS caller_id_friendlyname,
	COALESCE (( Person_caller_id_Contact.status = 'inactive' ), 0 ) AS caller_id_obsolescence_flag,
	cast( concat( COALESCE ( Team_team_id_Contact.name, '' )) AS CHAR charset utf8mb4 ) AS team_id_friendlyname,
	COALESCE (( Team_team_id_Contact.status = 'inactive' ), 0 ) AS team_id_obsolescence_flag,
	cast(
		concat(
			COALESCE ( Person_agent_id.first_name, '' ),
			COALESCE ( ' ', '' ),
		COALESCE ( Person_agent_id_Contact.name, '' )) AS CHAR charset utf8mb4 
	) AS agent_id_friendlyname,
	COALESCE (( Person_agent_id_Contact.status = 'inactive' ), 0 ) AS agent_id_obsolescence_flag,
	cast(
		concat(
			COALESCE ( Person_requestor_id.first_name, '' ),
			COALESCE ( ' ', '' ),
		COALESCE ( Person_requestor_id_Contact.name, '' )) AS CHAR charset utf8mb4 
	) AS requestor_id_friendlyname,
	COALESCE (( Person_requestor_id_Contact.status = 'inactive' ), 0 ) AS requestor_id_obsolescence_flag,
	cast( concat( COALESCE ( Team_supervisor_group_id_Contact.name, '' )) AS CHAR charset utf8mb4 ) AS supervisor_group_id_friendlyname,
	COALESCE (( Team_supervisor_group_id_Contact.status = 'inactive' ), 0 ) AS supervisor_group_id_obsolescence_flag,
	cast(
		concat(
			COALESCE ( Person_supervisor_id.first_name, '' ),
			COALESCE ( ' ', '' ),
		COALESCE ( Person_supervisor_id_Contact.name, '' )) AS CHAR charset utf8mb4 
	) AS supervisor_id_friendlyname,
	COALESCE (( Person_supervisor_id_Contact.status = 'inactive' ), 0 ) AS supervisor_id_obsolescence_flag,
	cast( concat( COALESCE ( Team_manager_group_id_Contact.name, '' )) AS CHAR charset utf8mb4 ) AS manager_group_id_friendlyname,
	COALESCE (( Team_manager_group_id_Contact.status = 'inactive' ), 0 ) AS manager_group_id_obsolescence_flag,
	cast(
		concat(
			COALESCE ( Person_manager_id.first_name, '' ),
			COALESCE ( ' ', '' ),
		COALESCE ( Person_manager_id_Contact.name, '' )) AS CHAR charset utf8mb4 
	) AS manager_id_friendlyname,
	COALESCE (( Person_manager_id_Contact.status = 'inactive' ), 0 ) AS manager_id_obsolescence_flag,
	cast( concat( COALESCE ( Change_parent_id_Ticket.ref, '' )) AS CHAR charset utf8mb4 ) AS parent_id_friendlyname,
	Change_parent_id_Ticket.finalclass AS parent_id_finalclass_recall,
	ApprovedChange_Ticket.description_format AS ApprovedChangedescription_format,
	ApprovedChange_Ticket.private_log_index AS ApprovedChangeprivate_log_index 
FROM
	((
			change_approved ApprovedChange
			JOIN ((((((
									`change` ApprovedChange_Change
									LEFT JOIN (
										person Person_requestor_id
										JOIN contact Person_requestor_id_Contact ON ((
												Person_requestor_id.id = Person_requestor_id_Contact.id 
												))) ON ((
											ApprovedChange_Change.requestor_id = Person_requestor_id.id 
										)))
								LEFT JOIN contact Team_supervisor_group_id_Contact ON ((
										ApprovedChange_Change.supervisor_group_id = Team_supervisor_group_id_Contact.id 
									)))
							LEFT JOIN (
								person Person_supervisor_id
								JOIN contact Person_supervisor_id_Contact ON ((
										Person_supervisor_id.id = Person_supervisor_id_Contact.id 
										))) ON ((
									ApprovedChange_Change.supervisor_id = Person_supervisor_id.id 
								)))
						LEFT JOIN contact Team_manager_group_id_Contact ON ((
								ApprovedChange_Change.manager_group_id = Team_manager_group_id_Contact.id 
							)))
					LEFT JOIN (
						person Person_manager_id
						JOIN contact Person_manager_id_Contact ON ((
								Person_manager_id.id = Person_manager_id_Contact.id 
								))) ON ((
							ApprovedChange_Change.manager_id = Person_manager_id.id 
						)))
				LEFT JOIN ticket Change_parent_id_Ticket ON ((
						ApprovedChange_Change.parent_id = Change_parent_id_Ticket.id 
						))) ON ((
					ApprovedChange.id = ApprovedChange_Change.id 
				)))
		JOIN ((((
						ticket ApprovedChange_Ticket
						JOIN organization Organization_org_id ON ((
								ApprovedChange_Ticket.org_id = Organization_org_id.id 
							)))
					LEFT JOIN (
						person Person_caller_id
						JOIN contact Person_caller_id_Contact ON ((
								Person_caller_id.id = Person_caller_id_Contact.id 
								))) ON ((
							ApprovedChange_Ticket.caller_id = Person_caller_id.id 
						)))
				LEFT JOIN contact Team_team_id_Contact ON ((
						ApprovedChange_Ticket.team_id = Team_team_id_Contact.id 
					)))
			LEFT JOIN (
				person Person_agent_id
				JOIN contact Person_agent_id_Contact ON ((
						Person_agent_id.id = Person_agent_id_Contact.id 
						))) ON ((
					ApprovedChange_Ticket.agent_id = Person_agent_id.id 
				))) ON ((
				ApprovedChange.id = ApprovedChange_Ticket.id 
			))) 
WHERE
	((
			0 <> COALESCE (( Team_team_id_Contact.finalclass = 'Team' ), 1 )) 
		AND (
		0 <> COALESCE (( Team_supervisor_group_id_Contact.finalclass = 'Team' ), 1 )) 
		AND (
		0 <> COALESCE (( Team_manager_group_id_Contact.finalclass = 'Team' ), 1 )) 
	AND (
	0 <> COALESCE (( Change_parent_id_Ticket.finalclass IN ( 'RoutineChange', 'ApprovedChange', 'NormalChange', 'EmergencyChange', 'Change' )), 1 )))