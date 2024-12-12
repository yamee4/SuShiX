use Nhom3_QLSUSHI
go

INSERT INTO MENU (MenuID, MenuName)
VALUES
('M001', 'Classic Menu'),
('M002', 'Spring Menu'),
('M003', 'Summer Menu'),
('M004', 'Autumn Menu'),
('M005', 'Winter Menu'),
('M006', 'Vegetarian Menu'),
('M007', 'Holiday Menu');

INSERT INTO AREA (AreaName, MenuID)
VALUES
('Area 1', 'M001'),
('Area 2', 'M003'),
('Area 3', 'M007'),
('Area 4', 'M004');

INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES
(1, N'Sushi Bình Thạnh', N'27A, đường Bạch Đằng, Quận Bình Thạnh, TP.HCM', N'8:00', N'17:30', 0, 'Area 1', 1),
(2, N'Sushi Quận 12', N'355, đường Tô Ký, Quận 12, TP.HCM', N'7:45', N'17:30', 1, 'Area 2', 1),
(3, N'Sushi Ánh Sao', N'15, đường 15, Quận 7, TP.HCM', N'15:45', N'21:30', 1, 'Area 4', 1),
(4, N'Sushi Quận 3', N'27A, đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM', N'9:00', N'18:30', 0, 'Area 4', 1),
(5, N'Sushi Quận 4', N'355C, đường Bến Vân Đồn, Quận 4, TP.HCM', N'7:45', N'17:30', 0, 'Area 2', 1),
(6, N'Sushi Quận 5', N'167A, đường Nguyễn Văn Cừ, Quận 5, TP.HCM', N'8:45', N'17:45', 1, 'Area 1', 1),
(7, N'Sushi Cầu Giấy', N'27A, đường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội', N'10:00', N'20:30', 1, 'Area 3', 1),
(8, N'Sushi Gò Vấp', N'1A, đường Quang Trung, Quận Gò Vấp, TP.HCM', N'7:45', N'17:30', 1, 'Area 2', 0),
(9, N'Sushi Bến Thành', N'510, đường Phan Bội Châu, Quận 1, TP.HCM', N'9:45', N'17:30', 1, 'Area 1', 0),
(10, N'Sushi Gò Vấp 2', N'2B, đường Nguyễn Huệ, Quận Gò Vấp, TP.HCM', N'10:45', N'17:30', 1, 'Area 1', 1),
(11, N'Sushi Tân Sơn Nhất', N'Sân bay Tân Sơn Nhất, TP.HCM', N'5:45', N'17:30', 1, 'Area 3', 0),
(12, N'Sushi Nha Trang', N'55, Lê Thành Phương, Vạn Thắng, TP.Nha Trang', N'12:45', N'17:30', 1, 'Area 4', 1),
(13, N'Sushi Mạc Đĩnh Chi', N'19 – 21 – 23, Mạc Đĩnh Chi, Đa Kao, Quận 1, TP.HCM', N'13:45', N'16:30', 1, 'Area 2', 0),
(14, N'Sushi Phú Lâm', N'	1039 Hồng Bàng, Phường 12, TP.HCM', N'16:30', N'17:30', 1, 'Area 3', 1),
(15, N'Sushi Him Lam', N'121 – 123 Nguyễn Thị Thập, Khu Đô Thị Him Lam, Phường Tân Hưng, TP.HCM', N'9:15', N'18:30', 1, 'Area 3', 0)

INSERT INTO BRANCH_PHONE_NUMBER (BranchID, PhoneNumber)
VALUES
(1, '0912345678'),
(1, '0987654321'),
(2, '0934567890'),
(2, '0901234567'),
(3, '0967890123'),
(3, '0998765432'),
(4, '0978901234'),
(4, '0956789012'),
(5, '0943210987'),
(5, '0921098765'),
(6, '0987654321'),
(6, '0912345678'),
(7, '0934567890'),
(7, '0901234567'),
(8, '0967890123'),
(8, '0998765432'),
(9, '0978901234'),
(9, '0956789012'),
(10, '0943210987'),
(10, '0921098765'),
(11, '0987654321'),
(11, '0912345678'),
(12, '0934567890'),
(12, '0901234567'),
(13, '0967890123'),
(13, '0998765432'),
(14, '0978901234'),
(14, '0956789012'),
(15, '0943210987'),
(15, '0921098765');

