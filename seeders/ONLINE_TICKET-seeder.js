
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "OTicketID": "TKT0033   ",
    "DeliveryDate": "2024-01-01T00:00:00.000Z"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('ONLINE_TICKET', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into ONLINE_TICKET: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('ONLINE_TICKET', null, {});
  }
};
  