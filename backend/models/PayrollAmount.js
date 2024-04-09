const { Model, DataTypes } = require('sequelize');
const sequelize = require('../index');
const Payroll = require('./Payroll');

class PayrollAmount extends Model {}
PayrollAmount.init({
  payamount_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  payroll_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  gross_amount: {
    type: DataTypes.REAL,
    allowNull: false
  },
  work_share: {
    type: DataTypes.REAL
  },
  conversion_rate: {
    type: DataTypes.REAL
  }
}, { sequelize, modelName: 'payroll_amount' });

PayrollAmount.belongsTo(Payroll, { foreignKey: 'payroll_id' });
Payroll.hasMany(PayrollAmount, { foreignKey: 'payroll_id' });

module.exports = PayrollAmount;