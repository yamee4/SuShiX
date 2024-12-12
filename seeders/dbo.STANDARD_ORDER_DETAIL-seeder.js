
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('STANDARD_ORDER_DETAIL', [
  {
    "SOTicketID": "TKT0001   ",
    "DishID": 1,
    "OrderTime": "2023-12-12T12:00:00.000Z",
    "Quantity": 2,
    "Price": 50000
  },
  {
    "SOTicketID": "TKT0001   ",
    "DishID": 2,
    "OrderTime": "2023-12-12T12:00:00.000Z",
    "Quantity": 1,
    "Price": 30000
  },
  {
    "SOTicketID": "TKT0004   ",
    "DishID": 3,
    "OrderTime": "2023-12-13T18:30:00.000Z",
    "Quantity": 3,
    "Price": 40000
  },
  {
    "SOTicketID": "TKT0004   ",
    "DishID": 4,
    "OrderTime": "2023-12-13T18:30:00.000Z",
    "Quantity": 2,
    "Price": 25000
  },
  {
    "SOTicketID": "TKT0007   ",
    "DishID": 5,
    "OrderTime": "2023-12-14T10:15:00.000Z",
    "Quantity": 1,
    "Price": 60000
  },
  {
    "SOTicketID": "TKT0010   ",
    "DishID": 6,
    "OrderTime": "2023-12-15T14:45:00.000Z",
    "Quantity": 2,
    "Price": 35000
  },
  {
    "SOTicketID": "TKT0010   ",
    "DishID": 7,
    "OrderTime": "2023-12-15T14:45:00.000Z",
    "Quantity": 1,
    "Price": 20000
  },
  {
    "SOTicketID": "TKT0013   ",
    "DishID": 8,
    "OrderTime": "2023-12-16T11:30:00.000Z",
    "Quantity": 3,
    "Price": 45000
  },
  {
    "SOTicketID": "TKT0016   ",
    "DishID": 9,
    "OrderTime": "2023-12-17T17:00:00.000Z",
    "Quantity": 2,
    "Price": 55000
  },
  {
    "SOTicketID": "TKT0016   ",
    "DishID": 10,
    "OrderTime": "2023-12-17T17:00:00.000Z",
    "Quantity": 1,
    "Price": 30000
  },
  {
    "SOTicketID": "TKT0019   ",
    "DishID": 11,
    "OrderTime": "2023-12-18T12:30:00.000Z",
    "Quantity": 2,
    "Price": 50000
  },
  {
    "SOTicketID": "TKT0019   ",
    "DishID": 12,
    "OrderTime": "2023-12-18T12:30:00.000Z",
    "Quantity": 1,
    "Price": 30000
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('STANDARD_ORDER_DETAIL', null, {});
  }
};
  