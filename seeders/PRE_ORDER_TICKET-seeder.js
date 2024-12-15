
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    const data = [
  {
    "PTicketID": "TKT0002   ",
    "BranchName": "Sushi Quận 12",
    "Area": "Area 2",
    "NumberofCustomer": 4,
    "PreOrderDate": "2023-12-13T15:00:00.000Z",
    "PreOrderArrivalTime": "2023-12-13T18:30:00.000Z",
    "PreOrderNote": "Xin vui lòng chuẩn bị bàn cho 4 người"
  },
  {
    "PTicketID": "TKT0005   ",
    "BranchName": "Sushi Quận 4",
    "Area": "Area 2",
    "NumberofCustomer": 2,
    "PreOrderDate": "2023-12-14T09:00:00.000Z",
    "PreOrderArrivalTime": "2023-12-14T12:00:00.000Z",
    "PreOrderNote": "Chúng tôi muốn có một bàn yên tĩnh, vui lòng"
  },
  {
    "PTicketID": "TKT0008   ",
    "BranchName": "Sushi Gò Vấp",
    "Area": "Area 2",
    "NumberofCustomer": 6,
    "PreOrderDate": "2023-12-15T16:00:00.000Z",
    "PreOrderArrivalTime": "2023-12-15T19:30:00.000Z",
    "PreOrderNote": "Xin vui lòng chuẩn bị bàn gần cửa sổ"
  },
  {
    "PTicketID": "TKT0011   ",
    "BranchName": "Sushi Bình Thạnh",
    "Area": "Area 1",
    "NumberofCustomer": 3,
    "PreOrderDate": "2023-12-16T14:00:00.000Z",
    "PreOrderArrivalTime": "2023-12-16T17:00:00.000Z",
    "PreOrderNote": "Chúng tôi có trẻ em, vui lòng chuẩn bị ghế cao"
  },
  {
    "PTicketID": "TKT0014   ",
    "BranchName": "Sushi Quận 3",
    "Area": "Area 4",
    "NumberofCustomer": 5,
    "PreOrderDate": "2023-12-17T08:30:00.000Z",
    "PreOrderArrivalTime": "2023-12-17T11:30:00.000Z",
    "PreOrderNote": "Chúng tôi muốn có bàn gần quầy sushi"
  },
  {
    "PTicketID": "TKT0017   ",
    "BranchName": "Sushi Cầu Giấy",
    "Area": "Area 3",
    "NumberofCustomer": 2,
    "PreOrderDate": "2023-12-18T09:30:00.000Z",
    "PreOrderArrivalTime": "2023-12-18T13:00:00.000Z",
    "PreOrderNote": "Xin vui lòng chuẩn bị bàn cho hai người, khu vực không hút thuốc"
  },
  {
    "PTicketID": "TKT0020   ",
    "BranchName": "Sushi Cầu Giấy",
    "Area": "Area 3",
    "NumberofCustomer": 2,
    "PreOrderDate": "2023-12-18T09:30:00.000Z",
    "PreOrderArrivalTime": "2023-12-18T13:00:00.000Z",
    "PreOrderNote": "Chúng tôi muốn miễn phí"
  },
  {
    "PTicketID": "TKT0031   ",
    "BranchName": "Sushi Bình Thạnh",
    "Area": "Area 1",
    "NumberofCustomer": 2,
    "PreOrderDate": "2024-01-01T14:00:00.000Z",
    "PreOrderArrivalTime": "2024-01-01T00:00:00.000Z",
    "PreOrderNote": null
  }
];

    for (const record of data) {
      try {
        await queryInterface.bulkInsert('PRE_ORDER_TICKET', [record], {
          ignoreDuplicates: true // Skip if duplicate key exists
        });
      } catch (error) {
        console.error(`Error inserting into PRE_ORDER_TICKET: `, error.message);
      }
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('PRE_ORDER_TICKET', null, {});
  }
};
  