INSERT INTO DISH (DishID, DishName, CurrentPrice, DishSection, isCombo, DeliveryAvailable)
VALUES
(1, 'Sushi California Roll', 50000, 'Sushi', 0, 1),
(2, 'Sushi Dragon Roll', 60000, 'Sushi', 0, 1),
(3, 'Sushi Salmon Roll', 45000, 'Sushi', 0, 1),
(4, 'Sushi Tuna Roll', 55000, 'Sushi', 0, 1),
(5, 'Sushi Tempura Roll', 65000, 'Sushi', 0, 1),
(6, 'Sushi Spicy Tuna Roll', 60000, 'Sushi', 0, 1),
(7, 'Sushi Eel Roll', 70000, 'Sushi', 0, 1),
(8, 'Sushi Rainbow Roll', 75000, 'Sushi', 0, 1),
(9, 'Sashimi Salmon', 80000, 'Sashimi', 0, 1),
(10, 'Sashimi Tuna', 85000, 'Sashimi', 0, 1),
(11, 'Sashimi Mixed', 100000, 'Sashimi', 0, 1),
(12, 'Nigiri Salmon', 30000, 'Nigiri', 0, 1),
(13, 'Nigiri Tuna', 35000, 'Nigiri', 0, 1),
(14, 'Nigiri Eel', 40000, 'Nigiri', 0, 1),
(15, 'Nigiri Mixed', 50000, 'Nigiri', 0, 1),
(16, 'Edamame', 20000, 'Appetizer', 0, 1),
(17, 'Gyoza', 30000, 'Appetizer', 0, 1),
(18, 'Miso Soup', 15000, 'Soup', 0, 1),
(19, 'Ramen', 40000, 'Noodle', 0, 1),
(20, 'Udon', 35000, 'Noodle', 0, 1),
(21, 'Sushi Combo A', 150000, 'Combo', 1, 1),
(22, 'Sushi Combo B', 200000, 'Combo', 1, 1),
(23, 'Sashimi Combo', 250000, 'Combo', 1, 1),
(24, 'Nigiri Combo', 180000, 'Combo', 1, 1),
(25, 'Dessert Mochi', 25000, 'Dessert', 0, 1),
(26, 'Dessert Matcha Ice Cream', 30000, 'Dessert', 0, 1),
(27, 'Dessert Green Tea Cake', 35000, 'Dessert', 0, 1),
(28, 'Drink Sake', 50000, 'Drink', 0, 1),
(29, 'Drink Beer', 30000, 'Drink', 0, 1),
(30, 'Drink Soda', 15000, 'Drink', 0, 1),
(31, 'Tempura Shrimp', 40000, 'Tempura', 0, 1),
(32, 'Tempura Vegetable', 35000, 'Tempura', 0, 1),
(33, 'Tempura Mixed', 50000, 'Tempura', 0, 1),
(34, 'Grilled Eel', 60000, 'Grilled', 0, 1),
(35, 'Grilled Salmon', 55000, 'Grilled', 0, 1),
(36, 'Grilled Chicken', 40000, 'Grilled', 0, 1),
(37, 'Grilled Beef', 65000, 'Grilled', 0, 1),
(38, 'Sushi Roll Special', 80000, 'Sushi', 0, 1),
(39, 'Sashimi Platter', 150000, 'Sashimi', 0, 1),
(40, 'Nigiri Platter', 120000, 'Nigiri', 0, 1);


INSERT INTO COMBO
VALUES
(21),
(22),
(23),
(24);

INSERT INTO DISH_COMBO(ComboID, DishID, Quantity)
VALUES
(21, 1, 1),
(21, 2, 1),
(21, 3, 1),
(21, 4, 1),
(22, 5, 1),
(22, 6, 1),
(22, 7, 1),
(22, 8, 1),
(23, 9, 1),
(23, 10, 1),
(23, 11, 1),
(24, 12, 1),
(24, 13, 2),
(24, 14, 1),
(24, 15, 2);

