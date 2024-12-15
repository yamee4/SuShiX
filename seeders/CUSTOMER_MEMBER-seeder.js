
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "MCCCD": "0123456789",
    "MemberCardNumber": "MC0007    ",
    "CreatedDate": "2024-11-12T00:00:00.000Z",
    "SupportEmp": "EMP02",
    "MemberCardRank": "BRONZE",
    "MemberCardPoints": 100,
    "MemberCardAcquiredRankDate": "2023-11-12"
  },
  {
    "MCCCD": "0345678901",
    "MemberCardNumber": "MC0002    ",
    "CreatedDate": "2023-12-01T13:15:00.000Z",
    "SupportEmp": "EMP02",
    "MemberCardRank": "SILVER",
    "MemberCardPoints": 250,
    "MemberCardAcquiredRankDate": "2023-12-01"
  },
  {
    "MCCCD": "0567890123",
    "MemberCardNumber": "MC0003    ",
    "CreatedDate": "2023-10-25T15:45:00.000Z",
    "SupportEmp": "EMP01",
    "MemberCardRank": "GOLD  ",
    "MemberCardPoints": 500,
    "MemberCardAcquiredRankDate": "2023-10-25"
  },
  {
    "MCCCD": "0678901234",
    "MemberCardNumber": "MC0006    ",
    "CreatedDate": "2023-12-12T00:00:00.000Z",
    "SupportEmp": "EMP01",
    "MemberCardRank": "SILVER",
    "MemberCardPoints": 120,
    "MemberCardAcquiredRankDate": "2023-12-10"
  },
  {
    "MCCCD": "0789012345",
    "MemberCardNumber": "MC0004    ",
    "CreatedDate": "2023-11-20T09:15:00.000Z",
    "SupportEmp": "EMP02",
    "MemberCardRank": "BRONZE",
    "MemberCardPoints": 75,
    "MemberCardAcquiredRankDate": "2023-11-20"
  },
  {
    "MCCCD": "0901234567",
    "MemberCardNumber": "MC0005    ",
    "CreatedDate": "2023-12-10T11:30:00.000Z",
    "SupportEmp": "EMP01",
    "MemberCardRank": "SILVER",
    "MemberCardPoints": 150,
    "MemberCardAcquiredRankDate": "2023-12-10"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('CUSTOMER_MEMBER', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into CUSTOMER_MEMBER: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('CUSTOMER_MEMBER', null, {});
  }
};
  