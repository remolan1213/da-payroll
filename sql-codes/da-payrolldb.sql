CREATE TABLE "company" (
  "company_id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "company_name" text(45) NOT NULL
);

CREATE TABLE "department" (
  "department_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "department_name" TEXT(15) NOT NULL,
  "company_id" INTEGER NOT NULL,
  CONSTRAINT "_copy_2" FOREIGN KEY ("company_id") REFERENCES "company" ("company_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "employee" (
  "employee_id" text NOT NULL,
  "lastName" text(25) NOT NULL,
  "firstName" text(25) NOT NULL,
  "middleName" text(25),
  "company_id" integer,
  "start_train_date" text(10),
  "start_income_date" text(10),
  "start_10k_date" text(10),
  "worker_type" text(15),
  "wage_rate" real,
  "rate_type" text,
  CONSTRAINT "_copy_4" FOREIGN KEY ("company_id") REFERENCES "company" ("company_id") ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT "fk_employee_employee_1" FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id")
);

CREATE TABLE "leave" (
  "leave_id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "employee_id" integer NOT NULL,
  "start_leave" text,
  "end_leave" text,
  "total_days" integer,
  CONSTRAINT "_copy_3" FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "payroll" (
  "payroll_id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "employee_id" integer NOT NULL,
  "payroll_range" text,
  "payroll_date" text,
  CONSTRAINT "_copy_5" FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "payroll_amount" (
  "payamount_id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "payroll_id" text(10),
  "gross_amount" real NOT NULL,
  "work-share" real,
  "conversion-rate" real,
  FOREIGN KEY ("payroll_id") REFERENCES "payroll" ("payroll_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "payroll_amount_temp" (
  "payamount_id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "payroll_id" text(10),
  "gross_amount" real NOT NULL,
  "work-share" real,
  "conversion-rate" real,
  CONSTRAINT "fk_payroll_amount_temp_payroll_temp_1" FOREIGN KEY ("payroll_id") REFERENCES "payroll_temp" ("payroll_id")
);

CREATE TABLE "payroll_temp" (
  "payroll_id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "employee_id" integer NOT NULL,
  "payroll_range" text,
  "payroll_date" text,
  CONSTRAINT "fk_payroll_temp_employee_1" FOREIGN KEY ("employee_id") REFERENCES "employee" ("employee_id")
);

