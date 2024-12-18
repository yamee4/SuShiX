
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "CCCD": "0123456789",
    "CustomerFirstName": "Nguyễn Văn",
    "CustomerLastName": "A",
    "PhoneNumber": "0987654321",
    "Email": "vanan@gmail.com",
    "Gender": "Nam",
    "isMember": true,
    "isRegistered": true
  },
  {
    "CCCD": "0234567890",
    "CustomerFirstName": "Trần Thị",
    "CustomerLastName": "B",
    "PhoneNumber": "0987654321",
    "Email": "thib@gmail.com",
    "Gender": "Nữ ",
    "isMember": false,
    "isRegistered": true
  },
  {
    "CCCD": "0345678901",
    "CustomerFirstName": "Lê Thị",
    "CustomerLastName": "C",
    "PhoneNumber": "0987654321",
    "Email": "thic@gmail.com",
    "Gender": "Nữ ",
    "isMember": true,
    "isRegistered": true
  },
  {
    "CCCD": "0456789012",
    "CustomerFirstName": "Hoàng Văn",
    "CustomerLastName": "D",
    "PhoneNumber": "0987654321",
    "Email": "vand@gmail.com",
    "Gender": "Nam",
    "isMember": false,
    "isRegistered": true
  },
  {
    "CCCD": "0567890123",
    "CustomerFirstName": "Nguyễn Thị",
    "CustomerLastName": "E",
    "PhoneNumber": "0987654321",
    "Email": "thie@gmail.com",
    "Gender": "Nữ ",
    "isMember": true,
    "isRegistered": true
  },
  {
    "CCCD": "0678901234",
    "CustomerFirstName": "Trần Văn",
    "CustomerLastName": "F",
    "PhoneNumber": "0987654321",
    "Email": "vanf@gmail.com",
    "Gender": "Nam",
    "isMember": false,
    "isRegistered": true
  },
  {
    "CCCD": "0789012345",
    "CustomerFirstName": "Lê Văn",
    "CustomerLastName": "G",
    "PhoneNumber": "0987654321",
    "Email": "vang@gmail.com",
    "Gender": "Nam",
    "isMember": true,
    "isRegistered": true
  },
  {
    "CCCD": "0890123456",
    "CustomerFirstName": "Hoàng Thị",
    "CustomerLastName": "H",
    "PhoneNumber": "0987654321",
    "Email": "thih@gmail.com",
    "Gender": "Nữ ",
    "isMember": false,
    "isRegistered": true
  },
  {
    "CCCD": "0901234567",
    "CustomerFirstName": "Nguyễn Văn",
    "CustomerLastName": "I",
    "PhoneNumber": "0987654321",
    "Email": "vani@gmail.com",
    "Gender": "Nam",
    "isMember": true,
    "isRegistered": true
  },
  {
    "CCCD": "1012345678",
    "CustomerFirstName": "Trần Thị",
    "CustomerLastName": "J",
    "PhoneNumber": "0987654321",
    "Email": "thij@gmail.com",
    "Gender": "Nu ",
    "isMember": false,
    "isRegistered": true
  },
  {
    "CCCD": "1111111111",
    "CustomerFirstName": "Huy",
    "CustomerLastName": "Phan Thanh Quang",
    "PhoneNumber": null,
    "Email": "sontungmtp@gmail.com",
    "Gender": "Nữ ",
    "isMember": false,
    "isRegistered": true
  },
  {
    "CCCD": "1234567890",
    "CustomerFirstName": "Huy",
    "CustomerLastName": "Phan Thanh",
    "PhoneNumber": null,
    "Email": null,
    "Gender": "N? ",
    "isMember": false,
    "isRegistered": true
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('CUSTOMER', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into CUSTOMER: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('CUSTOMER', null, {});
  }
};
  