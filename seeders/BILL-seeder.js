
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "BillID": "BIL0001   ",
    "Discount": 10,
    "TotalPrice": "200000",
    "TicketID": "TKT0001   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0002   ",
    "Discount": 5,
    "TotalPrice": "150000",
    "TicketID": "TKT0002   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0003   ",
    "Discount": 0,
    "TotalPrice": "180000",
    "TicketID": "TKT0003   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0004   ",
    "Discount": 15,
    "TotalPrice": "220000",
    "TicketID": "TKT0004   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0005   ",
    "Discount": 8,
    "TotalPrice": "170000",
    "TicketID": "TKT0005   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0006   ",
    "Discount": 20,
    "TotalPrice": "160000",
    "TicketID": "TKT0006   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0007   ",
    "Discount": 5,
    "TotalPrice": "250000",
    "TicketID": "TKT0007   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0008   ",
    "Discount": 12,
    "TotalPrice": "190000",
    "TicketID": "TKT0008   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0009   ",
    "Discount": 10,
    "TotalPrice": "210000",
    "TicketID": "TKT0009   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0010   ",
    "Discount": 8,
    "TotalPrice": "180000",
    "TicketID": "TKT0010   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0011   ",
    "Discount": 15,
    "TotalPrice": "230000",
    "TicketID": "TKT0011   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0012   ",
    "Discount": 5,
    "TotalPrice": "160000",
    "TicketID": "TKT0012   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0013   ",
    "Discount": 10,
    "TotalPrice": "200000",
    "TicketID": "TKT0013   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0014   ",
    "Discount": 8,
    "TotalPrice": "190000",
    "TicketID": "TKT0014   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0015   ",
    "Discount": 12,
    "TotalPrice": "170000",
    "TicketID": "TKT0015   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0016   ",
    "Discount": 20,
    "TotalPrice": "150000",
    "TicketID": "TKT0016   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0017   ",
    "Discount": 5,
    "TotalPrice": "240000",
    "TicketID": "TKT0017   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0018   ",
    "Discount": 10,
    "TotalPrice": "180000",
    "TicketID": "TKT0018   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0019   ",
    "Discount": 15,
    "TotalPrice": "220000",
    "TicketID": "TKT0019   ",
    "CreatedDate": null
  },
  {
    "BillID": "BIL0020   ",
    "Discount": 8,
    "TotalPrice": "190000",
    "TicketID": "TKT0020   ",
    "CreatedDate": null
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
  