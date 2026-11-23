SELECT  table_name,
        index_name,
        index_type,
        uniqueness,
        status
FROM    user_indexes
WHERE   table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, index_name;