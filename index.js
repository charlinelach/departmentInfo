const inquirer = require("inquirer");
//const logo = require("asciiart-logo");
const db = require("./db");
require("console.table");

init();

// Display logo text, load main prompts...
function init() {
    // const logoText = logo({ name: "Employee Manager" }).render();

    // console.log(logoText);

    loadMainPrompts();
}

// Minimum function
async function loadMainPrompts() {
    const { choice } = await inquirer.prompt([
        {
            type: "list",
            name: "choice",
            message: "What would you like to do?",
            choices: [
                {
                    name: "View All Employees",
                    value: "VIEW_EMPLOYEES"
                },
                {
                    name: "View All Roles",
                    value: "VIEW_ROLES"
                },
                {
                    name: "View All Departments",
                    value: "VIEW_DEPARTMENTS"
                },
                {
                    name: "Add an Employee",
                    value: "ADD_EMPLOYEE"
                },
                {
                    name: "Add a Role",
                    value: "ADD_ROLE"
                },
                {
                    name: "Add a Department",
                    value: "ADD_DEPARTMENT"
                },
                {
                    name: "Update an Employee Role",
                    value: "UPDATE_EMPLOYEE"
                },
                {
                    name: "Exit",
                    value: "EXIT"
                },
            ]
        }
    ])

    // Sends user to function based on what they chose
    switch (choice) {
        case "VIEW_EMPLOYEES":
            return viewEmployees();
        case "VIEW_ROLES":
            return viewRoles();
        case "VIEW_DEPARTMENTS":
            return viewDepartments();
        case "ADD_EMPLOYEE":
            return addEmployee();
        case "ADD_ROLE":
            return addRole();
        case "ADD_DEPARTMENT":
            return addDepartment();
        case "UPDATE_EMPLOYEE":
            return updateEmployeeRole();
        case "EXIT":
            return exit();
        default:
            return exit();
    }
};



// VIEW
async function viewEmployees() {
    const employees = await db.findAllEmployees();

    console.log("\n");
    console.table(employees);

    loadMainPrompts();
}

async function viewRoles() {
    const roles = await db.findAllRoles();

    console.log("\n");
    console.table(roles);

    loadMainPrompts();
}

async function viewDepartments() {
    const departments = await db.findAllDepartments();

    console.log("\n");
    console.table(departments);

    loadMainPrompts();
}

// ADD
async function addEmployee() {
    const roles = await db.findAllRoles();
    const employees = await db.findAllEmployees();

    const employee = await inquirer.prompt([
        {
            name: "first_name",
            message: "What is the employee's first name?"
        },
        {
            name: "last_name",
            message: "What is the employee's last name?"
        }
    ]);

    const roleChoices = roles.map(({ id, title }) => ({
        name: title,
        value: id
    }));

    const { roleId } = await inquirer.prompt({
        type: "list",
        name: "roleId",
        message: "What is the employee's role?",
        choices: roleChoices
    });

    employee.role_id = roleId;

    const managerChoices = employees.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));
    managerChoices.unshift({ name: "None", value: null });

    const { managerId } = await inquirer.prompt({
        type: "list",
        name: "managerId",
        message: "Who is the employee's manager?",
        choices: managerChoices
    });

    employee.manager_id = managerId;

    await db.createEmployee(employee);

    console.log(
        `Added ${employee.first_name} ${employee.last_name} to the database`
    );

    loadMainPrompts();
}

async function addRole() {
    const departments = await db.findAllDepartments();

    const departmentChoices = departments.map(({ id, name }) => ({
        name: name,
        value: id
    }));

    const role = await inquirer.prompt([
        {
            name: "title",
            message: "What is the name of the role?"
        },
        {
            name: "salary",
            message: "What is the salary of the role?"
        },
        {
            type: "list",
            name: "department_id",
            message: "Which department does the role belong to?",
            choices: departmentChoices
        }
    ]);

    await db.createRole(role);

    console.log(`Added ${role.title} to the database`);

    loadMainPrompts();
}

async function addDepartment() {
    const department = await inquirer.prompt([
        {
            name: "name",
            message: "What is the name of the department?"
        }
    ]);

    await db.createDepartment(department);

    console.log(`Added ${department.name} to the database`);

    loadMainPrompts();
}

// UPDATE
async function updateEmployeeRole() {
    const employees = await db.findAllEmployees();

    const employeeChoices = employees.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));

    const { employeeId } = await inquirer.prompt([
        {
            type: "list",
            name: "employeeId",
            message: "Which employee's role do you want to update?",
            choices: employeeChoices
        }
    ]);

    const roles = await db.findAllRoles();

    const roleChoices = roles.map(({ id, title }) => ({
        name: title,
        value: id
    }));

    const { roleId } = await inquirer.prompt([
        {
            type: "list",
            name: "roleId",
            message: "Which role do you want to assign the selected employee?",
            choices: roleChoices
        }
    ]);

    await db.updateEmployeeRole(employeeId, roleId);

    console.log("Updated employee's role");

    loadMainPrompts();
}


// QUIT
function exit() {
    console.log("Hope that was successful!");
    process.exit();
}
