
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "EmpID": "00001",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "A",
    "EmpBirthDate": "1985-01-01T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 15000000,
    "BranchManager": 1
  },
  {
    "EmpID": "00002",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "B",
    "EmpBirthDate": "1990-03-15T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12000000,
    "BranchManager": 2
  },
  {
    "EmpID": "00003",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "C",
    "EmpBirthDate": "1988-07-20T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13500000,
    "BranchManager": 3
  },
  {
    "EmpID": "00004",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "D",
    "EmpBirthDate": "1992-11-05T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11000000,
    "BranchManager": 4
  },
  {
    "EmpID": "00005",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "E",
    "EmpBirthDate": "1987-09-28T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14000000,
    "BranchManager": 5
  },
  {
    "EmpID": "00006",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "F",
    "EmpBirthDate": "1989-05-12T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12500000,
    "BranchManager": 6
  },
  {
    "EmpID": "00007",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "G",
    "EmpBirthDate": "1991-08-25T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13000000,
    "BranchManager": 7
  },
  {
    "EmpID": "00008",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "H",
    "EmpBirthDate": "1986-02-18T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11500000,
    "BranchManager": 8
  },
  {
    "EmpID": "00009",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "I",
    "EmpBirthDate": "1993-04-10T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14500000,
    "BranchManager": 9
  },
  {
    "EmpID": "00010",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "J",
    "EmpBirthDate": "1988-12-23T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12000000,
    "BranchManager": 10
  },
  {
    "EmpID": "00011",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "K",
    "EmpBirthDate": "1990-06-17T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13500000,
    "BranchManager": 11
  },
  {
    "EmpID": "00012",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "L",
    "EmpBirthDate": "1992-10-02T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11000000,
    "BranchManager": 12
  },
  {
    "EmpID": "00013",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "M",
    "EmpBirthDate": "1987-08-15T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14000000,
    "BranchManager": 13
  },
  {
    "EmpID": "00014",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "N",
    "EmpBirthDate": "1989-04-29T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12500000,
    "BranchManager": 14
  },
  {
    "EmpID": "00015",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "O",
    "EmpBirthDate": "1991-07-13T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13000000,
    "BranchManager": 15
  },
  {
    "EmpID": "00016",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "P",
    "EmpBirthDate": "1986-01-25T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11500000,
    "BranchManager": null
  },
  {
    "EmpID": "00017",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "Q",
    "EmpBirthDate": "1993-03-12T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14500000,
    "BranchManager": null
  },
  {
    "EmpID": "00018",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "R",
    "EmpBirthDate": "1988-11-19T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12000000,
    "BranchManager": null
  },
  {
    "EmpID": "00019",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "S",
    "EmpBirthDate": "1990-05-26T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13500000,
    "BranchManager": null
  },
  {
    "EmpID": "00020",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "T",
    "EmpBirthDate": "1992-09-11T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11000000,
    "BranchManager": null
  },
  {
    "EmpID": "00021",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "U",
    "EmpBirthDate": "1987-07-28T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14000000,
    "BranchManager": null
  },
  {
    "EmpID": "00022",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "V",
    "EmpBirthDate": "1989-03-14T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12500000,
    "BranchManager": null
  },
  {
    "EmpID": "00023",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "W",
    "EmpBirthDate": "1991-06-22T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13000000,
    "BranchManager": null
  },
  {
    "EmpID": "00024",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "X",
    "EmpBirthDate": "1986-01-07T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11500000,
    "BranchManager": null
  },
  {
    "EmpID": "00025",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "Y",
    "EmpBirthDate": "1993-02-25T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14500000,
    "BranchManager": null
  },
  {
    "EmpID": "00026",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "Z",
    "EmpBirthDate": "1988-10-28T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12000000,
    "BranchManager": null
  },
  {
    "EmpID": "00027",
    "EmpFirstName": "Lê Văn",
    "EmpLastName": "A",
    "EmpBirthDate": "1990-04-13T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 13500000,
    "BranchManager": null
  },
  {
    "EmpID": "00028",
    "EmpFirstName": "Hoàng Thị",
    "EmpLastName": "B",
    "EmpBirthDate": "1992-08-21T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 11000000,
    "BranchManager": null
  },
  {
    "EmpID": "00029",
    "EmpFirstName": "Nguyễn Văn",
    "EmpLastName": "C",
    "EmpBirthDate": "1987-06-10T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 14000000,
    "BranchManager": null
  },
  {
    "EmpID": "00030",
    "EmpFirstName": "Trần Thị",
    "EmpLastName": "D",
    "EmpBirthDate": "1989-02-27T00:00:00.000Z",
    "EmpGender": "Nữ ",
    "Salary": 12500000,
    "BranchManager": null
  },
  {
    "EmpID": "00031",
    "EmpFirstName": "Nguyễn Xạo",
    "EmpLastName": "Loz",
    "EmpBirthDate": "2002-02-02T00:00:00.000Z",
    "EmpGender": "Nam",
    "Salary": 20000,
    "BranchManager": null
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('EMPLOYEE', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into EMPLOYEE: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('EMPLOYEE', null, {});
  }
};
  