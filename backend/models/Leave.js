const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');
const Employee = require('./Employee');

class Leave extends Model {}
Leave.init({
  leave_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  employee_id: {
    type: DataTypes.STRING,
    allowNull: false
  },
  start_leave: {
    type: DataTypes.STRING
  },
  end_leave: {
    type: DataTypes.STRING
  },
  total_days: {
    type: DataTypes.INTEGER
  }
}, { sequelize, modelName: 'leave' });

Leave.belongsTo(Employee, { foreignKey: 'employee_id' });
Employee.hasMany(Leave, { foreignKey: 'employee_id' });

module.exports = Leave;