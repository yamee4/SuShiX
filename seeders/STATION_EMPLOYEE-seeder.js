
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "BranchID": 1,
    "EmpID": "EMP01",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 1,
    "EmpID": "EMP16",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 2,
    "EmpID": "EMP02",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 2,
    "EmpID": "EMP17",
    "StationName": "Server"
  },
  {
    "BranchID": 3,
    "EmpID": "EMP03",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 3,
    "EmpID": "EMP18",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 4,
    "EmpID": "EMP04",
    "StationName": "Server"
  },
  {
    "BranchID": 4,
    "EmpID": "EMP19",
    "StationName": "Cashier"
  },
  {
    "BranchID": 5,
    "EmpID": "EMP05",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 5,
    "EmpID": "EMP20",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 6,
    "EmpID": "EMP06",
    "StationName": "Cashier"
  },
  {
    "BranchID": 6,
    "EmpID": "EMP21",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 7,
    "EmpID": "EMP07",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 7,
    "EmpID": "EMP22",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 8,
    "EmpID": "EMP08",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 8,
    "EmpID": "EMP23",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 9,
    "EmpID": "EMP09",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 9,
    "EmpID": "EMP24",
    "StationName": "Server"
  },
  {
    "BranchID": 10,
    "EmpID": "EMP10",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 10,
    "EmpID": "EMP25",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 11,
    "EmpID": "EMP11",
    "StationName": "Server"
  },
  {
    "BranchID": 11,
    "EmpID": "EMP26",
    "StationName": "Cashier"
  },
  {
    "BranchID": 12,
    "EmpID": "EMP12",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 12,
    "EmpID": "EMP27",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 13,
    "EmpID": "EMP13",
    "StationName": "Cashier"
  },
  {
    "BranchID": 13,
    "EmpID": "EMP28",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 14,
    "EmpID": "EMP14",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 14,
    "EmpID": "EMP29",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 15,
    "EmpID": "EMP15",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 15,
    "EmpID": "EMP30",
    "StationName": "Sushi Preparer"
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('STATION_EMPLOYEE', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into STATION_EMPLOYEE: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('STATION_EMPLOYEE', null, {});
  }
};
  