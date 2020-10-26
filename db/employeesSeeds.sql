-- Pre-populate the database will make development easier
-- All have IDs that are auto

-- DEPARTMENTS
INSERT INTO department (name) VALUES ("Human Resources");
INSERT INTO department (name) VALUES ("Technology");
INSERT INTO department (name) VALUES ("Security");


-- ROLES NEED DEPTID (deptid is selected dept name)
INSERT INTO role (title, salary) VALUES ("Intern", 35000.00);
INSERT INTO role (title, salary) VALUES ("Level II", 70000.00);
INSERT INTO role (title, salary) VALUES ("Senior", 90000.00);
INSERT INTO role (title, salary) VALUES ("Mid-Level", 80000.00);


-- EMPLOYEES (mgrid is selected mgr name)
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Vanessa", "Hudgens");
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Charline", "Lach");
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Heath", "Ledger");
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Keanu", "Reeves");
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Charlize", "Theron");




-- Way to add more than one row
-- INSERT INTO products (flavor, price, quantity) VALUES ("vanilla", 2.50, 100), ("chocolate", 3.10, 120), ("strawberry", 3.25, 75);