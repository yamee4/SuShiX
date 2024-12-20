
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "OTicketID": "TKT0003   ",
    "DeliveryDate": "2023-12-15T12:00:00.000Z"
  },
  {
    "OTicketID": "TKT0006   ",
    "DeliveryDate": "2023-12-16T18:30:00.000Z"
  },
  {
    "OTicketID": "TKT0009   ",
    "DeliveryDate": "2023-12-17T10:15:00.000Z"
  },
  {
    "OTicketID": "TKT0012   ",
    "DeliveryDate": "2023-12-18T14:45:00.000Z"
  },
  {
    "OTicketID": "TKT0015   ",
    "DeliveryDate": "2023-12-19T11:30:00.000Z"
  },
  {
    "OTicketID": "TKT0018   ",
    "DeliveryDate": "2023-12-20T17:00:00.000Z"
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
  