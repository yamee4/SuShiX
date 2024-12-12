
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('DISH', [
  {
    "DishID": 1,
    "DishName": "Sushi California Roll",
    "CurrentPrice": 50000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 2,
    "DishName": "Sushi Dragon Roll",
    "CurrentPrice": 60000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 3,
    "DishName": "Sushi Salmon Roll",
    "CurrentPrice": 45000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 4,
    "DishName": "Sushi Tuna Roll",
    "CurrentPrice": 55000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 5,
    "DishName": "Sushi Tempura Roll",
    "CurrentPrice": 65000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 6,
    "DishName": "Sushi Spicy Tuna Roll",
    "CurrentPrice": 60000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 7,
    "DishName": "Sushi Eel Roll",
    "CurrentPrice": 70000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 8,
    "DishName": "Sushi Rainbow Roll",
    "CurrentPrice": 75000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 9,
    "DishName": "Sashimi Salmon",
    "CurrentPrice": 80000,
    "DishSection": "Sashimi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 10,
    "DishName": "Sashimi Tuna",
    "CurrentPrice": 85000,
    "DishSection": "Sashimi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 11,
    "DishName": "Sashimi Mixed",
    "CurrentPrice": 100000,
    "DishSection": "Sashimi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 12,
    "DishName": "Nigiri Salmon",
    "CurrentPrice": 30000,
    "DishSection": "Nigiri",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 13,
    "DishName": "Nigiri Tuna",
    "CurrentPrice": 35000,
    "DishSection": "Nigiri",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 14,
    "DishName": "Nigiri Eel",
    "CurrentPrice": 40000,
    "DishSection": "Nigiri",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 15,
    "DishName": "Nigiri Mixed",
    "CurrentPrice": 50000,
    "DishSection": "Nigiri",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 16,
    "DishName": "Edamame",
    "CurrentPrice": 20000,
    "DishSection": "Appetizer",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 17,
    "DishName": "Gyoza",
    "CurrentPrice": 30000,
    "DishSection": "Appetizer",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 18,
    "DishName": "Miso Soup",
    "CurrentPrice": 15000,
    "DishSection": "Soup",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 19,
    "DishName": "Ramen",
    "CurrentPrice": 40000,
    "DishSection": "Noodle",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 20,
    "DishName": "Udon",
    "CurrentPrice": 35000,
    "DishSection": "Noodle",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 21,
    "DishName": "Sushi Combo A",
    "CurrentPrice": 150000,
    "DishSection": "Combo",
    "isCombo": true,
    "DeliveryAvailable": true
  },
  {
    "DishID": 22,
    "DishName": "Sushi Combo B",
    "CurrentPrice": 200000,
    "DishSection": "Combo",
    "isCombo": true,
    "DeliveryAvailable": true
  },
  {
    "DishID": 23,
    "DishName": "Sashimi Combo",
    "CurrentPrice": 250000,
    "DishSection": "Combo",
    "isCombo": true,
    "DeliveryAvailable": true
  },
  {
    "DishID": 24,
    "DishName": "Nigiri Combo",
    "CurrentPrice": 180000,
    "DishSection": "Combo",
    "isCombo": true,
    "DeliveryAvailable": true
  },
  {
    "DishID": 25,
    "DishName": "Dessert Mochi",
    "CurrentPrice": 25000,
    "DishSection": "Dessert",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 26,
    "DishName": "Dessert Matcha Ice Cream",
    "CurrentPrice": 30000,
    "DishSection": "Dessert",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 27,
    "DishName": "Dessert Green Tea Cake",
    "CurrentPrice": 35000,
    "DishSection": "Dessert",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 28,
    "DishName": "Drink Sake",
    "CurrentPrice": 50000,
    "DishSection": "Drink",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 29,
    "DishName": "Drink Beer",
    "CurrentPrice": 30000,
    "DishSection": "Drink",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 30,
    "DishName": "Drink Soda",
    "CurrentPrice": 15000,
    "DishSection": "Drink",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 31,
    "DishName": "Tempura Shrimp",
    "CurrentPrice": 40000,
    "DishSection": "Tempura",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 32,
    "DishName": "Tempura Vegetable",
    "CurrentPrice": 35000,
    "DishSection": "Tempura",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 33,
    "DishName": "Tempura Mixed",
    "CurrentPrice": 50000,
    "DishSection": "Tempura",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 34,
    "DishName": "Grilled Eel",
    "CurrentPrice": 60000,
    "DishSection": "Grilled",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 35,
    "DishName": "Grilled Salmon",
    "CurrentPrice": 55000,
    "DishSection": "Grilled",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 36,
    "DishName": "Grilled Chicken",
    "CurrentPrice": 40000,
    "DishSection": "Grilled",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 37,
    "DishName": "Grilled Beef",
    "CurrentPrice": 65000,
    "DishSection": "Grilled",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 38,
    "DishName": "Sushi Roll Special",
    "CurrentPrice": 80000,
    "DishSection": "Sushi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 39,
    "DishName": "Sashimi Platter",
    "CurrentPrice": 150000,
    "DishSection": "Sashimi",
    "isCombo": false,
    "DeliveryAvailable": true
  },
  {
    "DishID": 40,
    "DishName": "Nigiri Platter",
    "CurrentPrice": 120000,
    "DishSection": "Nigiri",
    "isCombo": false,
    "DeliveryAvailable": true
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('DISH', null, {});
  }
};
  