
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "PTicketID": "TKT0002   ",
    "DishID": 1,
    "OrderTime": "2023-12-13T18:30:00.000Z",
    "Quantity": 2,
    "Price": 50000
  },
  {
    "PTicketID": "TKT0002   ",
    "DishID": 2,
    "OrderTime": "2023-12-13T18:30:00.000Z",
    "Quantity": 1,
    "Price": 30000
  },
  {
    "PTicketID": "TKT0005   ",
    "DishID": 3,
    "OrderTime": "2023-12-14T12:00:00.000Z",
    "Quantity": 3,
    "Price": 40000
  },
  {
    "PTicketID": "TKT0005   ",
    "DishID": 4,
    "OrderTime": "2023-12-14T12:00:00.000Z",
    "Quantity": 2,
    "Price": 25000
  },
  {
    "PTicketID": "TKT0008   ",
    "DishID": 5,
    "OrderTime": "2023-12-15T19:30:00.000Z",
    "Quantity": 1,
    "Price": 60000
  },
  {
    "PTicketID": "TKT0011   ",
    "DishID": 6,
    "OrderTime": "2023-12-16T17:00:00.000Z",
    "Quantity": 2,
    "Price": 35000
  },
  {
    "PTicketID": "TKT0011   ",
    "DishID": 7,
    "OrderTime": "2023-12-16T17:00:00.000Z",
    "Quantity": 1,
    "Price": 20000
  },
  {
    "PTicketID": "TKT0014   ",
    "DishID": 8,
    "OrderTime": "2023-12-17T11:30:00.000Z",
    "Quantity": 3,
    "Price": 45000
  },
  {
    "PTicketID": "TKT0017   ",
    "DishID": 9,
    "OrderTime": "2023-12-18T13:00:00.000Z",
    "Quantity": 2,
    "Price": 55000
  },
  {
    "PTicketID": "TKT0017   ",
    "DishID": 10,
    "OrderTime": "2023-12-18T13:00:00.000Z",
    "Quantity": 1,
    "Price": 30000
  },
  {
    "PTicketID": "TKT0020   ",
    "DishID": 7,
    "OrderTime": "2023-12-16T17:00:00.000Z",
    "Quantity": 1,
    "Price": 20000
  },
  {
    "PTicketID": "TKT0020   ",
    "DishID": 8,
    "OrderTime": "2023-12-17T11:30:00.000Z",
    "Quantity": 3,
    "Price": 45000
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('PRE_ORDER_TICKET_DETAIL', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into PRE_ORDER_TICKET_DETAIL: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('PRE_ORDER_TICKET_DETAIL', null, {});
  }
};
  