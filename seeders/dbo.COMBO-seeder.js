
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('COMBO', [
  {
    "ComboID": 21
  },
  {
    "ComboID": 22
  },
  {
    "ComboID": 23
  },
  {
    "ComboID": 24
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('COMBO', null, {});
  }
};
  