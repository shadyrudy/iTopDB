-- View VLAN Information
SELECT DISTINCT
	VLAN.id AS id,
	VLAN.vlan_tag AS vlan_tag,
	VLAN.description AS description,
	VLAN.org_id AS org_id,
	Organization_org_id.name AS org_name,
	cast( concat( COALESCE ( VLAN.vlan_tag, '' )) AS CHAR charset utf8mb4 ) AS friendlyname,
	cast( concat( COALESCE ( Organization_org_id.name, '' )) AS CHAR charset utf8mb4 ) AS org_id_friendlyname,
	COALESCE (( Organization_org_id.status = 'inactive' ), 0 ) AS org_id_obsolescence_flag 
FROM
	(
		vlan VLAN
		JOIN organization Organization_org_id ON ((
				VLAN.org_id = Organization_org_id.id 
			))) 
WHERE
	(
	0 <> 1)