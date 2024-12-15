
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "BillID": "BIL0001   ",
    "Discount": 10,
    "TotalPrice": "117000",
    "TicketID": "TKT0001   ",
    "CreatedDate": "2023-12-12T12:00:00.000Z"
  },
  {
    "BillID": "BIL0002   ",
    "Discount": 5,
    "TotalPrice": "123500",
    "TicketID": "TKT0002   ",
    "CreatedDate": "2023-12-13T18:30:00.000Z"
  },
  {
    "BillID": "BIL0003   ",
    "Discount": 0,
    "TotalPrice": "130000",
    "TicketID": "TKT0003   ",
    "CreatedDate": "2023-12-15T12:00:00.000Z"
  },
  {
    "BillID": "BIL0004   ",
    "Discount": 15,
    "TotalPrice": "144500",
    "TicketID": "TKT0004   ",
    "CreatedDate": "2023-12-13T18:30:00.000Z"
  },
  {
    "BillID": "BIL0005   ",
    "Discount": 8,
    "TotalPrice": "156400",
    "TicketID": "TKT0005   ",
    "CreatedDate": "2023-12-14T12:00:00.000Z"
  },
  {
    "BillID": "BIL0006   ",
    "Discount": 20,
    "TotalPrice": "136000",
    "TicketID": "TKT0006   ",
    "CreatedDate": "2023-12-16T18:30:00.000Z"
  },
  {
    "BillID": "BIL0007   ",
    "Discount": 5,
    "TotalPrice": "57000",
    "TicketID": "TKT0007   ",
    "CreatedDate": "2023-12-14T10:15:00.000Z"
  },
  {
    "BillID": "BIL0008   ",
    "Discount": 12,
    "TotalPrice": "52800",
    "TicketID": "TKT0008   ",
    "CreatedDate": "2023-12-15T19:30:00.000Z"
  },
  {
    "BillID": "BIL0009   ",
    "Discount": 10,
    "TotalPrice": "54000",
    "TicketID": "TKT0009   ",
    "CreatedDate": "2023-12-17T10:15:00.000Z"
  },
  {
    "BillID": "BIL0010   ",
    "Discount": 8,
    "TotalPrice": "82800",
    "TicketID": "TKT0010   ",
    "CreatedDate": "2023-12-15T14:45:00.000Z"
  },
  {
    "BillID": "BIL0011   ",
    "Discount": 15,
    "TotalPrice": "76500",
    "TicketID": "TKT0011   ",
    "CreatedDate": "2023-12-16T17:00:00.000Z"
  },
  {
    "BillID": "BIL0012   ",
    "Discount": 5,
    "TotalPrice": "85500",
    "TicketID": "TKT0012   ",
    "CreatedDate": "2023-12-18T14:45:00.000Z"
  },
  {
    "BillID": "BIL0013   ",
    "Discount": 10,
    "TotalPrice": "121500",
    "TicketID": "TKT0013   ",
    "CreatedDate": "2023-12-16T11:30:00.000Z"
  },
  {
    "BillID": "BIL0014   ",
    "Discount": 8,
    "TotalPrice": "124200",
    "TicketID": "TKT0014   ",
    "CreatedDate": "2023-12-17T11:30:00.000Z"
  },
  {
    "BillID": "BIL0015   ",
    "Discount": 12,
    "TotalPrice": "118800",
    "TicketID": "TKT0015   ",
    "CreatedDate": "2023-12-19T11:30:00.000Z"
  },
  {
    "BillID": "BIL0016   ",
    "Discount": 20,
    "TotalPrice": "112000",
    "TicketID": "TKT0016   ",
    "CreatedDate": "2023-12-17T17:00:00.000Z"
  },
  {
    "BillID": "BIL0017   ",
    "Discount": 5,
    "TotalPrice": "133000",
    "TicketID": "TKT0017   ",
    "CreatedDate": "2023-12-18T13:00:00.000Z"
  },
  {
    "BillID": "BIL0018   ",
    "Discount": 10,
    "TotalPrice": "126000",
    "TicketID": "TKT0018   ",
    "CreatedDate": "2023-12-20T17:00:00.000Z"
  },
  {
    "BillID": "BIL0019   ",
    "Discount": 15,
    "TotalPrice": "110500",
    "TicketID": "TKT0019   ",
    "CreatedDate": "2023-12-18T12:30:00.000Z"
  },
  {
    "BillID": "BIL0020   ",
    "Discount": 8,
    "TotalPrice": "142600",
    "TicketID": "TKT0020   ",
    "CreatedDate": "2023-12-18T13:00:00.000Z"
  },
  {
    "BillID": "BIL0021   ",
    "Discount": 0,
    "TotalPrice": "130000",
    "TicketID": "TKT0033   ",
    "CreatedDate": "2024-01-01T00:00:00.000Z"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('BILL', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into BILL: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('BILL', null, {});
  }
};
  