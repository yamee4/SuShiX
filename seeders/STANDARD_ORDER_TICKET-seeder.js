
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "SOTicketID": "TKT0001   ",
    "TableName": "Table 1",
    "SupportEmployee": "00001"
  },
  {
    "SOTicketID": "TKT0004   ",
    "TableName": "Table 1",
    "SupportEmployee": "00004"
  },
  {
    "SOTicketID": "TKT0007   ",
    "TableName": "Table 1",
    "SupportEmployee": "00007"
  },
  {
    "SOTicketID": "TKT0010   ",
    "TableName": "Table 1",
    "SupportEmployee": "00010"
  },
  {
    "SOTicketID": "TKT0013   ",
    "TableName": "Table 1",
    "SupportEmployee": "00003"
  },
  {
    "SOTicketID": "TKT0016   ",
    "TableName": "Table 1",
    "SupportEmployee": "00006"
  },
  {
    "SOTicketID": "TKT0019   ",
    "TableName": "Table 1",
    "SupportEmployee": "00009"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('STANDARD_ORDER_TICKET', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into STANDARD_ORDER_TICKET: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('STANDARD_ORDER_TICKET', null, {});
  }
};
  