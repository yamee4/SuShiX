'use strict';

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
  for (const fullTableName of Object.keys(data.tables)) {
    const tableName = removePrefix(fullTableName); // Remove "dbo." prefix
    console.log(`Fetching data for table: ${tableName}`);
    
    const tableData = await sequelize.query(`SELECT * FROM ${tableName}`, {
      type: Sequelize.QueryTypes.SELECT,
    });

    if (tableData.length > 0) {
      const seederFilePath = path.join(seedersDir, `${tableName}-seeder.js`);
      const seedData = generateSeederContent(tableName, tableData);

      fs.writeFileSync(seederFilePath, seedData);
      console.log(`Seeder for table "${tableName}" generated at ${seederFilePath}`);
    } else {
      console.log(`No data found for table "${tableName}". Skipping...`);
    }
  }
});

// Function to remove "dbo." prefix
function removePrefix(tableName) {
  return tableName.includes('.') ? tableName.split('.')[1] : tableName;
}

// Function to generate seeder content with correct tableName reference
function generateSeederContent(tableName, tableData) {
  return `
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = ${JSON.stringify(tableData, null, 2)};

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('${tableName}', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(\`Error inserting into ${tableName}: \`, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('${tableName}', null, {});
  }
};
  `;
}
