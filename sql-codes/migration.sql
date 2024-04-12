-- CreateTable
CREATE TABLE "Company" (
    "company_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "company_name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Department" (
    "department_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "department_name" TEXT NOT NULL,
    "company_id" INTEGER NOT NULL,
    CONSTRAINT "Department_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Employee" (
    "employee_id" TEXT NOT NULL PRIMARY KEY,
    "lastName" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "company_id" INTEGER,
    "start_train_date" DATETIME,
    "start_income_date" DATETIME,
    "start_10k_date" DATETIME,
    "worker_type" TEXT,
    "wage_rate" REAL,
    "rate_type" TEXT,
    "departmentDepartment_id" INTEGER,
    CONSTRAINT "Employee_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Employee_departmentDepartment_id_fkey" FOREIGN KEY ("departmentDepartment_id") REFERENCES "Department" ("department_id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Leave" (
    "leave_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employee_id" TEXT NOT NULL,
    "start_leave" DATETIME,
    "end_leave" DATETIME,
    "total_days" INTEGER,
    CONSTRAINT "Leave_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee" ("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Payroll" (
    "payroll_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employee_id" TEXT NOT NULL,
    "payroll_range" DATETIME,
    "payroll_date" DATETIME,
    CONSTRAINT "Payroll_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee" ("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PayrollAmount" (
    "payamount_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "payroll_id" INTEGER NOT NULL,
    "gross_amount" REAL NOT NULL,
    "work_share" REAL,
    "conversion_rate" REAL,
    CONSTRAINT "PayrollAmount_payroll_id_fkey" FOREIGN KEY ("payroll_id") REFERENCES "Payroll" ("payroll_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PayrollTemp" (
    "payroll_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employee_id" TEXT NOT NULL,
    "payroll_range" DATETIME,
    "payroll_date" DATETIME,
    CONSTRAINT "PayrollTemp_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee" ("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
