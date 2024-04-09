const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');
const Company = require('./Company');

class Employee extends Model {}
Employee.init({
  employee_id: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  lastName: {
    type: DataTypes.STRING(25),
    allowNull: false
  },
  firstName: {
    type: DataTypes.STRING(25),
    allowNull: false
  },
  middleName: {
    type: DataTypes.STRING(25)
  },
  company_id: {
    type: DataTypes.INTEGER
  },
  start_train_date: {
    type: DataTypes.STRING(10)
  },
  start_income_date: {
    type: DataTypes.STRING(10)
  },
  start_10k_date: {
    type: DataTypes.STRING(10)
  },
  worker_type: {
    type: DataTypes.STRING(15)
  },
  wage_rate: {
    type: DataTypes.REAL
  },
  rate_type: {
    type: DataTypes.STRING
  }
}, { sequelize, modelName: 'employee' });

Employee.belongsTo(Company, { foreignKey: 'company_id' });
Company.hasMany(Employee, { foreignKey: 'company_id' });

module.exports = Employee;