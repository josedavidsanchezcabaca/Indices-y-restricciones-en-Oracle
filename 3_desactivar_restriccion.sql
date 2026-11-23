--- Consulta Restricciones
SELECT table_name, constraint_name, constraint_type, status
FROM   user_constraints
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER  BY table_name, constraint_type, constraint_name

-- Desactivar Restricciones
-- Claves foraneas
ALTER TABLE departments DISABLE CONSTRAINT dept_mgr_fk;
ALTER TABLE departments DISABLE CONSTRAINT dept_loc_fk;
ALTER TABLE employees   DISABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees   DISABLE CONSTRAINT emp_job_fk;
ALTER TABLE employees   DISABLE CONSTRAINT emp_manager_fk;
-- Claves primarias y únicas
ALTER TABLE departments DISABLE CONSTRAINT dept_id_pk CASCADE;
ALTER TABLE employees   DISABLE CONSTRAINT emp_emp_id_pk CASCADE;
ALTER TABLE employees   DISABLE CONSTRAINT emp_email_uk;
-- Check y Not Null
ALTER TABLE departments DISABLE CONSTRAINT dept_name_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_email_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_job_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_salary_min;