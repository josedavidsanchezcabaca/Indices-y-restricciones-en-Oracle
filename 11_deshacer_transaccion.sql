-- Partimos sin cambios pendientes
ROLLBACK;

-- EJEMPLO 1: Deshacer solo una parte con SAVEPOINT
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (340, 'Compras', NULL, 1700);

SAVEPOINT despues_de_compras;

INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (350, 'Ventas Sur', NULL, 1700);

-- Aparecen 340 y 350
SELECT department_id, department_name
FROM   departments2
WHERE  department_id IN (340, 350)
ORDER  BY department_id;

-- Deshace únicamente el 350
ROLLBACK TO despues_de_compras;

-- Aparece solo el 340
SELECT department_id, department_name
FROM   departments2
WHERE  department_id IN (340, 350)
ORDER  BY department_id;

-- EJEMPLO 2: Deshacer toda la transacción con ROLLBACK
UPDATE departments2
SET    department_name = 'NOMBRE TEMPORAL'
WHERE  department_id = 10;

-- Muestra 10 NOMBRE TEMPORAL y 340 Compras
SELECT department_id, department_name
FROM   departments2
WHERE  department_id IN (10, 340)
ORDER  BY department_id;

-- Deshace el UPDATE del 10 y el INSERT del 340
ROLLBACK;

-- Vuelve a mostrar 10 Administration y desaparece el 340
SELECT department_id, department_name
FROM   departments2
WHERE  department_id IN (10, 340)
ORDER  BY department_id;

-- EJEMPLO 3: Lo confirmado con COMMIT no se deshace
ROLLBACK;

-- La fila 330 del punto anterior sigue intacta
SELECT department_id, department_name
FROM   departments2
WHERE  department_id = 330;