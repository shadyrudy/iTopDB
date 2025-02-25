-- View Document Note
SELECT DISTINCT DocumentNote.id                                                                                AS id,
                DocumentNote_Document.name                                                                     AS name,
                DocumentNote_Document.org_id                                                                   AS org_id,
                Organization_org_id.name                                                                       AS org_name,
                DocumentNote_Document.documenttype_id                                                          AS documenttype_id,
                DocumentType_documenttype_id_Typology.name                                                     AS documenttype_name,
                DocumentNote_Document.version                                                                  AS version,
                DocumentNote_Document.description                                                              AS description,
                DocumentNote_Document.status                                                                   AS status,
                DocumentNote.text                                                                              AS text,
                DocumentNote_Document.finalclass                                                               AS finalclass,
                cast(concat(COALESCE(DocumentNote_Document.name, '')) AS CHAR charset utf8mb4)                 AS friendlyname,
                COALESCE((DocumentNote_Document.status = 'obsolete'), 0)                                       AS obsolescence_flag,
                DocumentNote_Document.obsolescence_date                                                        AS obsolescence_date,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4)                   AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                                         AS org_id_obsolescence_flag,
                cast(concat(COALESCE(DocumentType_documenttype_id_Typology.name, '')) AS CHAR charset utf8mb4) AS documenttype_id_friendlyname
FROM (
         documentnote DocumentNote
             JOIN ((
             document DocumentNote_Document
                 JOIN organization Organization_org_id ON ((
                 DocumentNote_Document.org_id = Organization_org_id.id
                 )))
             LEFT JOIN typology DocumentType_documenttype_id_Typology ON ((
                 DocumentNote_Document.documenttype_id = DocumentType_documenttype_id_Typology.id
             ))) ON ((
             DocumentNote.id = DocumentNote_Document.id
             )))
WHERE (
              0 <> COALESCE((DocumentType_documenttype_id_Typology.finalclass = 'DocumentType'), 1))