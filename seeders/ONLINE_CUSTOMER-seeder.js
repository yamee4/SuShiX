
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "OCCCD": "0123456789",
    "O_password": "password123"
  },
  {
    "OCCCD": "0234567890",
    "O_password": "password456"
  },
  {
    "OCCCD": "0345678901",
    "O_password": "password789"
  },
  {
    "OCCCD": "0456789012",
    "O_password": "password012"
  },
  {
    "OCCCD": "0567890123",
    "O_password": "password345"
  },
  {
    "OCCCD": "0678901234",
    "O_password": "password678"
  },
  {
    "OCCCD": "0789012345",
    "O_password": "password901"
  },
  {
    "OCCCD": "0890123456",
    "O_password": "password234"
  },
  {
    "OCCCD": "0901234567",
    "O_password": "password567"
  },
  {
    "OCCCD": "1012345678",
    "O_password": "password890"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('ONLINE_CUSTOMER', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into ONLINE_CUSTOMER: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('ONLINE_CUSTOMER', null, {});
  }
};
  