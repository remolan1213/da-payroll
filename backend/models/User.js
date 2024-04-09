const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');
const Employee = require('./Employee');

class User extends Model {}
User.init({
  username: {
    type: DataTypes.STRING(25),
    allowNull: false
  },
  password: {
    type: DataTypes.STRING(25),
    allowNull: false
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, { sequelize, modelName: 'user' });

User.belongsTo(Employee, { foreignKey: 'employee_id' });
Employee.hasOne(User, { foreignKey: 'employee_id' });

module.exports = User;