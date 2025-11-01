const { Sequelize } = require("sequelize");

const sequelize = new Sequelize(
  process.env.DB_NAME || "personal_library",
  process.env.DB_USER || "admin",
  process.env.DB_PASSWORD || "admin123",
  {
    host: process.env.DB_HOST || "library-db",
    dialect: "postgres",
    port: process.env.DB_PORT || 5432,
    logging: false,
  }
);

module.exports = sequelize;