use Nhom3_QLSUSHI
go

INSERT INTO BRANCH (BranchID, BranchName, BranchAddress, OpeningTime, ClosedTime, isParkinglot, AreaName, DeliveryService) VALUES
(1, N'Sushi Bình Thạnh', N'27A, đường Bạch Đằng, Quận Bình Thạnh, TP.HCM', N'8:00', N'17:30', 0, null, 1),
(2, N'Sushi Quận 12', N'355, đường Tô Ký, Quận 12, TP.HCM', N'7:45', N'17:30', 1, null, 1),
(3, N'Sushi Ánh Sao', N'15, đường 15, Quận 7, TP.HCM', N'15:45', N'21:30', 1, null, 1),
(4, N'Sushi Quận 3', N'27A, đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM', N'9:00', N'18:30', 0, null, 1),
(5, N'Sushi Quận 4', N'355C, đường Bến Vân Đồn, Quận 4, TP.HCM', N'7:45', N'17:30', 0, null, 1),
(6, N'Sushi Quận 5', N'167A, đường Nguyễn Văn Cừ, Quận 5, TP.HCM', N'8:45', N'17:45', 1, null, 1),
(7, N'Sushi Cầu Giấy', N'27A, đường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội', N'10:00', N'20:30', 1, null, 1),
(8, N'Sushi Gò Vấp', N'1A, đường Quang Trung, Quận Gò Vấp, TP.HCM', N'7:45', N'17:30', 1, null, 0),
(9, N'Sushi Bến Thành', N'510, đường Phan Bội Châu, Quận 1, TP.HCM', N'9:45', N'17:30', 1, null, 0),
(10, N'Sushi Gò Vấp 2', N'2B, đường Nguyễn Huệ, Quận Gò Vấp, TP.HCM', N'10:45', N'17:30', 1, null, 1),
(11, N'Sushi Tân Sơn Nhất', N'Sân bay Tân Sơn Nhất, TP.HCM', N'5:45', N'17:30', 1, null, 0),
(12, N'Sushi Nha Trang', N'55, Lê Thành Phương, Vạn Thắng, TP.Nha Trang', N'12:45', N'17:30', 1, null, 1),
(13, N'Sushi Mạc Đĩnh Chi', N'19 – 21 – 23, Mạc Đĩnh Chi, Đa Kao, Quận 1, TP.HCM', N'13:45', N'16:30', 1, null, 0),
(14, N'Sushi Phú Lâm', N'	1039 Hồng Bàng, Phường 12, TP.HCM', N'16:30', N'17:30', 1, null, 1),
(15, N'Sushi Him Lam', N'121 – 123 Nguyễn Thị Thập, Khu Đô Thị Him Lam, Phường Tân Hưng, TP.HCM', N'9:15', N'18:30', 1, null, 0)



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
