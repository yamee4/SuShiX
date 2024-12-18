
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "EmpID": "00001",
    "StartDate": "2010-01-01T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 1
  },
  {
    "EmpID": "00002",
    "StartDate": "2012-03-15T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 2
  },
  {
    "EmpID": "00003",
    "StartDate": "2011-07-20T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 3
  },
  {
    "EmpID": "00004",
    "StartDate": "2013-11-05T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 4
  },
  {
    "EmpID": "00005",
    "StartDate": "2009-09-28T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 5
  },
  {
    "EmpID": "00006",
    "StartDate": "2011-05-12T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 6
  },
  {
    "EmpID": "00007",
    "StartDate": "2013-08-25T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 7
  },
  {
    "EmpID": "00008",
    "StartDate": "2010-02-18T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 8
  },
  {
    "EmpID": "00009",
    "StartDate": "2014-04-10T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 9
  },
  {
    "EmpID": "00010",
    "StartDate": "2011-12-23T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 10
  },
  {
    "EmpID": "00011",
    "StartDate": "2013-06-17T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 11
  },
  {
    "EmpID": "00012",
    "StartDate": "2014-10-02T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 12
  },
  {
    "EmpID": "00013",
    "StartDate": "2010-08-15T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 13
  },
  {
    "EmpID": "00014",
    "StartDate": "2012-04-29T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 14
  },
  {
    "EmpID": "00015",
    "StartDate": "2014-07-13T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 15
  },
  {
    "EmpID": "00016",
    "StartDate": "2010-01-25T00:00:00.000Z",
    "EndDate": "2015-12-31T00:00:00.000Z",
    "BranchID": 1
  },
  {
    "EmpID": "00017",
    "StartDate": "2013-03-12T00:00:00.000Z",
    "EndDate": "2018-06-30T00:00:00.000Z",
    "BranchID": 2
  },
  {
    "EmpID": "00018",
    "StartDate": "2011-11-19T00:00:00.000Z",
    "EndDate": "2016-09-30T00:00:00.000Z",
    "BranchID": 3
  },
  {
    "EmpID": "00019",
    "StartDate": "2014-05-26T00:00:00.000Z",
    "EndDate": "2019-03-31T00:00:00.000Z",
    "BranchID": 4
  },
  {
    "EmpID": "00020",
    "StartDate": "2012-09-11T00:00:00.000Z",
    "EndDate": "2017-07-31T00:00:00.000Z",
    "BranchID": 5
  },
  {
    "EmpID": "00021",
    "StartDate": "2010-07-28T00:00:00.000Z",
    "EndDate": "2015-06-30T00:00:00.000Z",
    "BranchID": 6
  },
  {
    "EmpID": "00022",
    "StartDate": "2012-03-14T00:00:00.000Z",
    "EndDate": "2017-01-31T00:00:00.000Z",
    "BranchID": 7
  },
  {
    "EmpID": "00023",
    "StartDate": "2014-06-22T00:00:00.000Z",
    "EndDate": "2019-04-30T00:00:00.000Z",
    "BranchID": 8
  },
  {
    "EmpID": "00024",
    "StartDate": "2010-01-07T00:00:00.000Z",
    "EndDate": "2015-11-30T00:00:00.000Z",
    "BranchID": 9
  },
  {
    "EmpID": "00025",
    "StartDate": "2013-02-25T00:00:00.000Z",
    "EndDate": "2018-12-31T00:00:00.000Z",
    "BranchID": 10
  },
  {
    "EmpID": "00026",
    "StartDate": "2011-10-28T00:00:00.000Z",
    "EndDate": "2016-09-30T00:00:00.000Z",
    "BranchID": 11
  },
  {
    "EmpID": "00027",
    "StartDate": "2014-04-13T00:00:00.000Z",
    "EndDate": "2019-02-28T00:00:00.000Z",
    "BranchID": 12
  },
  {
    "EmpID": "00028",
    "StartDate": "2012-08-21T00:00:00.000Z",
    "EndDate": "2017-07-31T00:00:00.000Z",
    "BranchID": 13
  },
  {
    "EmpID": "00029",
    "StartDate": "2010-06-10T00:00:00.000Z",
    "EndDate": "2015-05-31T00:00:00.000Z",
    "BranchID": 14
  },
  {
    "EmpID": "00030",
    "StartDate": "2012-02-27T00:00:00.000Z",
    "EndDate": "2017-01-31T00:00:00.000Z",
    "BranchID": 15
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('WORK_HISTORY', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into WORK_HISTORY: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('WORK_HISTORY', null, {});
  }
};
  