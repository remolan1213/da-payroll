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
    "start_train_date" DATETIME NOT NULL,
    "start_income_date" DATETIME NOT NULL,
    "start_10k_date" DATETIME NOT NULL,
    "worker_type" TEXT NOT NULL,
    "wage_rate" REAL NOT NULL,
    "rate_type" TEXT NOT NULL,
    CONSTRAINT "Employee_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company" ("company_id") ON DELETE SET NULL ON UPDATE CASCADE
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
    "payroll_range" DATETIME NOT NULL,
    "payroll_date" DATETIME NOT NULL,
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
    "payroll_range" DATETIME NOT NULL,
    "payroll_date" DATETIME NOT NULL,
    CONSTRAINT "PayrollTemp_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee" ("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PayrollAmountTemp" (
    "payamount_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "payroll_id" INTEGER NOT NULL,
    "gross_amount" REAL NOT NULL,
    "work_share" REAL,
    "conversion_rate" REAL,
    CONSTRAINT "PayrollAmountTemp_payroll_id_fkey" FOREIGN KEY ("payroll_id") REFERENCES "PayrollTemp" ("payroll_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
