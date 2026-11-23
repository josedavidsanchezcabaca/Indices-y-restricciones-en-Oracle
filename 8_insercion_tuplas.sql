-- Insertar tres tuplas
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (300, 'Investigacion', NULL, 1700);
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (310, 'Calidad', NULL, 1700);
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (320, 'Soporte', NULL, 1700);

-- Comprobacion insercion de las tuplas
SELECT department_id, department_name, manager_id, location_id
FROM   departments2
WHERE  department_id >= 300
ORDER  BY department_id;
SELECT COUNT(*) AS total_filas FROM departments2;