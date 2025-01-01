use Nhom3_ADB
go

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 1', 'M001', 'Classic Menu');
INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 2', 'M002', 'Spring Menu');
INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 3', 'M003', 'Summer Menu');
INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 4', 'M004', 'Autumn Menu');

-----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO BRANCH (BranchID) VALUES (0);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (1, N'Sushi Bình Thạnh', N'27A, đường Bạch Đằng, Quận Bình Thạnh, TP.HCM', N'8:00', N'17:30', 0, 'Area 1', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (2, N'Sushi Quận 12', N'355, đường Tô Ký, Quận 12, TP.HCM', N'7:45', N'17:30', 1, 'Area 2', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (3, N'Sushi Ánh Sao', N'15, đường 15, Quận 7, TP.HCM', N'15:45', N'21:30', 1, 'Area 4', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (4, N'Sushi Quận 3', N'27A, đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM', N'9:00', N'18:30', 0, 'Area 4', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (5, N'Sushi Quận 4', N'355C, đường Bến Vân Đồn, Quận 4, TP.HCM', N'7:45', N'17:30', 0, 'Area 2', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (6, N'Sushi Quận 5', N'167A, đường Nguyễn Văn Cừ, Quận 5, TP.HCM', N'8:45', N'17:45', 1, 'Area 1', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (7, N'Sushi Cầu Giấy', N'27A, đường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội', N'10:00', N'20:30', 1, 'Area 3', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (8, N'Sushi Gò Vấp', N'1A, đường Quang Trung, Quận Gò Vấp, TP.HCM', N'7:45', N'17:30', 1, 'Area 2', 0);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (9, N'Sushi Bến Thành', N'510, đường Phan Bội Châu, Quận 1, TP.HCM', N'9:45', N'17:30', 1, 'Area 1', 0);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (10, N'Sushi Gò Vấp 2', N'2B, đường Nguyễn Huệ, Quận Gò Vấp, TP.HCM', N'10:45', N'17:30', 1, 'Area 1', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (11, N'Sushi Tân Sơn Nhất', N'Sân bay Tân Sơn Nhất, TP.HCM', N'5:45', N'17:30', 1, 'Area 3', 0);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (12, N'Sushi Nha Trang', N'55, Lê Thành Phương, Vạn Thắng, TP.Nha Trang', N'12:45', N'17:30', 1, 'Area 4', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (13, N'Sushi Mạc Đĩnh Chi', N'19 – 21 – 23, Mạc Đĩnh Chi, Đa Kao, Quận 1, TP.HCM', N'13:45', N'16:30', 1, 'Area 2', 0);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (14, N'Sushi Phú Lâm', N'1039 Hồng Bàng, Phường 12, TP.HCM', N'16:30', N'17:30', 1, 'Area 3', 1);
INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES (15, N'Sushi Him Lam', N'121 – 123 Nguyễn Thị Thập, Khu Đô Thị Him Lam, Phường Tân Hưng, TP.HCM', N'9:15', N'18:30', 1, 'Area 3', 0);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (1, '0912345678');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (1, '0987654321');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (2, '0934567890');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (2, '0901234567');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (3, '0967890123');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (3, '0998765432');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (4, '0978901234');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (4, '0956789012');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (5, '0943210987');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (5, '0921098765');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (6, '0987654321');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (6, '0912345678');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (7, '0934567890');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (7, '0901234567');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (8, '0967890123');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (8, '0998765432');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (9, '0978901234');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (9, '0956789012');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (10, '0943210987');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (10, '0921098765');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (11, '0987654321');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (11, '0912345678');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (12, '0934567890');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (12, '0901234567');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (13, '0967890123');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (13, '0998765432');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (14, '0978901234');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (14, '0956789012');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (15, '0943210987');
INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber) VALUES (15, '0921098765');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (1, 'Sushi California Roll', 50000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (2, 'Sushi Dragon Roll', 60000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (3, 'Sushi Salmon Roll', 45000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (4, 'Sushi Tuna Roll', 55000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (5, 'Sushi Tempura Roll', 65000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (6, 'Sushi Spicy Tuna Roll', 60000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (7, 'Sushi Eel Roll', 70000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (8, 'Sushi Rainbow Roll', 75000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (9, 'Sashimi Salmon', 80000, 'Sashimi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (10, 'Sashimi Tuna', 85000, 'Sashimi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (11, 'Sashimi Mixed', 100000, 'Sashimi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (12, 'Nigiri Salmon', 30000, 'Nigiri', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (13, 'Nigiri Tuna', 35000, 'Nigiri', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (14, 'Nigiri Eel', 40000, 'Nigiri', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (15, 'Nigiri Mixed', 50000, 'Nigiri', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (16, 'Edamame', 20000, 'Appetizer', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (17, 'Gyoza', 30000, 'Appetizer', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (18, 'Miso Soup', 15000, 'Soup', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (19, 'Ramen', 40000, 'Noodle', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (20, 'Udon', 35000, 'Noodle', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (21, 'Sushi Combo A', 150000, 'Combo', 1, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (22, 'Sushi Combo B', 200000, 'Combo', 1, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (23, 'Sashimi Combo', 250000, 'Combo', 1, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (24, 'Nigiri Combo', 180000, 'Combo', 1, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (25, 'Dessert Mochi', 25000, 'Dessert', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (26, 'Dessert Matcha Ice Cream', 30000, 'Dessert', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (27, 'Dessert Green Tea Cake', 35000, 'Dessert', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (28, 'Drink Sake', 50000, 'Drink', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (29, 'Drink Beer', 30000, 'Drink', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (30, 'Drink Soda', 15000, 'Drink', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (31, 'Tempura Shrimp', 40000, 'Tempura', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (32, 'Tempura Vegetable', 35000, 'Tempura', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (33, 'Tempura Mixed', 50000, 'Tempura', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (34, 'Grilled Eel', 60000, 'Grilled', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (35, 'Grilled Salmon', 55000, 'Grilled', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (36, 'Grilled Chicken', 40000, 'Grilled', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (37, 'Grilled Beef', 65000, 'Grilled', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (38, 'Sushi Roll Special', 80000, 'Sushi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (39, 'Sashimi Platter', 150000, 'Sashimi', 0, 1);
INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable) VALUES (40, 'Nigiri Platter', 120000, 'Nigiri', 0, 1);


-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO COMBO VALUES (21);
INSERT INTO COMBO VALUES (22);
INSERT INTO COMBO VALUES (23);
INSERT INTO COMBO VALUES (24);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (21, 1, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (21, 2, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (21, 3, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (21, 4, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (22, 5, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (22, 6, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (22, 7, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (22, 8, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (23, 9, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (23, 10, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (23, 11, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (24, 12, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (24, 13, 2);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (24, 14, 1);
INSERT INTO DISH_COMBO (ComboID, DishID, Quantity) VALUES (24, 15, 2);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M001', 1, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M001', 2, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M001', 3, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M001', 9, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M001', 10, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M002', 4, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M002', 5, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M002', 6, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M002', 9, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M002', 12, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M003', 7, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M003', 8, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M003', 3, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M003', 9, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M003', 13, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M004', 2, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M004', 4, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M004', 10, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M004', 11, 1);
INSERT INTO DISH_MENU (MenuID, DishID, inMenu) VALUES ('M004', 12, 1);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MENU_DETAIL VALUES (1, 1, 1);
INSERT INTO MENU_DETAIL VALUES (1, 2, 1);
INSERT INTO MENU_DETAIL VALUES (1, 10, 1);
INSERT INTO MENU_DETAIL VALUES (1, 30, 0);
INSERT INTO MENU_DETAIL VALUES (2, 3, 1);
INSERT INTO MENU_DETAIL VALUES (2, 4, 1);
INSERT INTO MENU_DETAIL VALUES (2, 5, 1);
INSERT INTO MENU_DETAIL VALUES (2, 31, 0);
INSERT INTO MENU_DETAIL VALUES (3, 30, 1);
INSERT INTO MENU_DETAIL VALUES (3, 31, 1);
INSERT INTO MENU_DETAIL VALUES (3, 32, 1);
INSERT INTO MENU_DETAIL VALUES (3, 1, 0);
INSERT INTO MENU_DETAIL VALUES (4, 10, 1);
INSERT INTO MENU_DETAIL VALUES (4, 11, 1);
INSERT INTO MENU_DETAIL VALUES (4, 12, 1);
INSERT INTO MENU_DETAIL VALUES (4, 28, 0);
INSERT INTO MENU_DETAIL VALUES (5, 15, 1);
INSERT INTO MENU_DETAIL VALUES (5, 16, 1);
INSERT INTO MENU_DETAIL VALUES (5, 17, 1);
INSERT INTO MENU_DETAIL VALUES (5, 9, 0);
INSERT INTO MENU_DETAIL VALUES (6, 20, 1);
INSERT INTO MENU_DETAIL VALUES (6, 21, 1);
INSERT INTO MENU_DETAIL VALUES (6, 22, 1);
INSERT INTO MENU_DETAIL VALUES (6, 19, 0);
INSERT INTO MENU_DETAIL VALUES (7, 1, 1);
INSERT INTO MENU_DETAIL VALUES (7, 9, 1);
INSERT INTO MENU_DETAIL VALUES (7, 11, 1);
INSERT INTO MENU_DETAIL VALUES (7, 31, 0);
INSERT INTO MENU_DETAIL VALUES (8, 11, 1);
INSERT INTO MENU_DETAIL VALUES (8, 17, 1);
INSERT INTO MENU_DETAIL VALUES (8, 21, 1);
INSERT INTO MENU_DETAIL VALUES (8, 2, 0);
INSERT INTO MENU_DETAIL VALUES (9, 18, 1);
INSERT INTO MENU_DETAIL VALUES (9, 27, 1);
INSERT INTO MENU_DETAIL VALUES (9, 1, 1);
INSERT INTO MENU_DETAIL VALUES (9, 5, 0);
INSERT INTO MENU_DETAIL VALUES (10, 10, 1);
INSERT INTO MENU_DETAIL VALUES (10, 39, 1);
INSERT INTO MENU_DETAIL VALUES (10, 37, 1);
INSERT INTO MENU_DETAIL VALUES (10, 34, 0);
INSERT INTO MENU_DETAIL VALUES (11, 7, 1);
INSERT INTO MENU_DETAIL VALUES (11, 8, 1);
INSERT INTO MENU_DETAIL VALUES (11, 6, 1);
INSERT INTO MENU_DETAIL VALUES (11, 33, 0);
INSERT INTO MENU_DETAIL VALUES (12, 28, 1);
INSERT INTO MENU_DETAIL VALUES (12, 29, 1);
INSERT INTO MENU_DETAIL VALUES (12, 31, 1);
INSERT INTO MENU_DETAIL VALUES (12, 4, 0);
INSERT INTO MENU_DETAIL VALUES (13, 11, 1);
INSERT INTO MENU_DETAIL VALUES (13, 32, 1);
INSERT INTO MENU_DETAIL VALUES (13, 26, 1);
INSERT INTO MENU_DETAIL VALUES (13, 27, 0);
INSERT INTO MENU_DETAIL VALUES (14, 19, 1);
INSERT INTO MENU_DETAIL VALUES (14, 26, 1);
INSERT INTO MENU_DETAIL VALUES (14, 33, 1);
INSERT INTO MENU_DETAIL VALUES (14, 31, 0);
INSERT INTO MENU_DETAIL VALUES (15, 11, 1);
INSERT INTO MENU_DETAIL VALUES (15, 19, 1);
INSERT INTO MENU_DETAIL VALUES (15, 9, 1);
INSERT INTO MENU_DETAIL VALUES (15, 12, 0);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO STATION (StationName, StationSalary) VALUES ('Sushi Chef', 15000000);
INSERT INTO STATION (StationName, StationSalary) VALUES ('Teppanyaki Chef', 18000000);
INSERT INTO STATION (StationName, StationSalary) VALUES ('Sushi Preparer', 10000000);
INSERT INTO STATION (StationName, StationSalary) VALUES ('Server', 8000000);
INSERT INTO STATION (StationName, StationSalary)VALUES ('Dishwasher', 7000000);
INSERT INTO STATION (StationName, StationSalary) VALUES ('Cashier', 8500000);
INSERT INTO STATION (StationName, StationSalary) VALUES ('Host/Hostess', 7500000);


select * from BRANCH