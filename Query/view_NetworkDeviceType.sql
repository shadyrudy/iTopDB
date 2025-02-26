-- View Network Device Type Information
SELECT DISTINCT NetworkDeviceType_Typology.id                                                       AS id,
                NetworkDeviceType_Typology.name                                                     AS name,
                NetworkDeviceType_Typology.finalclass                                               AS finalclass,
                cast(concat(COALESCE(NetworkDeviceType_Typology.name, '')) AS CHAR charset utf8mb4) AS friendlyname
FROM typology NetworkDeviceType_Typology
WHERE (
          0 <> COALESCE((NetworkDeviceType_Typology.finalclass = 'NetworkDeviceType'), 1))