INSERT INTO DISH_MENU (MenuID, DishID, inMenu)
VALUES

('M001', 1, 1),
('M001', 2, 1),
('M001', 3, 1),
('M001', 9, 1),
('M001', 10, 1),

('M002', 4, 1),
('M002', 5, 1),
('M002', 6, 1),
('M002', 9, 1),
('M002', 12, 1),

('M003', 7, 1),
('M003', 8, 1),
('M003', 3, 1),
('M003', 9, 1),
('M003', 13, 1),

('M004', 2, 1),
('M004', 4, 1),
('M004', 10, 1),
('M004', 11, 1),
('M004', 12, 1),

('M005', 5, 1),
('M005', 6, 1),
('M005', 8, 1),
('M005', 9, 1),
('M005', 13, 1),

('M006', 14, 1),
('M006', 15, 1),
('M006', 16, 1),
('M006', 17, 1),
('M006', 18, 1),

('M007', 1, 1),
('M007', 7, 1),
('M007', 8, 1),
('M007', 11, 1),
('M007', 13, 1),

('M001', 14, 0),
('M002', 15, 0),
('M003', 16, 0),
('M004', 17, 0),
('M005', 18, 0);

INSERT INTO MENU_DETAIL VALUES 
(1, 1, 1),
(1, 2, 1),
(1, 10, 1),
(1, 30, 0),

(2, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 31, 0),

(3, 30, 1),
(3, 31, 1),
(3, 32, 1),
(3, 1, 0),

(4, 10, 1),
(4, 11, 1),
(4, 12, 1),
(4, 28, 0),

(5, 15, 1),
(5, 16, 1),
(5, 17, 1),
(5, 9, 0),

(6, 20, 1),
(6, 21, 1),
(6, 22, 1),
(6, 19, 0),

(7, 1, 1),
(7, 9, 1),
(7, 11, 1),
(7, 31, 0),

(8, 11, 1),
(8, 17, 1),
(8, 21, 1),
(8, 2, 0),

(9, 18, 1),
(9, 27, 1),
(9, 1, 1),
(9, 5, 0),

(10, 10, 1),
(10, 39, 1),
(10, 37, 1),
(10, 34, 0),

(11, 7, 1),
(11, 8, 1),
(11, 6, 1),
(11, 33, 0),

(12, 28, 1),
(12, 29, 1),
(12, 31, 1),
(12, 4, 0),

(13, 11, 1),
(13, 32, 1),
(13, 26, 1),
(13, 27, 0),

(14, 19, 1),
(14, 26, 1),
(14, 33, 1),
(14, 31, 0),

(15, 11, 1),
(15, 19, 1),
(15, 9, 1),
(15, 12, 0);

INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered)
VALUES
('0123456789', 'Nguyen Van', 'A', '0987654321', 'vanan@gmail.com', 'Nam', 1, 1),
('0234567890', 'Tran Thi', 'B', '0987654321', 'thib@gmail.com', 'Nu', 0, 1),
('0345678901', 'Le Thi', 'C', '0987654321', 'thic@gmail.com', 'Nu', 1, 1),
('0456789012', 'Hoang Van', 'D', '0987654321', 'vand@gmail.com', 'Nam', 0, 1),
('0567890123', 'Nguyen Thi', 'E', '0987654321', 'thie@gmail.com', 'Nu', 1, 1),
('0678901234', 'Tran Van', 'F', '0987654321', 'vanf@gmail.com', 'Nam', 0, 1),
('0789012345', 'Le Van', 'G', '0987654321', 'vang@gmail.com', 'Nam', 1, 1),
('0890123456', 'Hoang Thi', 'H', '0987654321', 'thih@gmail.com', 'Nu', 0, 1),
('0901234567', 'Nguyen Van', 'I', '0987654321', 'vani@gmail.com', 'Nam', 1, 1),
('1012345678', 'Tran Thi', 'J', '0987654321', 'thij@gmail.com', 'Nu', 0, 1);

INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpBirthDate, EmpGender, Salary, BranchManager)
VALUES
('EMP01', N'Nguyễn Văn', N'A', '1985-01-01', 'Nam', 15000000, 1),
('EMP02', N'Trần Thị', N'B', '1990-03-15', 'Nữ', 12000000, 2),
('EMP03', N'Lê Văn', N'C', '1988-07-20', 'Nam', 13500000, 3),
('EMP04', N'Hoàng Thị', N'D', '1992-11-05', 'Nữ', 11000000, 4),
('EMP05', N'Nguyễn Văn', N'E', '1987-09-28', 'Nam', 14000000, 5),
('EMP06', N'Trần Thị', N'F', '1989-05-12', 'Nữ', 12500000, 6),
('EMP07', N'Lê Văn', N'G', '1991-08-25', 'Nam', 13000000, 7),
('EMP08', N'Hoàng Thị', N'H', '1986-02-18', 'Nữ', 11500000, 8),
('EMP09', N'Nguyễn Văn', N'I', '1993-04-10', 'Nam', 14500000, 9),
('EMP10', N'Trần Thị', N'J', '1988-12-23', 'Nữ', 12000000, 10),
('EMP11', N'Lê Văn', N'K', '1990-06-17', 'Nam', 13500000, 11),
('EMP12', N'Hoàng Thị', N'L', '1992-10-02', 'Nữ', 11000000, 12),
('EMP13', N'Nguyễn Văn', N'M', '1987-08-15', 'Nam', 14000000, 13),
('EMP14', N'Trần Thị', N'N', '1989-04-29', 'Nữ', 12500000, 14),
('EMP15', N'Lê Văn', N'O', '1991-07-13', 'Nam', 13000000, 15),
('EMP16', N'Hoàng Thị', N'P', '1986-01-25', 'Nữ', 11500000, NULL),
('EMP17', N'Nguyễn Văn', N'Q', '1993-03-12', 'Nam', 14500000, NULL),
('EMP18', N'Trần Thị', N'R', '1988-11-19', 'Nữ', 12000000, NULL),
('EMP19', N'Lê Văn', N'S', '1990-05-26', 'Nam', 13500000, NULL),
('EMP20', N'Hoàng Thị', N'T', '1992-09-11', 'Nữ', 11000000, NULL),
('EMP21', N'Nguyễn Văn', N'U', '1987-07-28', 'Nam', 14000000, NULL),
('EMP22', N'Trần Thị', N'V', '1989-03-14', 'Nữ', 12500000, NULL),
('EMP23', N'Lê Văn', N'W', '1991-06-22', 'Nam', 13000000, NULL),
('EMP24', N'Hoàng Thị', N'X', '1986-01-07', 'Nữ', 11500000, NULL),
('EMP25', N'Nguyễn Văn', N'Y', '1993-02-25', 'Nam', 14500000, NULL),
('EMP26', N'Trần Thị', N'Z', '1988-10-28', 'Nữ', 12000000, NULL),
('EMP27', N'Lê Văn', N'A', '1990-04-13', 'Nam', 13500000, NULL),
('EMP28', N'Hoàng Thị', N'B', '1992-08-21', 'Nữ', 11000000, NULL),
('EMP29', N'Nguyễn Văn', N'C', '1987-06-10', 'Nam', 14000000, NULL),
('EMP30', N'Trần Thị', N'D', '1989-02-27', 'Nữ', 12500000, NULL);

INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate)
VALUES
('0123456789', 'MC0001', '2023-11-12 10:30:00', 'EMP01', 'BRONZE', 100, '2023-11-12'),
('0345678901', 'MC0002', '2023-12-01 13:15:00', 'EMP02', 'SILVER', 250, '2023-12-01'),
('0567890123', 'MC0003', '2023-10-25 15:45:00', 'EMP01', 'GOLD', 500, '2023-10-25'),
('0789012345', 'MC0004', '2023-11-20 09:15:00', 'EMP02', 'BRONZE', 75, '2023-11-20'),
('0901234567', 'MC0005', '2023-12-10 11:30:00', 'EMP01', 'SILVER', 150, '2023-12-10');

INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password)
VALUES
('0123456789', 'password123'),
('0234567890', 'password456'),
('0345678901', 'password789'),
('0456789012', 'password012'),
('0567890123', 'password345'),
('0678901234', 'password678'),
('0789012345', 'password901'),
('0890123456', 'password234'),
('0901234567', 'password567'),
('1012345678', 'password890');

