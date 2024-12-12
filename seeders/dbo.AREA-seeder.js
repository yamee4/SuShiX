
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('AREA', [
  {
    "AreaName": "Area 1",
    "MenuID": "M001",
    "MenuName": "Classic Menu"
  },
  {
    "AreaName": "Area 2",
    "MenuID": "M003",
    "MenuName": "Spring Menu"
  },
  {
    "AreaName": "Area 3",
    "MenuID": "M007",
    "MenuName": "Summer Menu"
  },
  {
    "AreaName": "Area 4",
    "MenuID": "M004",
    "MenuName": "Autumn Menu"
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('AREA', null, {});
  }
};
  