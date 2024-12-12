
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('STANDARD_ORDER_TICKET', [
  {
    "SOTicketID": "TKT0001   ",
    "TableName": "Table 1",
    "SupportEmployee": "EMP01",
    "CreatedDate": "2023-12-12T12:00:00.000Z"
  },
  {
    "SOTicketID": "TKT0004   ",
    "TableName": "Table 2",
    "SupportEmployee": "EMP04",
    "CreatedDate": "2023-12-13T18:30:00.000Z"
  },
  {
    "SOTicketID": "TKT0007   ",
    "TableName": "Table 3",
    "SupportEmployee": "EMP07",
    "CreatedDate": "2023-12-14T10:15:00.000Z"
  },
  {
    "SOTicketID": "TKT0010   ",
    "TableName": "Table 4",
    "SupportEmployee": "EMP10",
    "CreatedDate": "2023-12-15T14:45:00.000Z"
  },
  {
    "SOTicketID": "TKT0013   ",
    "TableName": "Table 5",
    "SupportEmployee": "EMP03",
    "CreatedDate": "2023-12-16T11:30:00.000Z"
  },
  {
    "SOTicketID": "TKT0016   ",
    "TableName": "Table 6",
    "SupportEmployee": "EMP06",
    "CreatedDate": "2023-12-17T17:00:00.000Z"
  },
  {
    "SOTicketID": "TKT0019   ",
    "TableName": "Table 7",
    "SupportEmployee": "EMP09",
    "CreatedDate": "2023-12-18T12:30:00.000Z"
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('STANDARD_ORDER_TICKET', null, {});
  }
};
  