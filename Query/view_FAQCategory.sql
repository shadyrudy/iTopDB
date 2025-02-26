-- View FAQ Category Information
SELECT DISTINCT FAQCategory.id                                                      AS id,
                FAQCategory.nam                                                     AS name,
                cast(concat(COALESCE(FAQCategory.nam, '')) AS CHAR charset utf8mb4) AS friendlyname
FROM faqcategory FAQCategory
WHERE (
          0 <> 1)