const env = process.env.NODE_ENV || "development";
const config = require("./config/config.json")[env];

const SequelizeAuto = require("sequelize-auto");
const Sequelize = require("sequelize");
const fs = require("fs");
const path = require("path");

const sequelize = new Sequelize(config.database, config.username, config.password, {
  host: config.host,
  dialect: config.dialect,
  dialectOptions: config.dialectOptions,
});

const auto = new SequelizeAuto(
  config.database,
  config.username,
  config.password,
  {
    host: config.host,
    dialect: config.dialect,
    port: config.port,
    directory: "./models", // where to write model files
    lang: "es6",
    additional: { timestamps: false },
  }
);

auto.run().then(async (data) => {
  const seedersDir = path.join(__dirname, "seeders");
  if (!fs.existsSync(seedersDir)) {
    fs.mkdirSync(seedersDir);
  }

  // Generate seeders for each table
  for (const tableName of Object.keys(data.tables)) {
    console.log(`Fetching data for table: ${tableName}`);
    const primaryKey = Object.keys(data.foreignKeys[tableName]?.[0] || {})[0] || 'id'; // Default to 'id' if primary key not found

    // Fetch existing primary keys
    const existingRows = await sequelize.query(`SELECT ${primaryKey} FROM ${tableName}`, {
      type: Sequelize.QueryTypes.SELECT,
    });
    const existingIds = existingRows.map(row => row[primaryKey]);

    // Fetch all data
    const tableData = await sequelize.query(`SELECT * FROM ${tableName}`, {
      type: Sequelize.QueryTypes.SELECT,
    });

    // Filter data to only include new rows
    const filteredData = tableData.filter(row => !existingIds.includes(row[primaryKey]));

    if (filteredData.length > 0) {
      const seederFilePath = path.join(seedersDir, `${tableName}-seeder.js`);
      const seedData = generateSeederContent(tableName, filteredData);

      fs.writeFileSync(seederFilePath, seedData);
      console.log(`Seeder for table "${tableName}" generated at ${seederFilePath}`);
    } else {
      console.log(`No new data to seed for table "${tableName}". Skipping...`);
    }
  }
});

// Generate seeder content based on table data
function generateSeederContent(tableName, tableData) {
  return `
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('${tableName}', ${JSON.stringify(tableData, null, 2)}, {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('${tableName}', null, {});
  }
};
  `;
}
