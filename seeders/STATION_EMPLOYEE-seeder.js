
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "BranchID": 1,
    "EmpID": "00001",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 1,
    "EmpID": "00006",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 2,
    "EmpID": "00002",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 2,
    "EmpID": "00017",
    "StationName": "Server"
  },
  {
    "BranchID": 3,
    "EmpID": "00003",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 3,
    "EmpID": "00018",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 4,
    "EmpID": "00004",
    "StationName": "Server"
  },
  {
    "BranchID": 4,
    "EmpID": "00019",
    "StationName": "Cashier"
  },
  {
    "BranchID": 5,
    "EmpID": "00005",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 5,
    "EmpID": "00020",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 6,
    "EmpID": "00006",
    "StationName": "Cashier"
  },
  {
    "BranchID": 6,
    "EmpID": "00021",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 7,
    "EmpID": "00007",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 7,
    "EmpID": "00022",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 8,
    "EmpID": "00008",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 8,
    "EmpID": "00023",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 9,
    "EmpID": "00009",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 9,
    "EmpID": "00024",
    "StationName": "Server"
  },
  {
    "BranchID": 10,
    "EmpID": "00010",
    "StationName": "Sushi Preparer"
  },
  {
    "BranchID": 10,
    "EmpID": "00025",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 11,
    "EmpID": "00011",
    "StationName": "Server"
  },
  {
    "BranchID": 11,
    "EmpID": "00026",
    "StationName": "Cashier"
  },
  {
    "BranchID": 12,
    "EmpID": "00012",
    "StationName": "Dishwasher"
  },
  {
    "BranchID": 12,
    "EmpID": "00027",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 13,
    "EmpID": "00013",
    "StationName": "Cashier"
  },
  {
    "BranchID": 13,
    "EmpID": "00028",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 14,
    "EmpID": "00014",
    "StationName": "Host/Hostess"
  },
  {
    "BranchID": 14,
    "EmpID": "00029",
    "StationName": "Teppanyaki Chef"
  },
  {
    "BranchID": 15,
    "EmpID": "00015",
    "StationName": "Sushi Chef"
  },
  {
    "BranchID": 15,
    "EmpID": "00030",
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
  