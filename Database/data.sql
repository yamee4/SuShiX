use Nhom3_ADB
go

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 1', 'M001', 'Classic Menu');
INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 2', 'M002', 'Spring Menu');
INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 3', 'M003', 'Summer Menu');
INSERT INTO AREA (AreaName, MenuID, MenuName) VALUES ('Area 4', 'M004', 'Autumn Menu');

-----------------------------------------------------------------------------------------------------------------------------------------

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


------------------------------------------------------------------------------------------------------------

INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0123456789', N'Nguyễn Văn', 'A', '0987654321', 'vanan@gmail.com', 'Nam', 1, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0234567890', N'Trần Thị', 'B', '0987654321', 'thib@gmail.com', N'Nữ', 0, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0345678901', N'Lê Thị', 'C', '0987654321', 'thic@gmail.com', N'Nữ', 1, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0456789012', N'Hoàng Văn', 'D', '0987654321', 'vand@gmail.com', 'Nam', 0, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0567890123', N'Nguyễn Thị', 'E', '0987654321', 'thie@gmail.com', N'Nữ', 1, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0678901234', N'Trần Văn', 'F', '0987654321', 'vanf@gmail.com', 'Nam', 0, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0789012345', N'Lê Văn', 'G', '0987654321', 'vang@gmail.com', 'Nam', 1, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0890123456', N'Hoàng Thị', 'H', '0987654321', 'thih@gmail.com', N'Nữ', 0, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('0901234567', N'Nguyễn Văn', 'I', '0987654321', 'vani@gmail.com', 'Nam', 1, 1);
INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered) VALUES ('1012345678', N'Trần Thị', 'J', '0987654321', 'thij@gmail.com', N'Nữ', 0, 1);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP01', N'Nguyễn Văn', N'A', '1985-01-01', 'Nam', 15000000, 1);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP02', N'Trần Thị', N'B', '1990-03-15', N'Nữ', 12000000, 2);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP03', N'Lê Văn', N'C', '1988-07-20', 'Nam', 13500000, 3);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP04', N'Hoàng Thị', N'D', '1992-11-05', N'Nữ', 11000000, 4);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP05', N'Nguyễn Văn', N'E', '1987-09-28', 'Nam', 14000000, 5);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP06', N'Trần Thị', N'F', '1989-05-12', N'Nữ', 12500000, 6);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP07', N'Lê Văn', N'G', '1991-08-25', 'Nam', 13000000, 7);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP08', N'Hoàng Thị', N'H', '1986-02-18', N'Nữ', 11500000, 8);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP09', N'Nguyễn Văn', N'I', '1993-04-10', 'Nam', 14500000, 9);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP10', N'Trần Thị', N'J', '1988-12-23', N'Nữ', 12000000, 10);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP11', N'Lê Văn', N'K', '1990-06-17', 'Nam', 13500000, 11);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP12', N'Hoàng Thị', N'L', '1992-10-02', N'Nữ', 11000000, 12);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP13', N'Nguyễn Văn', N'M', '1987-08-15', 'Nam', 14000000, 13);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP14', N'Trần Thị', N'N', '1989-04-29', N'Nữ', 12500000, 14);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP15', N'Lê Văn', N'O', '1991-07-13', 'Nam', 13000000, 15);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP16', N'Hoàng Thị', N'P', '1986-01-25', N'Nữ', 11500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP17', N'Nguyễn Văn', N'Q', '1993-03-12', 'Nam', 14500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP18', N'Trần Thị', N'R', '1988-11-19', N'Nữ', 12000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP19', N'Lê Văn', N'S', '1990-05-26', 'Nam', 13500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP20', N'Hoàng Thị', N'T', '1992-09-11', N'Nữ', 11000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP21', N'Nguyễn Văn', N'U', '1987-07-28', 'Nam', 14000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP22', N'Trần Thị', N'V', '1989-03-14', N'Nữ', 12500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP23', N'Lê Văn', N'W', '1991-06-22', 'Nam', 13000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP24', N'Hoàng Thị', N'X', '1986-01-07', N'Nữ', 11500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP25', N'Nguyễn Văn', N'Y', '1993-02-25', 'Nam', 14500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP26', N'Trần Thị', N'Z', '1988-10-28', N'Nữ', 12000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP27', N'Lê Văn', N'A', '1990-04-13', 'Nam', 13500000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP28', N'Hoàng Thị', N'B', '1992-08-21', N'Nữ', 11000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP29', N'Nguyễn Văn', N'C', '1987-06-10', 'Nam', 14000000, NULL);
INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager) VALUES ('EMP30', N'Trần Thị', N'D', '1989-02-27', N'Nữ', 12500000, NULL);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate) VALUES ('0123456789', 'MC0001', '2023-11-12 10:30:00', 'EMP01', 'MEMBER', 100, '2023-11-12');
INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate) VALUES ('0345678901', 'MC0002', '2023-12-01 13:15:00', 'EMP02', 'SILVER', 250, '2023-12-01');
INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate) VALUES ('0567890123', 'MC0003', '2023-10-25 15:45:00', 'EMP01', 'GOLD', 500, '2023-10-25');
INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate) VALUES ('0789012345', 'MC0004', '2023-11-20 09:15:00', 'EMP02', 'MEMBER', 75, '2023-11-20');
INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate) VALUES ('0901234567', 'MC0005', '2023-12-10 11:30:00', 'EMP01', 'SILVER', 150, '2023-12-10');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0123456789', 'password123');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0234567890', 'password456');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0345678901', 'password789');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0456789012', 'password012');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0567890123', 'password345');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0678901234', 'password678');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0789012345', 'password901');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0890123456', 'password234');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('0901234567', 'password567');
INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password) VALUES ('1012345678', 'password890');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0123456789', '2023-11-12 10:30:00', 30);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0123456789', '2023-11-13 15:15:00', 45);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0234567890', '2023-12-01 13:15:00', 20);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0234567890', '2023-12-02 18:30:00', 35);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0345678901', '2023-10-25 15:45:00', 15);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0345678901', '2023-10-26 11:00:00', 25);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0456789012', '2023-11-20 09:15:00', 20);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0456789012', '2023-11-21 14:30:00', 30);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0567890123', '2023-12-10 11:30:00', 10);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0567890123', '2023-12-11 16:45:00', 25);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0678901234', '2023-11-15 12:00:00', 35);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0678901234', '2023-11-16 18:15:00', 20);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0789012345', '2023-12-05 10:30:00', 15);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0789012345', '2023-12-06 15:45:00', 30);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0890123456', '2023-11-22 13:15:00', 25);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0890123456', '2023-11-23 19:30:00', 20);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0901234567', '2023-12-12 11:00:00', 10);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('0901234567', '2023-12-13 16:15:00', 35);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('1012345678', '2023-11-27 12:30:00', 20);
INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration) VALUES ('1012345678', '2023-11-28 18:45:00', 25);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP01', '2010-01-01', NULL, 1);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP02', '2012-03-15', NULL, 2);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP03', '2011-07-20', NULL, 3);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP04', '2013-11-05', NULL, 4);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP05', '2009-09-28', NULL, 5);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP06', '2011-05-12', NULL, 6);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP07', '2013-08-25', NULL, 7);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP08', '2010-02-18', NULL, 8);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP09', '2014-04-10', NULL, 9);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP10', '2011-12-23', NULL, 10);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP11', '2013-06-17', NULL, 11);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP12', '2014-10-02', NULL, 12);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP13', '2010-08-15', NULL, 13);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP14', '2012-04-29', NULL, 14);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP15', '2014-07-13', NULL, 15);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP16', '2010-01-25', '2015-12-31', 1);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP17', '2013-03-12', '2018-06-30', 2);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP18', '2011-11-19', '2016-09-30', 3);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP19', '2014-05-26', '2019-03-31', 4);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP20', '2012-09-11', '2017-07-31', 5);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP21', '2010-07-28', '2015-06-30', 6);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP22', '2012-03-14', '2017-01-31', 7);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP23', '2014-06-22', '2019-04-30', 8);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP24', '2010-01-07', '2015-11-30', 9);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP25', '2013-02-25', '2018-12-31', 10);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP26', '2011-10-28', '2016-09-30', 11);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP27', '2014-04-13', '2019-02-28', 12);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP28', '2012-08-21', '2017-07-31', 13);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP29', '2010-06-10', '2015-05-31', 14);
INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID) VALUES ('EMP30', '2012-02-27', '2017-01-31', 15);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (1, 'EMP01', 'Sushi Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (2, 'EMP02', 'Teppanyaki Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (3, 'EMP03', 'Sushi Preparer');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (4, 'EMP04', 'Server');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (5, 'EMP05', 'Dishwasher');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (6, 'EMP06', 'Cashier');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (7, 'EMP07', 'Host/Hostess');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (8, 'EMP08', 'Sushi Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (9, 'EMP09', 'Teppanyaki Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (10, 'EMP10', 'Sushi Preparer');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (11, 'EMP11', 'Server');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (12, 'EMP12', 'Dishwasher');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (13, 'EMP13', 'Cashier');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (14, 'EMP14', 'Host/Hostess');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (15, 'EMP15', 'Sushi Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (1, 'EMP16', 'Sushi Preparer');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (2, 'EMP17', 'Server');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (3, 'EMP18', 'Dishwasher');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (4, 'EMP19', 'Cashier');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (5, 'EMP20', 'Host/Hostess');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (6, 'EMP21', 'Sushi Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (7, 'EMP22', 'Teppanyaki Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (8, 'EMP23', 'Sushi Preparer');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (9, 'EMP24', 'Server');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (10, 'EMP25', 'Dishwasher');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (11, 'EMP26', 'Cashier');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (12, 'EMP27', 'Host/Hostess');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (13, 'EMP28', 'Sushi Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (14, 'EMP29', 'Teppanyaki Chef');
INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName) VALUES (15, 'EMP30', 'Sushi Preparer');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0001', 'STD', 1, '0123456789', 'EMP01');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0002', 'PRE', 2, '0234567890', 'EMP02');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0003', 'ONL', 3, '0345678901', 'EMP03');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0004', 'STD', 4, '0456789012', 'EMP04');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0005', 'PRE', 5, '0567890123', 'EMP05');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0006', 'ONL', 6, '0678901234', 'EMP06');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0007', 'STD', 7, '0789012345', 'EMP07');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0008', 'PRE', 8, '0890123456', 'EMP08');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0009', 'ONL', 9, '0901234567', 'EMP09');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0010', 'STD', 10, '1012345678', 'EMP10');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0011', 'PRE', 1, '0123456789', 'EMP01');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0012', 'ONL', 2, '0234567890', 'EMP02');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0013', 'STD', 3, '0345678901', 'EMP03');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0014', 'PRE', 4, '0456789012', 'EMP04');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0015', 'ONL', 5, '0567890123', 'EMP05');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0016', 'STD', 6, '0678901234', 'EMP06');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0017', 'PRE', 7, '0789012345', 'EMP07');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0018', 'ONL', 8, '0890123456', 'EMP08');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0019', 'STD', 9, '0901234567', 'EMP09');
INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID) VALUES ('TKT0020', 'PRE', 10, '1012345678', 'EMP10');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ONLINE_TICKET (OTicketID) VALUES ('TKT0003');
INSERT INTO ONLINE_TICKET (OTicketID) VALUES ('TKT0006');
INSERT INTO ONLINE_TICKET (OTicketID) VALUES ('TKT0009');
INSERT INTO ONLINE_TICKET (OTicketID) VALUES ('TKT0012');
INSERT INTO ONLINE_TICKET (OTicketID) VALUES ('TKT0015');
INSERT INTO ONLINE_TICKET (OTicketID) VALUES ('TKT0018');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0002', N'Sushi Quận 12', 'Area 2', 4, N'Xin vui lòng chuẩn bị bàn cho 4 người');
INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0005', N'Sushi Quận 4', 'Area 2', 2, N'Chúng tôi muốn có một bàn yên tĩnh, vui lòng');
INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0008', N'Sushi Gò Vấp', 'Area 2', 6, N'Xin vui lòng chuẩn bị bàn gần cửa sổ');
INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0011', N'Sushi Bình Thạnh', 'Area 1',3,  N'Chúng tôi có trẻ em, vui lòng chuẩn bị ghế cao');
INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0014', N'Sushi Quận 3', 'Area 4', 5, N'Chúng tôi muốn có bàn gần quầy sushi');
INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0017', N'Sushi Cầu Giấy', 'Area 3', 2, N'Xin vui lòng chuẩn bị bàn cho hai người, khu vực không hút thuốc');
INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderNote) VALUES ('TKT0020', N'Sushi Cầu Giấy', 'Area 3', 2, N'Chúng tôi muốn miễn phí');
-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0001', 'Table 1', 'EMP01');
INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0004', 'Table 1', 'EMP04');
INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0007', 'Table 1', 'EMP07');
INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0010', 'Table 1', 'EMP10');
INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0013', 'Table 1', 'EMP03');
INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0016', 'Table 1', 'EMP06');
INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee) VALUES ('TKT0019', 'Table 1', 'EMP09');

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0003', 1, '2023-12-15 11:30:00', 2, 50000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0003', 2, '2023-12-15 11:35:00', 1, 30000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0006', 3, '2023-12-16 18:00:00', 3, 40000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0006', 4, '2023-12-16 18:05:00', 2, 25000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0009', 5, '2023-12-17 09:45:00', 1, 60000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0012', 6, '2023-12-18 13:15:00', 2, 35000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0012', 7, '2023-12-18 13:20:00', 1, 20000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0015', 8, '2023-12-19 10:45:00', 3, 45000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0018', 9, '2023-12-20 16:00:00', 2, 55000);
INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0018', 10, '2023-12-20 16:05:00', 1, 30000);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0002', 1, '2023-12-13 18:30:00', 2, 50000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0002', 2, '2023-12-13 18:30:00', 1, 30000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0005', 3, '2023-12-14 12:00:00', 3, 40000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0005', 4, '2023-12-14 12:00:00', 2, 25000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0008', 5, '2023-12-15 19:30:00', 1, 60000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0011', 6, '2023-12-16 17:00:00', 2, 35000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0011', 7, '2023-12-16 17:00:00', 1, 20000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0014', 8, '2023-12-17 11:30:00', 3, 45000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0017', 9, '2023-12-18 13:00:00', 2, 55000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0017', 10, '2023-12-18 13:00:00', 1, 30000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0020', 7, '2023-12-16 17:00:00', 1, 20000);
INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0020', 8, '2023-12-17 11:30:00', 3, 45000);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0001', 1, '2023-12-12 12:00:00', 2, 50000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0001', 2, '2023-12-12 12:00:00', 1, 30000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0004', 3, '2023-12-13 18:30:00', 3, 40000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0004', 4, '2023-12-13 18:30:00', 2, 25000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0007', 5, '2023-12-14 10:15:00', 1, 60000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0010', 6, '2023-12-15 14:45:00', 2, 35000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0010', 7, '2023-12-15 14:45:00', 1, 20000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0013', 8, '2023-12-16 11:30:00', 3, 45000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0016', 9, '2023-12-17 17:00:00', 2, 55000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0016', 10, '2023-12-17 17:00:00', 1, 30000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0019', 11, '2023-12-18 12:30:00', 2, 50000);
INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price) VALUES ('TKT0019', 12, '2023-12-18 12:30:00', 1, 30000);

-----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0001', 10, 10, 10, 10, 10, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0002', 10, 9, 10, 10, 9, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0003', 10, 10, 9, 10, 10, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0004', 10, 10, 9, 10, 10, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0005', 10, 9, 10, 9, 10, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0006', 10, 10, 10, 10, 9, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0007', 10, 9, 10, 10, 10, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0008', 10, 10, 7, 10, 10, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0009', 10, 10, 10, 10, 8, NULL);
INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote) VALUES ('TKT0010', 10, 10, 9, 10, 10, NULL);