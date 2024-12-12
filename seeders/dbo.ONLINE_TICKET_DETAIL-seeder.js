
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('ONLINE_TICKET_DETAIL', [
  {
    "OTicketID": "TKT0003   ",
    "DishID": 1,
    "OrderTime": "2023-12-15T11:30:00.000Z",
    "Quantity": 2,
    "Price": 50000
  },
  {
    "OTicketID": "TKT0003   ",
    "DishID": 2,
    "OrderTime": "2023-12-15T11:35:00.000Z",
    "Quantity": 1,
    "Price": 30000
  },
  {
    "OTicketID": "TKT0006   ",
    "DishID": 3,
    "OrderTime": "2023-12-16T18:00:00.000Z",
    "Quantity": 3,
    "Price": 40000
  },
  {
    "OTicketID": "TKT0006   ",
    "DishID": 4,
    "OrderTime": "2023-12-16T18:05:00.000Z",
    "Quantity": 2,
    "Price": 25000
  },
  {
    "OTicketID": "TKT0009   ",
    "DishID": 5,
    "OrderTime": "2023-12-17T09:45:00.000Z",
    "Quantity": 1,
    "Price": 60000
  },
  {
    "OTicketID": "TKT0012   ",
    "DishID": 6,
    "OrderTime": "2023-12-18T13:15:00.000Z",
    "Quantity": 2,
    "Price": 35000
  },
  {
    "OTicketID": "TKT0012   ",
    "DishID": 7,
    "OrderTime": "2023-12-18T13:20:00.000Z",
    "Quantity": 1,
    "Price": 20000
  },
  {
    "OTicketID": "TKT0015   ",
    "DishID": 8,
    "OrderTime": "2023-12-19T10:45:00.000Z",
    "Quantity": 3,
    "Price": 45000
  },
  {
    "OTicketID": "TKT0018   ",
    "DishID": 9,
    "OrderTime": "2023-12-20T16:00:00.000Z",
    "Quantity": 2,
    "Price": 55000
  },
  {
    "OTicketID": "TKT0018   ",
    "DishID": 10,
    "OrderTime": "2023-12-20T16:05:00.000Z",
    "Quantity": 1,
    "Price": 30000
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('ONLINE_TICKET_DETAIL', null, {});
  }
};
  