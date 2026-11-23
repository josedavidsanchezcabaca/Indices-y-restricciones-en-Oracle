-- Reactivar Restricciones (Primer intento)
-- Claves primarias y únicas
ALTER TABLE departments ENABLE CONSTRAINT dept_id_pk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_emp_id_pk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_email_uk;

-- Check y Not Null
ALTER TABLE departments ENABLE CONSTRAINT dept_name_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_email_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_job_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_salary_min;

-- Claves foráneas
ALTER TABLE departments ENABLE CONSTRAINT dept_mgr_fk;
ALTER TABLE departments ENABLE CONSTRAINT dept_loc_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_job_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_manager_fk;
ALTER TABLE job_history ENABLE CONSTRAINT jhist_dept_fk;
ALTER TABLE job_history ENABLE CONSTRAINT jhist_emp_fk;

-- Estado tras el primer intento (10 siguen DISABLED)
SELECT table_name, constraint_name, status
FROM   user_constraints
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS', 'JOB_HISTORY')
AND    status = 'DISABLED'
ORDER  BY table_name, constraint_name;

-- Reactivar Restricciones (Segundo intento)
-- Activar las 10 que faltaban
ALTER TABLE employees   ENABLE CONSTRAINT emp_email_uk;
ALTER TABLE departments ENABLE CONSTRAINT dept_name_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_salary_min;
ALTER TABLE departments ENABLE CONSTRAINT dept_mgr_fk;
ALTER TABLE departments ENABLE CONSTRAINT dept_loc_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_job_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_manager_fk;

-- Comprobación final (todas deben salir ENABLED y VALIDATED)
SELECT table_name, constraint_name, constraint_type, status, validated
FROM   user_constraints
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS', 'JOB_HISTORY')
ORDER  BY table_name, constraint_type, constraint_name;