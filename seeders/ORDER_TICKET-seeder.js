
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "TicketID": "TKT0001   ",
    "TicketType": "STD",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "EMP01"
  },
  {
    "TicketID": "TKT0002   ",
    "TicketType": "PRE",
    "BranchID": 2,
    "CCCD": "0234567890",
    "EmpID": "EMP02"
  },
  {
    "TicketID": "TKT0003   ",
    "TicketType": "ONL",
    "BranchID": 3,
    "CCCD": "0345678901",
    "EmpID": "EMP03"
  },
  {
    "TicketID": "TKT0004   ",
    "TicketType": "STD",
    "BranchID": 4,
    "CCCD": "0456789012",
    "EmpID": "EMP04"
  },
  {
    "TicketID": "TKT0005   ",
    "TicketType": "PRE",
    "BranchID": 5,
    "CCCD": "0567890123",
    "EmpID": "EMP05"
  },
  {
    "TicketID": "TKT0006   ",
    "TicketType": "ONL",
    "BranchID": 6,
    "CCCD": "0678901234",
    "EmpID": "EMP06"
  },
  {
    "TicketID": "TKT0007   ",
    "TicketType": "STD",
    "BranchID": 7,
    "CCCD": "0789012345",
    "EmpID": "EMP07"
  },
  {
    "TicketID": "TKT0008   ",
    "TicketType": "PRE",
    "BranchID": 8,
    "CCCD": "0890123456",
    "EmpID": "EMP08"
  },
  {
    "TicketID": "TKT0009   ",
    "TicketType": "ONL",
    "BranchID": 9,
    "CCCD": "0901234567",
    "EmpID": "EMP09"
  },
  {
    "TicketID": "TKT0010   ",
    "TicketType": "STD",
    "BranchID": 10,
    "CCCD": "1012345678",
    "EmpID": "EMP10"
  },
  {
    "TicketID": "TKT0011   ",
    "TicketType": "PRE",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "EMP01"
  },
  {
    "TicketID": "TKT0012   ",
    "TicketType": "ONL",
    "BranchID": 2,
    "CCCD": "0234567890",
    "EmpID": "EMP02"
  },
  {
    "TicketID": "TKT0013   ",
    "TicketType": "STD",
    "BranchID": 3,
    "CCCD": "0345678901",
    "EmpID": "EMP03"
  },
  {
    "TicketID": "TKT0014   ",
    "TicketType": "PRE",
    "BranchID": 4,
    "CCCD": "0456789012",
    "EmpID": "EMP04"
  },
  {
    "TicketID": "TKT0015   ",
    "TicketType": "ONL",
    "BranchID": 5,
    "CCCD": "0567890123",
    "EmpID": "EMP05"
  },
  {
    "TicketID": "TKT0016   ",
    "TicketType": "STD",
    "BranchID": 6,
    "CCCD": "0678901234",
    "EmpID": "EMP06"
  },
  {
    "TicketID": "TKT0017   ",
    "TicketType": "PRE",
    "BranchID": 7,
    "CCCD": "0789012345",
    "EmpID": "EMP07"
  },
  {
    "TicketID": "TKT0018   ",
    "TicketType": "ONL",
    "BranchID": 8,
    "CCCD": "0890123456",
    "EmpID": "EMP08"
  },
  {
    "TicketID": "TKT0019   ",
    "TicketType": "STD",
    "BranchID": 9,
    "CCCD": "0901234567",
    "EmpID": "EMP09"
  },
  {
    "TicketID": "TKT0020   ",
    "TicketType": "PRE",
    "BranchID": 10,
    "CCCD": "1012345678",
    "EmpID": "EMP10"
  },
  {
    "TicketID": "TKT0031   ",
    "TicketType": "PRE",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "EMP01"
  },
  {
    "TicketID": "TKT0032   ",
    "TicketType": "STD",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "EMP01"
  },
  {
    "TicketID": "TKT0033   ",
    "TicketType": "ONL",
    "BranchID": 1,
    "CCCD": "0123456789",
    "EmpID": "EMP01"
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
  