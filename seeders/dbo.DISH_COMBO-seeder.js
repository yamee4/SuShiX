
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('DISH_COMBO', [
  {
    "ComboID": 21,
    "DishID": 1,
    "Quantity": 1
  },
  {
    "ComboID": 21,
    "DishID": 2,
    "Quantity": 1
  },
  {
    "ComboID": 21,
    "DishID": 3,
    "Quantity": 1
  },
  {
    "ComboID": 21,
    "DishID": 4,
    "Quantity": 1
  },
  {
    "ComboID": 22,
    "DishID": 5,
    "Quantity": 1
  },
  {
    "ComboID": 22,
    "DishID": 6,
    "Quantity": 1
  },
  {
    "ComboID": 22,
    "DishID": 7,
    "Quantity": 1
  },
  {
    "ComboID": 22,
    "DishID": 8,
    "Quantity": 1
  },
  {
    "ComboID": 23,
    "DishID": 9,
    "Quantity": 1
  },
  {
    "ComboID": 23,
    "DishID": 10,
    "Quantity": 1
  },
  {
    "ComboID": 23,
    "DishID": 11,
    "Quantity": 1
  },
  {
    "ComboID": 24,
    "DishID": 12,
    "Quantity": 1
  },
  {
    "ComboID": 24,
    "DishID": 13,
    "Quantity": 2
  },
  {
    "ComboID": 24,
    "DishID": 14,
    "Quantity": 1
  },
  {
    "ComboID": 24,
    "DishID": 15,
    "Quantity": 2
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('DISH_COMBO', null, {});
  }
};
  