
'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('BRANCH', [
  {
    "BranchID": 1,
    "BranchName": "Sushi Bình Thạnh",
    "BranchAddress": "27A, đường Bạch Đằng, Quận Bình Thạnh, TP.HCM",
    "OpeningTime": "1970-01-01T08:00:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": false,
    "AreaName": null
  },
  {
    "BranchID": 2,
    "BranchName": "Sushi Quận 12",
    "BranchAddress": "355, đường Tô Ký, Quận 12, TP.HCM",
    "OpeningTime": "1970-01-01T07:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 3,
    "BranchName": "Sushi Ánh Sao",
    "BranchAddress": "15, đường 15, Quận 7, TP.HCM",
    "OpeningTime": "1970-01-01T15:45:00.000Z",
    "ClosedTime": "1970-01-01T21:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 4,
    "BranchName": "Sushi Quận 3",
    "BranchAddress": "27A, đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM",
    "OpeningTime": "1970-01-01T09:00:00.000Z",
    "ClosedTime": "1970-01-01T18:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": false,
    "AreaName": null
  },
  {
    "BranchID": 5,
    "BranchName": "Sushi Quận 4",
    "BranchAddress": "355C, đường Bến Vân Đồn, Quận 4, TP.HCM",
    "OpeningTime": "1970-01-01T07:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": false,
    "AreaName": null
  },
  {
    "BranchID": 6,
    "BranchName": "Sushi Quận 5",
    "BranchAddress": "167A, đường Nguyễn Văn Cừ, Quận 5, TP.HCM",
    "OpeningTime": "1970-01-01T08:45:00.000Z",
    "ClosedTime": "1970-01-01T17:45:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 7,
    "BranchName": "Sushi Cầu Giấy",
    "BranchAddress": "27A, đường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội",
    "OpeningTime": "1970-01-01T10:00:00.000Z",
    "ClosedTime": "1970-01-01T20:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 8,
    "BranchName": "Sushi Gò Vấp",
    "BranchAddress": "1A, đường Quang Trung, Quận Gò Vấp, TP.HCM",
    "OpeningTime": "1970-01-01T07:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": false,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 9,
    "BranchName": "Sushi Bến Thành",
    "BranchAddress": "510, đường Phan Bội Châu, Quận 1, TP.HCM",
    "OpeningTime": "1970-01-01T09:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": false,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 10,
    "BranchName": "Sushi Gò Vấp 2",
    "BranchAddress": "2B, đường Nguyễn Huệ, Quận Gò Vấp, TP.HCM",
    "OpeningTime": "1970-01-01T10:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 11,
    "BranchName": "Sushi Tân Sơn Nhất",
    "BranchAddress": "Sân bay Tân Sơn Nhất, TP.HCM",
    "OpeningTime": "1970-01-01T05:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": false,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 12,
    "BranchName": "Sushi Nha Trang",
    "BranchAddress": "55, Lê Thành Phương, Vạn Thắng, TP.Nha Trang",
    "OpeningTime": "1970-01-01T12:45:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 13,
    "BranchName": "Sushi Mạc Đĩnh Chi",
    "BranchAddress": "19 – 21 – 23, Mạc Đĩnh Chi, Đa Kao, Quận 1, TP.HCM",
    "OpeningTime": "1970-01-01T13:45:00.000Z",
    "ClosedTime": "1970-01-01T16:30:00.000Z",
    "DeliveryService": false,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 14,
    "BranchName": "Sushi Phú Lâm",
    "BranchAddress": "\t1039 Hồng Bàng, Phường 12, TP.HCM",
    "OpeningTime": "1970-01-01T16:30:00.000Z",
    "ClosedTime": "1970-01-01T17:30:00.000Z",
    "DeliveryService": true,
    "isParkinglot": true,
    "AreaName": null
  },
  {
    "BranchID": 15,
    "BranchName": "Sushi Him Lam",
    "BranchAddress": "121 – 123 Nguyễn Thị Thập, Khu Đô Thị Him Lam, Phường Tân Hưng, TP.HCM",
    "OpeningTime": "1970-01-01T09:15:00.000Z",
    "ClosedTime": "1970-01-01T18:30:00.000Z",
    "DeliveryService": false,
    "isParkinglot": true,
    "AreaName": null
  }
], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('dbo.BRANCH', null, {});
  }
};
  