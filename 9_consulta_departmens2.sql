-- Total de filas
SELECT COUNT(*) AS total_filas FROM departments2;

-- Buscar las filas nuevas
SELECT department_id, department_name, manager_id, location_id
FROM   departments2
WHERE  department_id >= 300
ORDER  BY department_id;

-- Comparación directa con la tabla original
SELECT (SELECT COUNT(*) FROM departments)  AS filas_departments,
    (SELECT COUNT(*) FROM departments2) AS filas_departments2
FROM   dual;