INSERT INTO CUSTOMER_LOG (CCCD, Accessed_datetime, Accessed_time_duration)
VALUES
('0123456789', '2023-11-12 10:30:00', 30),
('0123456789', '2023-11-13 15:15:00', 45),
('0234567890', '2023-12-01 13:15:00', 20),
('0234567890', '2023-12-02 18:30:00', 35),
('0345678901', '2023-10-25 15:45:00', 15),
('0345678901', '2023-10-26 11:00:00', 25),
('0456789012', '2023-11-20 09:15:00', 20),
('0456789012', '2023-11-21 14:30:00', 30),
('0567890123', '2023-12-10 11:30:00', 10),
('0567890123', '2023-12-11 16:45:00', 25),
('0678901234', '2023-11-15 12:00:00', 35),
('0678901234', '2023-11-16 18:15:00', 20),
('0789012345', '2023-12-05 10:30:00', 15),
('0789012345', '2023-12-06 15:45:00', 30),
('0890123456', '2023-11-22 13:15:00', 25),
('0890123456', '2023-11-23 19:30:00', 20),
('0901234567', '2023-12-12 11:00:00', 10),
('0901234567', '2023-12-13 16:15:00', 35),
('1012345678', '2023-11-27 12:30:00', 20),
('1012345678', '2023-11-28 18:45:00', 25);

INSERT INTO WORK_HISTORY (EmpID, StartDate, EndDate, BranchID)
VALUES
('EMP01', '2010-01-01', NULL, 1),
('EMP02', '2012-03-15', NULL, 2),
('EMP03', '2011-07-20', NULL, 3),
('EMP04', '2013-11-05', NULL, 4),
('EMP05', '2009-09-28', NULL, 5),
('EMP06', '2011-05-12', NULL, 6),
('EMP07', '2013-08-25', NULL, 7),
('EMP08', '2010-02-18', NULL, 8),
('EMP09', '2014-04-10', NULL, 9),
('EMP10', '2011-12-23', NULL, 10),
('EMP11', '2013-06-17', NULL, 11),
('EMP12', '2014-10-02', NULL, 12),
('EMP13', '2010-08-15', NULL, 13),
('EMP14', '2012-04-29', NULL, 14),
('EMP15', '2014-07-13', NULL, 15),
('EMP16', '2010-01-25', '2015-12-31', 1),
('EMP17', '2013-03-12', '2018-06-30', 2),
('EMP18', '2011-11-19', '2016-09-30', 3),
('EMP19', '2014-05-26', '2019-03-31', 4),
('EMP20', '2012-09-11', '2017-07-31', 5),
('EMP21', '2010-07-28', '2015-06-30', 6),
('EMP22', '2012-03-14', '2017-01-31', 7),
('EMP23', '2014-06-22', '2019-04-30', 8),
('EMP24', '2010-01-07', '2015-11-30', 9),
('EMP25', '2013-02-25', '2018-12-31', 10),
('EMP26', '2011-10-28', '2016-09-30', 11),
('EMP27', '2014-04-13', '2019-02-28', 12),
('EMP28', '2012-08-21', '2017-07-31', 13),
('EMP29', '2010-06-10', '2015-05-31', 14),
('EMP30', '2012-02-27', '2017-01-31', 15);	

INSERT INTO STATION (StationName, StationSalary)
VALUES
('Sushi Chef', 15000000),
('Teppanyaki Chef', 18000000),
('Sushi Preparer', 10000000),
('Server', 8000000),
('Dishwasher', 7000000),
('Cashier', 8500000),
('Host/Hostess', 7500000);

