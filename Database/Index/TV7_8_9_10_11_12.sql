--TV7: Hiển thị các đơn hàng online của khách hàng và chi tiết từng đơn hàng.
SET STATISTICS TIME ON;
exec usp_HienThiDonHangOnline
	@CCCD = '0000000006'
SET STATISTICS TIME OFF;
go

-- INDEX THEM
CREATE INDEX idx_order_ticket_cccd ON ORDER_TICKET(CCCD);
drop index idx_order_ticket_cccd on ORDER_TICKET

--TV8: Xem thông tin nhân viên hiện tại và lịch sử làm việc tại chi nhánh.
SET STATISTICS TIME ON;
exec usp_LichSuLamViecNhanVien
	@EmpID = '00001'
SET STATISTICS TIME OFF;
go

-- INDEX THEM
CREATE INDEX idx_work_history_branchid ON WORK_HISTORY(BranchID);
drop index idx_work_history_branchid on work_history


--TV9: Lấy danh sách các món ăn hiện có trong thực đơn của một chi nhánh cụ thể.
SET STATISTICS TIME ON;
exec usp_ThucDonChiNhanh
	@BranchID = 1
SET STATISTICS TIME OFF;
go

-- THEM INDEX
CREATE INDEX idx_menu_detail_branchid_isserving ON MENU_DETAIL(BranchID, isServing); 
GO

DROP INDEX idx_menu_detail_branchid_isserving ON MENU_DETAIL

--TV10: Hiển thị chi tiết các món ăn trong từng combo tại một chi nhánh.
SET STATISTICS TIME ON;
exec usp_HienThiComBoChiNhanh
	@BranchID = 1
SET STATISTICS TIME OFF;
go

-- THEM INDEX
CREATE INDEX idx_branch_areaname ON BRANCH(AreaName);
CREATE INDEX idx_area_menuid ON AREA(MenuID);
CREATE INDEX idx_dish_menu_inmenu ON DISH_MENU(inMenu); 

--TV11: Lấy danh sách các phiếu đặt món được tạo trong 1 khoảng thời gian.
go
CREATE OR ALTER PROC usp_LayDanhSachPhieuDatMon
AS
BEGIN
	SELECT * 
	FROM ORDER_TICKET 
	WHERE CreatedDate BETWEEN '2023-01-01' AND '2023-12-31' 
		AND BranchID = 1;

END


EXEC usp_LayDanhSachPhieuDatMon

CREATE INDEX IDX_OrderTicket_BranchDate
ON ORDER_TICKET (BranchID, CreatedDate)
INCLUDE (TicketType, CCCD, EmpID, Discount, TotalPrice);

--TV12: Lấy danh sách các chi nhánh mà ở đó có phiếu đặt món được tạo ra trong 1 khoang thoi gian.
go
CREATE OR ALTER PROC usp_LayDanhSachChiNhanhCoPhieuDatMon
AS
BEGIN
	SELECT b.BranchName
	FROM BRANCH b
	WHERE EXISTS (
		SELECT 1 
		FROM ORDER_TICKET o
		WHERE o.BranchID = b.BranchID
			AND o.CreatedDate > '2024-01-01'
);

END

EXEC usp_LayDanhSachChiNhanhCoPhieuDatMon

CREATE INDEX IDX_OrderTicket_BranchDate2 
ON ORDER_TICKET(BranchID, CreatedDate);

DROP INDEX ORDER_TICKET.IDX_OrderTicket_BranchDate2

--TV13
go
CREATE OR ALTER PROCEDURE usp_TaoPhieuDatMon
    @TicketID CHAR(10),
    @TicketType CHAR(3),
    @BranchID INT,
    @CCCD CHAR(10),
    @EmpID CHAR(5),
    @Discount INT,
    @TotalPrice BIGINT,
    @CreatedDate DATETIME
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM BRANCH WHERE BranchID = @BranchID)
    BEGIN
		RAISERROR('BranchID không tồn tại.', 16, 1);
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM CUSTOMER WHERE CCCD = @CCCD)
    BEGIN
		RAISERROR('CCCD không tồn tại.', 16, 1);
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE EmpID = @EmpID)
    BEGIN
		RAISERROR('EmpID không tồn tại.', 16, 1);
        RETURN;
    END

    INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID, Discount, TotalPrice, CreatedDate)
    VALUES (@TicketID, @TicketType, @BranchID, @CCCD, @EmpID, @Discount, @TotalPrice, @CreatedDate);


    PRINT N'Order Ticket đã được tạo thành công.';
END;


DECLARE @Counter INT = 1;
DECLARE @TICKET_ID_SAMPLE VARCHAR(10);

WHILE @Counter <= 1000
BEGIN
	SET @TICKET_ID_SAMPLE = 'TICKET69' + CAST(@Counter AS VARCHAR(10))
    EXEC usp_TaoPhieuDatMon
        @TicketID = @TICKET_ID_SAMPLE,
        @TicketType = 'PRE',
        @BranchID = 2,
        @CCCD = '0000000001',
        @EmpID = '00001',
        @Discount = 10,
        @TotalPrice = 500000,
        @CreatedDate = '2024-12-31 12:30:00';

    SET @Counter = @Counter + 1;
END;

CREATE INDEX IDX_OrderTicket_BranchID
ON ORDER_TICKET(TicketID, BranchID);