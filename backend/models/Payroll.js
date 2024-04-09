const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');
const Employee = require('./Employee');

class Payroll extends Model {}
Payroll.init({
  payroll_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  employee_id: {
    type: DataTypes.STRING,
    allowNull: false
  },
  payroll_range: {
    type: DataTypes.STRING
  },
  payroll_date: {
    type: DataTypes.STRING
  }
}, { sequelize, modelName: 'payroll' });

Payroll.belongsTo(Employee, { foreignKey: 'employee_id' });
Employee.hasMany(Payroll, { foreignKey: 'employee_id' });

module.exports = Payroll;