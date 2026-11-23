DELETE FROM employees   WHERE last_name IS NULL;
DELETE FROM departments WHERE department_name IS NULL;
COMMIT;