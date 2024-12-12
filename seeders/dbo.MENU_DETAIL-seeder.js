
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('MENU_DETAIL', [
  {
    "BranchID": 1,
    "DishID": 1,
    "isServing": true
  },
  {
    "BranchID": 1,
    "DishID": 2,
    "isServing": true
  },
  {
    "BranchID": 1,
    "DishID": 10,
    "isServing": true
  },
  {
    "BranchID": 1,
    "DishID": 30,
    "isServing": false
  },
  {
    "BranchID": 2,
    "DishID": 3,
    "isServing": true
  },
  {
    "BranchID": 2,
    "DishID": 4,
    "isServing": true
  },
  {
    "BranchID": 2,
    "DishID": 5,
    "isServing": true
  },
  {
    "BranchID": 2,
    "DishID": 31,
    "isServing": false
  },
  {
    "BranchID": 3,
    "DishID": 1,
    "isServing": false
  },
  {
    "BranchID": 3,
    "DishID": 30,
    "isServing": true
  },
  {
    "BranchID": 3,
    "DishID": 31,
    "isServing": true
  },
  {
    "BranchID": 3,
    "DishID": 32,
    "isServing": true
  },
  {
    "BranchID": 4,
    "DishID": 10,
    "isServing": true
  },
  {
    "BranchID": 4,
    "DishID": 11,
    "isServing": true
  },
  {
    "BranchID": 4,
    "DishID": 12,
    "isServing": true
  },
  {
    "BranchID": 4,
    "DishID": 28,
    "isServing": false
  },
  {
    "BranchID": 5,
    "DishID": 9,
    "isServing": false
  },
  {
    "BranchID": 5,
    "DishID": 15,
    "isServing": true
  },
  {
    "BranchID": 5,
    "DishID": 16,
    "isServing": true
  },
  {
    "BranchID": 5,
    "DishID": 17,
    "isServing": true
  },
  {
    "BranchID": 6,
    "DishID": 19,
    "isServing": false
  },
  {
    "BranchID": 6,
    "DishID": 20,
    "isServing": true
  },
  {
    "BranchID": 6,
    "DishID": 21,
    "isServing": true
  },
  {
    "BranchID": 6,
    "DishID": 22,
    "isServing": true
  },
  {
    "BranchID": 7,
    "DishID": 1,
    "isServing": true
  },
  {
    "BranchID": 7,
    "DishID": 9,
    "isServing": true
  },
  {
    "BranchID": 7,
    "DishID": 11,
    "isServing": true
  },
  {
    "BranchID": 7,
    "DishID": 31,
    "isServing": false
  },
  {
    "BranchID": 8,
    "DishID": 2,
    "isServing": false
  },
  {
    "BranchID": 8,
    "DishID": 11,
    "isServing": true
  },
  {
    "BranchID": 8,
    "DishID": 17,
    "isServing": true
  },
  {
    "BranchID": 8,
    "DishID": 21,
    "isServing": true
  },
  {
    "BranchID": 9,
    "DishID": 1,
    "isServing": true
  },
  {
    "BranchID": 9,
    "DishID": 5,
    "isServing": false
  },
  {
    "BranchID": 9,
    "DishID": 18,
    "isServing": true
  },
  {
    "BranchID": 9,
    "DishID": 27,
    "isServing": true
  },
  {
    "BranchID": 10,
    "DishID": 10,
    "isServing": true
  },
  {
    "BranchID": 10,
    "DishID": 34,
    "isServing": false
  },
  {
    "BranchID": 10,
    "DishID": 37,
    "isServing": true
  },
  {
    "BranchID": 10,
    "DishID": 39,
    "isServing": true
  },
  {
    "BranchID": 11,
    "DishID": 6,
    "isServing": true
  },
  {
    "BranchID": 11,
    "DishID": 7,
    "isServing": true
  },
  {
    "BranchID": 11,
    "DishID": 8,
    "isServing": true
  },
  {
    "BranchID": 11,
    "DishID": 33,
    "isServing": false
  },
  {
    "BranchID": 12,
    "DishID": 4,
    "isServing": false
  },
  {
    "BranchID": 12,
    "DishID": 28,
    "isServing": true
  },
  {
    "BranchID": 12,
    "DishID": 29,
    "isServing": true
  },
  {
    "BranchID": 12,
    "DishID": 31,
    "isServing": true
  },
  {
    "BranchID": 13,
    "DishID": 11,
    "isServing": true
  },
  {
    "BranchID": 13,
    "DishID": 26,
    "isServing": true
  },
  {
    "BranchID": 13,
    "DishID": 27,
    "isServing": false
  },
  {
    "BranchID": 13,
    "DishID": 32,
    "isServing": true
  },
  {
    "BranchID": 14,
    "DishID": 19,
    "isServing": true
  },
  {
    "BranchID": 14,
    "DishID": 26,
    "isServing": true
  },
  {
    "BranchID": 14,
    "DishID": 31,
    "isServing": false
  },
  {
    "BranchID": 14,
    "DishID": 33,
    "isServing": true
  },
  {
    "BranchID": 15,
    "DishID": 9,
    "isServing": true
  },
  {
    "BranchID": 15,
    "DishID": 11,
    "isServing": true
  },
  {
    "BranchID": 15,
    "DishID": 12,
    "isServing": false
  },
  {
    "BranchID": 15,
    "DishID": 19,
    "isServing": true
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('MENU_DETAIL', null, {});
  }
};
  