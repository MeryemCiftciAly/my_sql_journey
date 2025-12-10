CREATE TABLE IF NOT EXISTS employees
(
    employeenumber INTEGER NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    reportsto INTEGER,
    jobtitle VARCHAR(50) NOT NULL,
    officecode VARCHAR(10) NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (employeenumber),
    CONSTRAINT fk_employees_employees FOREIGN KEY (reportsto)
        REFERENCES employees (employeenumber)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_employees_offices FOREIGN KEY (officecode)
        REFERENCES offices (officecode)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE INDEX IF NOT EXISTS fk_employees_employees_idx
    ON employees (reportsto);

CREATE INDEX IF NOT EXISTS fk_employees_offices_idx
    ON employees (officecode);
