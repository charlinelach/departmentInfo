-- Pre-populate the database will make development easier
-- All have IDs that are auto

USE employees;

-- DEPARTMENTS
INSERT INTO department (name) VALUES
    ("Human Resources"),
    ("Technology")
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

SELECT * role