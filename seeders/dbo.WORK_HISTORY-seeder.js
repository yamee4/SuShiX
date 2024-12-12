
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('WORK_HISTORY', [
  {
    "EmpID": "EMP01",
    "StartDate": "2010-01-01T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 1
  },
  {
    "EmpID": "EMP02",
    "StartDate": "2012-03-15T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 2
  },
  {
    "EmpID": "EMP03",
    "StartDate": "2011-07-20T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 3
  },
  {
    "EmpID": "EMP04",
    "StartDate": "2013-11-05T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 4
  },
  {
    "EmpID": "EMP05",
    "StartDate": "2009-09-28T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 5
  },
  {
    "EmpID": "EMP06",
    "StartDate": "2011-05-12T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 6
  },
  {
    "EmpID": "EMP07",
    "StartDate": "2013-08-25T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 7
  },
  {
    "EmpID": "EMP08",
    "StartDate": "2010-02-18T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 8
  },
  {
    "EmpID": "EMP09",
    "StartDate": "2014-04-10T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 9
  },
  {
    "EmpID": "EMP10",
    "StartDate": "2011-12-23T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 10
  },
  {
    "EmpID": "EMP11",
    "StartDate": "2013-06-17T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 11
  },
  {
    "EmpID": "EMP12",
    "StartDate": "2014-10-02T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 12
  },
  {
    "EmpID": "EMP13",
    "StartDate": "2010-08-15T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 13
  },
  {
    "EmpID": "EMP14",
    "StartDate": "2012-04-29T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 14
  },
  {
    "EmpID": "EMP15",
    "StartDate": "2014-07-13T00:00:00.000Z",
    "EndDate": null,
    "BranchID": 15
  },
  {
    "EmpID": "EMP16",
    "StartDate": "2010-01-25T00:00:00.000Z",
    "EndDate": "2015-12-31T00:00:00.000Z",
    "BranchID": 1
  },
  {
    "EmpID": "EMP17",
    "StartDate": "2013-03-12T00:00:00.000Z",
    "EndDate": "2018-06-30T00:00:00.000Z",
    "BranchID": 2
  },
  {
    "EmpID": "EMP18",
    "StartDate": "2011-11-19T00:00:00.000Z",
    "EndDate": "2016-09-30T00:00:00.000Z",
    "BranchID": 3
  },
  {
    "EmpID": "EMP19",
    "StartDate": "2014-05-26T00:00:00.000Z",
    "EndDate": "2019-03-31T00:00:00.000Z",
    "BranchID": 4
  },
  {
    "EmpID": "EMP20",
    "StartDate": "2012-09-11T00:00:00.000Z",
    "EndDate": "2017-07-31T00:00:00.000Z",
    "BranchID": 5
  },
  {
    "EmpID": "EMP21",
    "StartDate": "2010-07-28T00:00:00.000Z",
    "EndDate": "2015-06-30T00:00:00.000Z",
    "BranchID": 6
  },
  {
    "EmpID": "EMP22",
    "StartDate": "2012-03-14T00:00:00.000Z",
    "EndDate": "2017-01-31T00:00:00.000Z",
    "BranchID": 7
  },
  {
    "EmpID": "EMP23",
    "StartDate": "2014-06-22T00:00:00.000Z",
    "EndDate": "2019-04-30T00:00:00.000Z",
    "BranchID": 8
  },
  {
    "EmpID": "EMP24",
    "StartDate": "2010-01-07T00:00:00.000Z",
    "EndDate": "2015-11-30T00:00:00.000Z",
    "BranchID": 9
  },
  {
    "EmpID": "EMP25",
    "StartDate": "2013-02-25T00:00:00.000Z",
    "EndDate": "2018-12-31T00:00:00.000Z",
    "BranchID": 10
  },
  {
    "EmpID": "EMP26",
    "StartDate": "2011-10-28T00:00:00.000Z",
    "EndDate": "2016-09-30T00:00:00.000Z",
    "BranchID": 11
  },
  {
    "EmpID": "EMP27",
    "StartDate": "2014-04-13T00:00:00.000Z",
    "EndDate": "2019-02-28T00:00:00.000Z",
    "BranchID": 12
  },
  {
    "EmpID": "EMP28",
    "StartDate": "2012-08-21T00:00:00.000Z",
    "EndDate": "2017-07-31T00:00:00.000Z",
    "BranchID": 13
  },
  {
    "EmpID": "EMP29",
    "StartDate": "2010-06-10T00:00:00.000Z",
    "EndDate": "2015-05-31T00:00:00.000Z",
    "BranchID": 14
  },
  {
    "EmpID": "EMP30",
    "StartDate": "2012-02-27T00:00:00.000Z",
    "EndDate": "2017-01-31T00:00:00.000Z",
    "BranchID": 15
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('WORK_HISTORY', null, {});
  }
};
  