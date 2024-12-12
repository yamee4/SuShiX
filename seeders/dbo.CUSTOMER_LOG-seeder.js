
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('CUSTOMER_LOG', [
  {
    "CCCD": "0123456789",
    "Accessed_datetime": "2023-11-12T10:30:00.000Z",
    "Accessed_time_duration": 30
  },
  {
    "CCCD": "0123456789",
    "Accessed_datetime": "2023-11-13T15:15:00.000Z",
    "Accessed_time_duration": 45
  },
  {
    "CCCD": "0234567890",
    "Accessed_datetime": "2023-12-01T13:15:00.000Z",
    "Accessed_time_duration": 20
  },
  {
    "CCCD": "0234567890",
    "Accessed_datetime": "2023-12-02T18:30:00.000Z",
    "Accessed_time_duration": 35
  },
  {
    "CCCD": "0345678901",
    "Accessed_datetime": "2023-10-25T15:45:00.000Z",
    "Accessed_time_duration": 15
  },
  {
    "CCCD": "0345678901",
    "Accessed_datetime": "2023-10-26T11:00:00.000Z",
    "Accessed_time_duration": 25
  },
  {
    "CCCD": "0456789012",
    "Accessed_datetime": "2023-11-20T09:15:00.000Z",
    "Accessed_time_duration": 20
  },
  {
    "CCCD": "0456789012",
    "Accessed_datetime": "2023-11-21T14:30:00.000Z",
    "Accessed_time_duration": 30
  },
  {
    "CCCD": "0567890123",
    "Accessed_datetime": "2023-12-10T11:30:00.000Z",
    "Accessed_time_duration": 10
  },
  {
    "CCCD": "0567890123",
    "Accessed_datetime": "2023-12-11T16:45:00.000Z",
    "Accessed_time_duration": 25
  },
  {
    "CCCD": "0678901234",
    "Accessed_datetime": "2023-11-15T12:00:00.000Z",
    "Accessed_time_duration": 35
  },
  {
    "CCCD": "0678901234",
    "Accessed_datetime": "2023-11-16T18:15:00.000Z",
    "Accessed_time_duration": 20
  },
  {
    "CCCD": "0789012345",
    "Accessed_datetime": "2023-12-05T10:30:00.000Z",
    "Accessed_time_duration": 15
  },
  {
    "CCCD": "0789012345",
    "Accessed_datetime": "2023-12-06T15:45:00.000Z",
    "Accessed_time_duration": 30
  },
  {
    "CCCD": "0890123456",
    "Accessed_datetime": "2023-11-22T13:15:00.000Z",
    "Accessed_time_duration": 25
  },
  {
    "CCCD": "0890123456",
    "Accessed_datetime": "2023-11-23T19:30:00.000Z",
    "Accessed_time_duration": 20
  },
  {
    "CCCD": "0901234567",
    "Accessed_datetime": "2023-12-12T11:00:00.000Z",
    "Accessed_time_duration": 10
  },
  {
    "CCCD": "0901234567",
    "Accessed_datetime": "2023-12-13T16:15:00.000Z",
    "Accessed_time_duration": 35
  },
  {
    "CCCD": "1012345678",
    "Accessed_datetime": "2023-11-27T12:30:00.000Z",
    "Accessed_time_duration": 20
  },
  {
    "CCCD": "1012345678",
    "Accessed_datetime": "2023-11-28T18:45:00.000Z",
    "Accessed_time_duration": 25
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('CUSTOMER_LOG', null, {});
  }
};
  