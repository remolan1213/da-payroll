const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');
const Company = require('./Company');

class Department extends Model {}
Department.init({
  department_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  department_name: {
    type: DataTypes.STRING(15),
    allowNull: false
  },
  company_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  }
}, { sequelize, modelName: 'department' });

Department.belongsTo(Company, { foreignKey: 'company_id' });
Company.hasMany(Department, { foreignKey: 'company_id' });

module.exports = Department;