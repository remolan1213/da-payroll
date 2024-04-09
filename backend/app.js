const express = require('express');
const { sequelize } = require('./index'); // Corrected import path
const Company = require('./models/Company');
const Department = require('./models/Department');
const Employee = require('./models/Employee');
const Leave = require('./models/Leave');
const Payroll = require('./models/Payroll');
const PayrollAmount = require('./models/PayrollAmount');
const User = require('./models/User');
// Import other models as needed

const app = express();

// Middleware to parse request bodies
app.use(express.json());

// Define routes here or import them
// app.use('/api', routes);

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});