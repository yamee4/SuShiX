
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('BRANCH_PHONE_NUMBER', [
  {
    "BranchID": 1,
    "PhoneNumber": "0912345678"
  },
  {
    "BranchID": 1,
    "PhoneNumber": "0987654321"
  },
  {
    "BranchID": 2,
    "PhoneNumber": "0901234567"
  },
  {
    "BranchID": 2,
    "PhoneNumber": "0934567890"
  },
  {
    "BranchID": 3,
    "PhoneNumber": "0967890123"
  },
  {
    "BranchID": 3,
    "PhoneNumber": "0998765432"
  },
  {
    "BranchID": 4,
    "PhoneNumber": "0956789012"
  },
  {
    "BranchID": 4,
    "PhoneNumber": "0978901234"
  },
  {
    "BranchID": 5,
    "PhoneNumber": "0921098765"
  },
  {
    "BranchID": 5,
    "PhoneNumber": "0943210987"
  },
  {
    "BranchID": 6,
    "PhoneNumber": "0912345678"
  },
  {
    "BranchID": 6,
    "PhoneNumber": "0987654321"
  },
  {
    "BranchID": 7,
    "PhoneNumber": "0901234567"
  },
  {
    "BranchID": 7,
    "PhoneNumber": "0934567890"
  },
  {
    "BranchID": 8,
    "PhoneNumber": "0967890123"
  },
  {
    "BranchID": 8,
    "PhoneNumber": "0998765432"
  },
  {
    "BranchID": 9,
    "PhoneNumber": "0956789012"
  },
  {
    "BranchID": 9,
    "PhoneNumber": "0978901234"
  },
  {
    "BranchID": 10,
    "PhoneNumber": "0921098765"
  },
  {
    "BranchID": 10,
    "PhoneNumber": "0943210987"
  },
  {
    "BranchID": 11,
    "PhoneNumber": "0912345678"
  },
  {
    "BranchID": 11,
    "PhoneNumber": "0987654321"
  },
  {
    "BranchID": 12,
    "PhoneNumber": "0901234567"
  },
  {
    "BranchID": 12,
    "PhoneNumber": "0934567890"
  },
  {
    "BranchID": 13,
    "PhoneNumber": "0967890123"
  },
  {
    "BranchID": 13,
    "PhoneNumber": "0998765432"
  },
  {
    "BranchID": 14,
    "PhoneNumber": "0956789012"
  },
  {
    "BranchID": 14,
    "PhoneNumber": "0978901234"
  },
  {
    "BranchID": 15,
    "PhoneNumber": "0921098765"
  },
  {
    "BranchID": 15,
    "PhoneNumber": "0943210987"
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('BRANCH_PHONE_NUMBER', null, {});
  }
};
  