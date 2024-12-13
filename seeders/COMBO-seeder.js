
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
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
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('COMBO', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into COMBO: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('COMBO', null, {});
  }
};
  