-- ID Repetido(captura error ORA-00001)
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (10, 'ID repetido', NULL, 1700);

-- Fila invalida en Departments
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (280, NULL, 999, 9999);

-- Fila invalida en Employees
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date,
    job_id, salary, department_id, manager_id)
VALUES (207, 'Prueba', NULL, 'SKING', NULL, 'NO_EXISTE', -500, 999, 999);