INSERT INTO STATION_EMPLOYEE (BranchID, EmpID, StationName)
VALUES
(1, 'EMP01', 'Sushi Chef'),
(2, 'EMP02', 'Teppanyaki Chef'),
(3, 'EMP03', 'Sushi Preparer'),
(4, 'EMP04', 'Server'),
(5, 'EMP05', 'Dishwasher'),
(6, 'EMP06', 'Cashier'),
(7, 'EMP07', 'Host/Hostess'),
(8, 'EMP08', 'Sushi Chef'),
(9, 'EMP09', 'Teppanyaki Chef'),
(10, 'EMP10', 'Sushi Preparer'),
(11, 'EMP11', 'Server'),
(12, 'EMP12', 'Dishwasher'),
(13, 'EMP13', 'Cashier'),
(14, 'EMP14', 'Host/Hostess'),
(15, 'EMP15', 'Sushi Chef'),
(1, 'EMP16', 'Sushi Preparer'),
(2, 'EMP17', 'Server'),
(3, 'EMP18', 'Dishwasher'),
(4, 'EMP19', 'Cashier'),
(5, 'EMP20', 'Host/Hostess'),
(6, 'EMP21', 'Sushi Chef'),
(7, 'EMP22', 'Teppanyaki Chef'),
(8, 'EMP23', 'Sushi Preparer'),
(9, 'EMP24', 'Server'),
(10, 'EMP25', 'Dishwasher'),
(11, 'EMP26', 'Cashier'),
(12, 'EMP27', 'Host/Hostess'),
(13, 'EMP28', 'Sushi Chef'),
(14, 'EMP29', 'Teppanyaki Chef'),
(15, 'EMP30', 'Sushi Preparer');

INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID)
VALUES
('TKT0001', 'STD', 1, '0123456789', 'EMP01'),
('TKT0002', 'PRE', 2, '0234567890', 'EMP02'),
('TKT0003', 'ONL', 3, '0345678901', 'EMP03'),
('TKT0004', 'STD', 4, '0456789012', 'EMP04'),
('TKT0005', 'PRE', 5, '0567890123', 'EMP05'),
('TKT0006', 'ONL', 6, '0678901234', 'EMP06'),
('TKT0007', 'STD', 7, '0789012345', 'EMP07'),
('TKT0008', 'PRE', 8, '0890123456', 'EMP08'),
('TKT0009', 'ONL', 9, '0901234567', 'EMP09'),
('TKT0010', 'STD', 10, '1012345678', 'EMP10'),
('TKT0011', 'PRE', 1, '0123456789', 'EMP01'),
('TKT0012', 'ONL', 2, '0234567890', 'EMP02'),
('TKT0013', 'STD', 3, '0345678901', 'EMP03'),
('TKT0014', 'PRE', 4, '0456789012', 'EMP04'),
('TKT0015', 'ONL', 5, '0567890123', 'EMP05'),
('TKT0016', 'STD', 6, '0678901234', 'EMP06'),
('TKT0017', 'PRE', 7, '0789012345', 'EMP07'),
('TKT0018', 'ONL', 8, '0890123456', 'EMP08'),
('TKT0019', 'STD', 9, '0901234567', 'EMP09'),
('TKT0020', 'PRE', 10, '1012345678', 'EMP10');

INSERT INTO ONLINE_TICKET (OTicketID, DeliveryDate)
VALUES
('TKT0003', '2023-12-15 12:00:00'),
('TKT0006', '2023-12-16 18:30:00'),
('TKT0009', '2023-12-17 10:15:00'),
('TKT0012', '2023-12-18 14:45:00'),
('TKT0015', '2023-12-19 11:30:00'),
('TKT0018', '2023-12-20 17:00:00');

INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderDate, PreOrderArrivalTime, PreOrderNote)
VALUES
('TKT0002', 'Sushi Quận 12', 'Area 2', 4, '2023-12-13', '18:30:00', 'Please prepare a table for 4 people'),
('TKT0005', 'Sushi Quận 4', 'Area 2', 2, '2023-12-14', '12:00:00', 'We would like to have a quiet table, please'),
('TKT0008', 'Sushi Gò Vấp', 'Area 2', 6, '2023-12-15', '19:30:00', 'Please prepare a table near the window'),
('TKT0011', 'Sushi Bình Thạnh', 'Area 1', 3, '2023-12-16', '17:00:00', 'We have a child with us, please prepare a high chair'),
('TKT0014', 'Sushi Quận 3', 'Area 4', 5, '2023-12-17', '11:30:00', 'We would like to have a table near the sushi bar'),
('TKT0017', 'Sushi Cầu Giấy', 'Area 3', 2, '2023-12-18', '13:00:00', 'Please prepare a table for two, no smoking area');

INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee, CreatedDate)
VALUES
('TKT0001', 'Table 1', 'EMP01', '2023-12-12 12:00:00'),
('TKT0004', 'Table 2', 'EMP04', '2023-12-13 18:30:00'),
('TKT0007', 'Table 3', 'EMP07', '2023-12-14 10:15:00'),
('TKT0010', 'Table 4', 'EMP10', '2023-12-15 14:45:00'),
('TKT0013', 'Table 5', 'EMP03', '2023-12-16 11:30:00'),
('TKT0016', 'Table 6', 'EMP06', '2023-12-17 17:00:00'),
('TKT0019', 'Table 7', 'EMP09', '2023-12-18 12:30:00');

INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price)
VALUES
('TKT0003', 1, '2023-12-15 11:30:00', 2, 50000),
('TKT0003', 2, '2023-12-15 11:35:00', 1, 30000),
('TKT0006', 3, '2023-12-16 18:00:00', 3, 40000),
('TKT0006', 4, '2023-12-16 18:05:00', 2, 25000),
('TKT0009', 5, '2023-12-17 09:45:00', 1, 60000),
('TKT0012', 6, '2023-12-18 13:15:00', 2, 35000),
('TKT0012', 7, '2023-12-18 13:20:00', 1, 20000),
('TKT0015', 8, '2023-12-19 10:45:00', 3, 45000),
('TKT0018', 9, '2023-12-20 16:00:00', 2, 55000),
('TKT0018', 10, '2023-12-20 16:05:00', 1, 30000);

INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price)
VALUES
('TKT0002', 1, '2023-12-13 18:30:00', 2, 50000),
('TKT0002', 2, '2023-12-13 18:30:00', 1, 30000),
('TKT0005', 3, '2023-12-14 12:00:00', 3, 40000),
('TKT0005', 4, '2023-12-14 12:00:00', 2, 25000),
('TKT0008', 5, '2023-12-15 19:30:00', 1, 60000),
('TKT0011', 6, '2023-12-16 17:00:00', 2, 35000),
('TKT0011', 7, '2023-12-16 17:00:00', 1, 20000),
('TKT0014', 8, '2023-12-17 11:30:00', 3, 45000),
('TKT0017', 9, '2023-12-18 13:00:00', 2, 55000),
('TKT0017', 10, '2023-12-18 13:00:00', 1, 30000);

INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price)
VALUES
('TKT0001', 1, '2023-12-12 12:00:00', 2, 50000),
('TKT0001', 2, '2023-12-12 12:00:00', 1, 30000),
('TKT0004', 3, '2023-12-13 18:30:00', 3, 40000),
('TKT0004', 4, '2023-12-13 18:30:00', 2, 25000),
('TKT0007', 5, '2023-12-14 10:15:00', 1, 60000),
('TKT0010', 6, '2023-12-15 14:45:00', 2, 35000),
('TKT0010', 7, '2023-12-15 14:45:00', 1, 20000),
('TKT0013', 8, '2023-12-16 11:30:00', 3, 45000),
('TKT0016', 9, '2023-12-17 17:00:00', 2, 55000),
('TKT0016', 10, '2023-12-17 17:00:00', 1, 30000),
('TKT0019', 11, '2023-12-18 12:30:00', 2, 50000),
('TKT0019', 12, '2023-12-18 12:30:00', 1, 30000);

GO
CREATE TRIGGER TR_UpdateBillTotal
ON BILL
AFTER INSERT 
AS
BEGIN
DECLARE @TicketID CHAR(10), @Discount INT, @TotalPrice BIGINT;

SELECT 
    @TicketID = i.TicketID,
    @Discount = i.Discount
FROM INSERTED i;

-- Calculate total price based on order type
IF EXISTS (SELECT 1 FROM ONLINE_TICKET ot WHERE ot.OTicketID = @TicketID)
    BEGIN
        UPDATE B
        SET TotalPrice = (
            SELECT SUM(od.Quantity * od.Price) 
            FROM ONLINE_TICKET_DETAIL od 
            WHERE od.OTicketID = @TicketID
        ) * (1 - @Discount / 100.0)
        FROM BILL B
        WHERE B.TicketID = @TicketID;
    END
