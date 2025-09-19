SELECT employeenumber, firstname, lastname
FROM employees
WHERE employeenumber = '1188';


-- Creating an archive table to house the deleted data for later audit
CREATE TABLE employees_archive(
employeenumber INT Primary KEY,
last_name VARCHAR (50) NOT NULL,
first_name VARCHAR (50) NOT NULL,
extension VARCHAR(10)NOT NULL,
email VARCHAR(100) NOT NULL,
reports_to INT NULL,
job_title VARCHAR (10) NOT NULL,

deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
deleted_by VARCHAR(100),
delete_reason TEXT,

CONSTRAINT fk_archive_reports
	FOREIGN KEY (reports_to) REFERENCES employees(employeenumber) ON DELETE SET NULL,
CONSTRAINT fk_archive_offices
	FOREIGN KEY (office_code) REFERENCES offices(office_code)

);

--deleting employee

WITH delete_employee AS (
	DELETE FROM employees
	WHERE employeenumber = 1188
	RETURNING *
)
INSERT INTO employees_archive
SELECT * FROM delete_employee;