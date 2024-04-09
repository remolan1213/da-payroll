const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');

class Company extends Model {}
Company.init({
  company_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  company_name: {
    type: DataTypes.STRING(45),
    allowNull: false
  }
}, { sequelize, modelName: 'company' });

module.exports = Company;