ELSE IF EXISTS (SELECT 1 FROM PRE_ORDER_TICKET pt WHERE pt.PTicketID = @TicketID)
    BEGIN
        UPDATE B
        SET TotalPrice = (
            SELECT SUM(pd.Quantity * pd.Price) 
            FROM PRE_ORDER_TICKET_DETAIL pd 
            WHERE pd.PTicketID = @TicketID
        ) * (1 - @Discount / 100.0)
        FROM BILL B
        WHERE B.TicketID = @TicketID;
    END
ELSE IF EXISTS (SELECT 1 FROM STANDARD_ORDER_TICKET st WHERE st.SOTicketID = @TicketID)
    BEGIN
        UPDATE B
        SET TotalPrice = (
            SELECT SUM(sd.Quantity * sd.Price) 
            FROM STANDARD_ORDER_DETAIL sd 
            WHERE sd.SOTicketID = @TicketID
        ) * (1 - @Discount / 100.0)
        FROM BILL B
        WHERE B.TicketID = @TicketID;
    END
END;

INSERT INTO BILL (BillID, Discount, TotalPrice, TicketID)
VALUES
('BIL0001', 10, 200000, 'TKT0001'),
('BIL0002', 5, 150000, 'TKT0002'),
('BIL0003', 0, 180000, 'TKT0003'),
('BIL0004', 15, 220000, 'TKT0004'),
('BIL0005', 8, 170000, 'TKT0005'),
('BIL0006', 20, 160000, 'TKT0006'),
('BIL0007', 5, 250000, 'TKT0007'),
('BIL0008', 12, 190000, 'TKT0008'),
('BIL0009', 10, 210000, 'TKT0009'),
('BIL0010', 8, 180000, 'TKT0010'),
('BIL0011', 15, 230000, 'TKT0011'),
('BIL0012', 5, 160000, 'TKT0012'),
('BIL0013', 10, 200000, 'TKT0013'),
('BIL0014', 8, 190000, 'TKT0014'),
('BIL0015', 12, 170000, 'TKT0015'),
('BIL0016', 20, 150000, 'TKT0016'),
('BIL0017', 5, 240000, 'TKT0017'),
('BIL0018', 10, 180000, 'TKT0018'),
('BIL0019', 15, 220000, 'TKT0019'),
('BIL0020', 8, 190000, 'TKT0020');

INSERT INTO FEEDBACK_TICKET (TicketID, FeedbackBranchLocation, FeedbackService, FeedbackFoodQuality, FeedbackPrice, FeedbackLocation, FeedbackNote)
VALUES
('TKT0001', '09', 'Excellent service', 'Delicious food', 'Reasonable price', 'Clean and comfortable', 'No specific notes'),
('TKT0002', '10', 'Very good service', 'High-quality food', 'Fair price', 'Nice ambiance', 'No specific notes'),
('TKT0003', '09', 'Friendly staff', 'Tasty food', 'Affordable price', 'Convenient location', 'No specific notes'),
('TKT0004', '10', 'Prompt service', 'Fresh and flavorful food', 'Good value for money', 'Pleasant atmosphere', 'No specific notes'),
('TKT0005', '09', 'Efficient service', 'Well-prepared dishes', 'Reasonable pricing', 'Clean and spacious', 'No specific notes'),
('TKT0006', '10', 'Excellent customer service', 'Delicious and authentic food', 'Fair price', 'Nice ambiance', 'No specific notes'),
('TKT0007', '09', 'Friendly and helpful staff', 'Tasty and fresh food', 'Affordable prices', 'Convenient location', 'No specific notes'),
('TKT0008', '10', 'Prompt and efficient service', 'High-quality ingredients', 'Reasonable pricing', 'Pleasant atmosphere', 'No specific notes'),
('TKT0009', '09', 'Excellent service', 'Delicious food', 'Reasonable price', 'Clean and comfortable', 'No specific notes'),
('TKT0010', '10', 'Very good service', 'High-quality food', 'Fair price', 'Nice ambiance', 'No specific notes');