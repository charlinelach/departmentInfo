DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;

USE employees;

CREATE TABLE department (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE role (
    id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES department(id),
    PRIMARY KEY (id)
);

CREATE TABLE employee (
    id INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INTEGER,
    FOREIGN KEY (role_id) REFERENCES role(role_id),
    manager_id INTEGER,
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id),
    PRIMARY KEY (id)
);

--------

-- DEPARTMENTS
INSERT INTO department (name) VALUES
    ("Human Resources"),
    ("Technology"),
    ("Security");


-- ROLES NEED DEPTID (deptid is selected dept name)
INSERT INTO role (title, salary) VALUES
    ("Intern", 35000.00),
    ("Level II", 70000.00),
    ("Senior", 90000.00),
    ("Mid-Level", 80000.00);


-- EMPLOYEES (mgrid is selected mgr name)
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES
    ("Vanessa", "Hudgens", "Intern", "Heath Ledger"),
    ("Charline", "Lach", "Mid-Level", "Charlize Theron"),
    ("Heath", "Ledger", "Senior", NULL),
    ("Keanu", "Reeves", "Level II", "Charlize Theron"),
    ("Charlize", "Theron", "Senior", NULL);



-- Way to add more than one row
-- INSERT INTO products (flavor, price, quantity) VALUES ("vanilla", 2.50, 100), ("chocolate", 3.10, 120), ("strawberry", 3.25, 75);