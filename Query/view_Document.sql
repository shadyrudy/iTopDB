-- View Document
SELECT DISTINCT Document.id                                                                                    AS id,
                Document.name                                                                                  AS name,
                Document.org_id                                                                                AS org_id,
                Organization_org_id.name                                                                       AS org_name,
                Document.documenttype_id                                                                       AS documenttype_id,
                DocumentType_documenttype_id_Typology.name                                                     AS documenttype_name,
                Document.version                                                                               AS version,
                Document.description                                                                           AS description,
                Document.status                                                                                AS status,
                Document.finalclass                                                                            AS finalclass,
                IF
                    ((
                         Document.finalclass = 'Document'
                         ),
                     cast(concat(COALESCE('Document', '')) AS CHAR charset utf8mb4),
                     cast(concat(COALESCE(Document.name, '')) AS CHAR charset utf8mb4))                        AS friendlyname,
                COALESCE((Document.status = 'obsolete'), 0)                                                    AS obsolescence_flag,
                Document.obsolescence_date                                                                     AS obsolescence_date,
                cast(concat(COALESCE(Organization_org_id.name, '')) AS CHAR charset utf8mb4)                   AS org_id_friendlyname,
                COALESCE((Organization_org_id.status = 'inactive'), 0)                                         AS org_id_obsolescence_flag,
                cast(concat(COALESCE(DocumentType_documenttype_id_Typology.name, '')) AS CHAR charset utf8mb4) AS documenttype_id_friendlyname
FROM ((
    document Document
        JOIN organization Organization_org_id ON ((
        Document.org_id = Organization_org_id.id
        )))
    LEFT JOIN typology DocumentType_documenttype_id_Typology ON ((
    Document.documenttype_id = DocumentType_documenttype_id_Typology.id
    )))
WHERE (
              0 <> COALESCE((DocumentType_documenttype_id_Typology.finalclass = 'DocumentType'), 1))