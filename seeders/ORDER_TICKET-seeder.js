
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "TicketID": "TKT0001   ",
    "TicketType": "STD",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "00001",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0002   ",
    "TicketType": "PRE",
    "BranchID": 2,
    "CCCD": "0234567890",
    "EmpID": "00002",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0003   ",
    "TicketType": "ONL",
    "BranchID": 3,
    "CCCD": "0345678901",
    "EmpID": "00003",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0004   ",
    "TicketType": "STD",
    "BranchID": 4,
    "CCCD": "0456789012",
    "EmpID": "00004",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0005   ",
    "TicketType": "PRE",
    "BranchID": 5,
    "CCCD": "0567890123",
    "EmpID": "00005",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0006   ",
    "TicketType": "ONL",
    "BranchID": 6,
    "CCCD": "0678901234",
    "EmpID": "00006",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0007   ",
    "TicketType": "STD",
    "BranchID": 7,
    "CCCD": "0789012345",
    "EmpID": "00007",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0008   ",
    "TicketType": "PRE",
    "BranchID": 8,
    "CCCD": "0890123456",
    "EmpID": "00008",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0009   ",
    "TicketType": "ONL",
    "BranchID": 9,
    "CCCD": "0901234567",
    "EmpID": "00009",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0010   ",
    "TicketType": "STD",
    "BranchID": 10,
    "CCCD": "1012345678",
    "EmpID": "00010",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0011   ",
    "TicketType": "PRE",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "00001",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0012   ",
    "TicketType": "ONL",
    "BranchID": 2,
    "CCCD": "0234567890",
    "EmpID": "00002",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0013   ",
    "TicketType": "STD",
    "BranchID": 3,
    "CCCD": "0345678901",
    "EmpID": "00003",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0014   ",
    "TicketType": "PRE",
    "BranchID": 4,
    "CCCD": "0456789012",
    "EmpID": "00004",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0015   ",
    "TicketType": "ONL",
    "BranchID": 5,
    "CCCD": "0567890123",
    "EmpID": "00005",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0016   ",
    "TicketType": "STD",
    "BranchID": 6,
    "CCCD": "0678901234",
    "EmpID": "00006",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0017   ",
    "TicketType": "PRE",
    "BranchID": 7,
    "CCCD": "0789012345",
    "EmpID": "00007",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0018   ",
    "TicketType": "ONL",
    "BranchID": 8,
    "CCCD": "0890123456",
    "EmpID": "00008",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0019   ",
    "TicketType": "STD",
    "BranchID": 9,
    "CCCD": "0901234567",
    "EmpID": "00009",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  },
  {
    "TicketID": "TKT0020   ",
    "TicketType": "PRE",
    "BranchID": 10,
    "CCCD": "1012345678",
    "EmpID": "00010",
    "Discount": null,
    "TotalPrice": null,
    "CreatedDate": null
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('ORDER_TICKET', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into ORDER_TICKET: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('ORDER_TICKET', null, {});
  }
};
  