
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "PTicketID": "TKT0002   ",
    "BranchName": "Sushi Qu?n 12",
    "Area": "Area 2",
    "NumberofCustomer": 4,
    "PreOrderDate": "2023-12-13",
    "PreOrderArrivalTime": "1970-01-01T18:30:00.000Z",
    "PreOrderNote": "Please prepare a table for 4 people"
  },
  {
    "PTicketID": "TKT0005   ",
    "BranchName": "Sushi Qu?n 4",
    "Area": "Area 2",
    "NumberofCustomer": 2,
    "PreOrderDate": "2023-12-14",
    "PreOrderArrivalTime": "1970-01-01T12:00:00.000Z",
    "PreOrderNote": "We would like to have a quiet table, please"
  },
  {
    "PTicketID": "TKT0008   ",
    "BranchName": "Sushi Gò V?p",
    "Area": "Area 2",
    "NumberofCustomer": 6,
    "PreOrderDate": "2023-12-15",
    "PreOrderArrivalTime": "1970-01-01T19:30:00.000Z",
    "PreOrderNote": "Please prepare a table near the window"
  },
  {
    "PTicketID": "TKT0011   ",
    "BranchName": "Sushi Bình Th?nh",
    "Area": "Area 1",
    "NumberofCustomer": 3,
    "PreOrderDate": "2023-12-16",
    "PreOrderArrivalTime": "1970-01-01T17:00:00.000Z",
    "PreOrderNote": "We have a child with us, please prepare a high chair"
  },
  {
    "PTicketID": "TKT0014   ",
    "BranchName": "Sushi Qu?n 3",
    "Area": "Area 4",
    "NumberofCustomer": 5,
    "PreOrderDate": "2023-12-17",
    "PreOrderArrivalTime": "1970-01-01T11:30:00.000Z",
    "PreOrderNote": "We would like to have a table near the sushi bar"
  },
  {
    "PTicketID": "TKT0017   ",
    "BranchName": "Sushi C?u Gi?y",
    "Area": "Area 3",
    "NumberofCustomer": 2,
    "PreOrderDate": "2023-12-18",
    "PreOrderArrivalTime": "1970-01-01T13:00:00.000Z",
    "PreOrderNote": "Please prepare a table for two, no smoking area"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('PRE_ORDER_TICKET', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into PRE_ORDER_TICKET: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('PRE_ORDER_TICKET', null, {});
  }
};
  