DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;

USE employees;

CREATE TABLE department (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    PRIMARY KEY (id)
);

INSERT INTO department (name) VALUES
    ("Human Resources"),
    ("Technology"),
    ("Security");
    
SELECT * FROM department;

CREATE TABLE role (
    id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INTEGER,
    CONSTRAINT fk_departmentid FOREIGN KEY (department_id) REFERENCES department(id),
    PRIMARY KEY (id)
);

INSERT INTO role (title, salary, department_id) VALUES
    ("Intern", 35000.00, 2),
    ("Level II", 70000.00, 3),
    ("Senior", 90000.00, 1),
    ("Mid-Level", 80000.00, 3);

SELECT * FROM role;

CREATE TABLE employee (
    id INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INTEGER,
    CONSTRAINT fk_roleid FOREIGN KEY (role_id) REFERENCES role(id),
    manager_id INTEGER,
    CONSTRAINT fk_managerid FOREIGN KEY (manager_id) REFERENCES employee(id),
    PRIMARY KEY (id)
);

INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES
    ("Vanessa", "Hudgens", 1, NULL),
    ("Charline", "Lach", 4, NULL),
    ("Heath", "Ledger", 3, NULL),
    ("Keanu", "Reeves", 2, NULL),
    ("Charlize", "Theron", 3, NULL);
    
SELECT * FROM employee;

-- SELECT r.title, r.salary, d.name FROM role r, department d WHERE r.department_id = d.id;