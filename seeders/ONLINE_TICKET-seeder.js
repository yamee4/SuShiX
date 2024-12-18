
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "OTicketID": "TKT0003   "
  },
  {
    "OTicketID": "TKT0006   "
  },
  {
    "OTicketID": "TKT0009   "
  },
  {
    "OTicketID": "TKT0012   "
  },
  {
    "OTicketID": "TKT0015   "
  },
  {
    "OTicketID": "TKT0018   "
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
  