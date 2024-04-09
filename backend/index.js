const { Sequelize } = require('sequelize');

const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: 'backend/data/da-pay.sqlite3'
});

module.exports = sequelize;