
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('STATION', [
  {
    "StationName": "Cashier",
    "StationSalary": 8500000
  },
  {
    "StationName": "Dishwasher",
    "StationSalary": 7000000
  },
  {
    "StationName": "Host/Hostess",
    "StationSalary": 7500000
  },
  {
    "StationName": "Server",
    "StationSalary": 8000000
  },
  {
    "StationName": "Sushi Chef",
    "StationSalary": 15000000
  },
  {
    "StationName": "Sushi Preparer",
    "StationSalary": 10000000
  },
  {
    "StationName": "Teppanyaki Chef",
    "StationSalary": 18000000
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('STATION', null, {});
  }
};
  