
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "AreaName": "Area 1",
    "MenuID": "M001",
    "MenuName": "Classic Menu"
  },
  {
    "AreaName": "Area 2",
    "MenuID": "M002",
    "MenuName": "Spring Menu"
  },
  {
    "AreaName": "Area 3",
    "MenuID": "M003",
    "MenuName": "Summer Menu"
  },
  {
    "AreaName": "Area 4",
    "MenuID": "M004",
    "MenuName": "Autumn Menu"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('AREA', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into AREA: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('AREA', null, {});
  }
};
  