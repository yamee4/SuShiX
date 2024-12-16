
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "MenuID": "M001",
    "DishID": 1,
    "inMenu": true
  },
  {
    "MenuID": "M001",
    "DishID": 2,
    "inMenu": true
  },
  {
    "MenuID": "M001",
    "DishID": 3,
    "inMenu": true
  },
  {
    "MenuID": "M001",
    "DishID": 9,
    "inMenu": true
  },
  {
    "MenuID": "M001",
    "DishID": 10,
    "inMenu": true
  },
  {
    "MenuID": "M002",
    "DishID": 4,
    "inMenu": true
  },
  {
    "MenuID": "M002",
    "DishID": 5,
    "inMenu": true
  },
  {
    "MenuID": "M002",
    "DishID": 6,
    "inMenu": true
  },
  {
    "MenuID": "M002",
    "DishID": 9,
    "inMenu": true
  },
  {
    "MenuID": "M002",
    "DishID": 12,
    "inMenu": true
  },
  {
    "MenuID": "M003",
    "DishID": 3,
    "inMenu": true
  },
  {
    "MenuID": "M003",
    "DishID": 7,
    "inMenu": true
  },
  {
    "MenuID": "M003",
    "DishID": 8,
    "inMenu": true
  },
  {
    "MenuID": "M003",
    "DishID": 9,
    "inMenu": true
  },
  {
    "MenuID": "M003",
    "DishID": 13,
    "inMenu": true
  },
  {
    "MenuID": "M004",
    "DishID": 2,
    "inMenu": true
  },
  {
    "MenuID": "M004",
    "DishID": 4,
    "inMenu": true
  },
  {
    "MenuID": "M004",
    "DishID": 10,
    "inMenu": true
  },
  {
    "MenuID": "M004",
    "DishID": 11,
    "inMenu": true
  },
  {
    "MenuID": "M004",
    "DishID": 12,
    "inMenu": true
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('DISH_MENU', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into DISH_MENU: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('DISH_MENU', null, {});
  }
};
  