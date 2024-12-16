
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "PTicketID": "TKT0031   ",
    "DishID": 1,
    "OrderTime": "2024-12-13T12:00:00.000Z",
    "Quantity": 2,
    "Price": 50000
  },
  {
    "PTicketID": "TKT0031   ",
    "DishID": 2,
    "OrderTime": "2024-12-13T12:05:00.000Z",
    "Quantity": 1,
    "Price": 30000
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('PRE_ORDER_TICKET_DETAIL', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into PRE_ORDER_TICKET_DETAIL: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('PRE_ORDER_TICKET_DETAIL', null, {});
  }
};
  