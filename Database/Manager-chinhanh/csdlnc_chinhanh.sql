USE Nhom3_ADB

-----------------------TRIGGER TÍNH ĐIỂM TOTAL CHO PHIẾU FEEDBACK--------------------------------------------
GO
CREATE OR ALTER TRIGGER TR_CalculateTotalScore
ON FEEDBACK_TICKET
AFTER INSERT
AS
BEGIN
    DECLARE @InsertedID CHAR(10);
    DECLARE @TotalScore INT;

    SELECT @InsertedID = inserted.TicketID,
           @TotalScore = (inserted.FeedbackService + inserted.FeedbackFoodQuality + inserted.FeedbackPrice + inserted.FeedbackLocation) / 4
    FROM inserted;

    UPDATE FEEDBACK_TICKET
    SET FeedbackTotalScore = @TotalScore
    WHERE TicketID = @InsertedID;
END;
GO

-----------------------TRIGGER UPDATE TỰ ĐỘNG TỔNG TIỀN HÓA ĐƠN KHI INSERT BILL--------------------------------------------

GO
CREATE OR ALTER TRIGGER TR_UpdateBillTotal
ON BILL
AFTER INSERT 
AS
BEGIN
DECLARE @TicketID CHAR(10), @Discount INT, @TotalPrice BIGINT;

SELECT 
    @TicketID = i.TicketID,
    @Discount = i.Discount
FROM INSERTED i;

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

		UPDATE B
		SET CreatedDate = (
			SELECT DeliveryDate
			FROM ONLINE_TICKET
			WHERE @TicketID = OTicketID)
		FROM BILL B
		WHERE B.TicketID = @TicketID
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

		UPDATE B
		SET CreatedDate = (
			SELECT PreOrderArrivalTime
			FROM PRE_ORDER_TICKET
			WHERE @TicketID = PTicketID)
		FROM BILL B
		WHERE B.TicketID = @TicketID
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

		UPDATE B
		SET CreatedDate = (
			SELECT CreatedDate
			FROM STANDARD_ORDER_TICKET
			WHERE @TicketID = SOTicketID)
		FROM BILL B
		WHERE B.TicketID = @TicketID
    END
END;
GO

-------------------------KIỂU DỮ LIỆU DẠNG BẢNG LƯU TRỮ DANH SÁCH MÓN HÀNG TRONG 1 ORDER------------------------------------------

CREATE TYPE DSTicket AS TABLE
(
	DishID int UNIQUE,
	OrderTime datetime UNIQUE,
	Quantity int,
	Price int
)

-------------------------TÍNH DOANH THU 1 CHI NHÁNH CỤ THỂ TỪ NGÀY X ĐẾN NGÀY Y------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_GetBranchRevenue 
    @BranchID INT, 
    @startDate DATETIME, 
    @endDate DATETIME
AS
BEGIN
    -- Calculate the total revenue by summing the TotalPrice from the BILL table
    SELECT SUM(b.TotalPrice) AS N'Tổng doanh thu trong khoảng thời gian đã chọn'
    FROM BILL b
    JOIN ORDER_TICKET ot ON b.TicketID = ot.TicketID
	JOIN BRANCH br ON br.BranchID = ot.BranchID
	WHERE @BranchID = br.BranchID
	AND b.CreatedDate >= @startDate 
	AND b.CreatedDate <= @endDate
END


-- exec usp_GetBranchRevenue 1, '2021-12-12 00:00:00.000 ', '2023-12-16 20:00:00.000'

--------------------------TÍNH TRUNG BÌNH ĐIỂM PHỤC VỤ CỦA 1 EMPLOYEE-----------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_GetEmpServiceScore 
	@EmpID CHAR(5)
AS
BEGIN
	SELECT AVG(ft.FeedbackService) AS N'Điểm dịch vụ trung bình của nhân viên cần tìm'
	FROM FEEDBACK_TICKET ft join ORDER_TICKET ot on ft.TicketID = ot.TicketID
	WHERE ot.EmpID = @EmpID
END

-- exec usp_GetEmpServiceScore 'EMP02'

--------------------------TÌM KIẾM EMPLOYEE ĐANG LÀM TRONG 1 CHI NHÁNH-----------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_SearchEmployee
	@BrachID INT,
	@EmpID CHAR(5)
AS
BEGIN 
	SELECT e.*
	FROM EMPLOYEE e join STATION_EMPLOYEE se on e.EmpID = se.EmpID 
	WHERE e.EmpID = @EmpID and se.BranchID = @BrachID
END

exec usp_SearchEmployee 1, 'EMP01'

--------------------------HÀM HỖ TRỢ THÊM DÒNG ONLINE ORDER-----------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ThemOnlineOrder
    @TicketID char(10),
    @DeliveryDate datetime
AS
BEGIN
    INSERT INTO ONLINE_TICKET (OTicketID, DeliveryDate)
    VALUES (@TicketID, @DeliveryDate)
END

-------------------------HÀM HỖ TRỢ THÊM DÒNG PRE ORDER------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ThemPreOrder
    @TicketID char(10),
    @BranchID int,
    @NumberOfCustomer int,
    @PreOrderDate datetime,
    @PreOrderArrivalTime date,
    @PreOrderNote nvarchar(100)
AS
BEGIN
    DECLARE @BranchName nvarchar(30)
    DECLARE @AreaName nvarchar(30)

    SELECT @BranchName = BranchName, @AreaName = AreaName
    FROM BRANCH 
    WHERE BranchID = @BranchID

    INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer, PreOrderDate, PreOrderArrivalTime, PreOrderNote)
    VALUES (@TicketID, @BranchName, @AreaName, @NumberOfCustomer, @PreOrderDate, @PreOrderArrivalTime, @PreOrderNote)
END


-------------------------HÀM HỖ TRỢ THÊM DÒNG STANDARD ORDER------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ThemStandardOrder
    @TicketID char(10),
    @TableName nvarchar(30),
    @EmpID char(5),
    @CreateDate datetime
AS
BEGIN
    INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee, CreatedDate)
    VALUES (@TicketID, @TableName, @EmpID, @CreateDate)
END


--------------------------HÀM HỖ TRỢ ADD DỮ LIỆU TỪNG MÓN HÀNG TRONG ORDER VÀO BẢNG CÓ LOẠI ORDER TƯƠNG ỨNG-----------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ADD_DETAIL_ORDER 
    @DSDonHang DSTicket READONLY,
    @TicketID char(10)
AS
BEGIN
    DECLARE cur CURSOR FOR
        SELECT DishID, OrderTime, Quantity, Price
        FROM @DSDonHang

    DECLARE @DishID int,
            @OrderTime datetime,
            @Quantity int,
            @Price int

	DECLARE @OrderType char(3)

	SELECT @OrderType = TicketType
	FROM ORDER_TICKET 
	WHERE TicketID =@TicketID


    OPEN cur

    FETCH NEXT FROM cur INTO @DishID, @OrderTime, @Quantity, @Price

    WHILE @@FETCH_STATUS = 0
    BEGIN
	    IF @OrderType = 'ONL'
		BEGIN
			INSERT INTO ONLINE_TICKET_DETAIL (OTicketID, DishID, OrderTime, Quantity, Price)
			VALUES (@TicketID, @DishID, @OrderTime, @Quantity, @Price)
		END

		ELSE IF @OrderType = 'PRE'
		BEGIN
			INSERT INTO PRE_ORDER_TICKET_DETAIL (PTicketID, DishID, OrderTime, Quantity, Price)
			VALUES (@TicketID, @DishID, @OrderTime, @Quantity, @Price)
		END

		ELSE IF @OrderType = 'STD'
		BEGIN
			INSERT INTO STANDARD_ORDER_DETAIL (SOTicketID, DishID, OrderTime, Quantity, Price)
			VALUES (@TicketID, @DishID, @OrderTime, @Quantity, @Price)
		END

        -- Fetch the next row
        FETCH NEXT FROM cur INTO @DishID, @OrderTime, @Quantity, @Price
    END

    -- Close and deallocate the cursor
    CLOSE cur
    DEALLOCATE cur
END

----------------------------HÀM CHÍNH TẠO 1 ORDER TICKET VÀ TẠO ĐƠN HÀNG CÓ LOẠI ORDER TƯƠNG ỨNG INPUT VÀ THÊM DỮ LIỆU MỖI SẢN PHẨM TƯƠNG ỨNG-------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ADD_ORDER_TICKET 
	@TicketID char(10),
	@CCCD char(10),
	@TicketType char(3),
	@BranchID int,
	@EmpID char(5),
	@DeliveryDate datetime,
	@NumberOfCustomer int,
	@PreOrderDate datetime,
	@PreOrderArrivalTime date,
	@PreOrderNote nvarchar(100),
	@TableName nvarchar(30),
	@CreateDate datetime,
	@BillID char(10),
	@Discount int,
	@DSDonHang DSTicket READONLY
AS
BEGIN
	BEGIN TRY
    IF EXISTS (SELECT 1 FROM ORDER_TICKET WHERE TicketID = @TicketID)
    BEGIN
        RAISERROR(N'TicketID đã tồn tại', 16, 1);
        RETURN
    END

    IF @TicketType NOT IN ('ONL', 'PRE', 'STD')
    BEGIN
        RAISERROR(N'TicketType không hợp lệ', 16, 1);
        RETURN
    END

    INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID)
    VALUES (@TicketID, @TicketType, @BranchID, @CCCD, @EmpID)
    
    
    IF @TicketType = 'ONL'
    BEGIN
        EXEC usp_ThemOnlineOrder @TicketID, @DeliveryDate
        PRINT(N'Thêm thành công order')
    END

    IF @TicketType = 'PRE'
    BEGIN
        EXEC usp_ThemPreOrder @TicketID, @BranchID, @NumberOfCustomer, @PreOrderDate, @PreOrderArrivalTime, @PreOrderNote
        PRINT(N'Thêm thành công order')
    END

    IF @TicketType = 'STD'
    BEGIN
        EXEC usp_ThemStandardOrder @TicketID, @TableName, @EmpID, @CreateDate
        PRINT(N'Thêm thành công order')
    END

	EXEC usp_ADD_DETAIL_ORDER @DSDonHang, @TicketID

	INSERT INTO BILL VALUES (@BillID, @Discount, NULL, @TicketID, NULL)
	END TRY
BEGIN CATCH
    PRINT(N'Lỗi: ' + ERROR_MESSAGE())
END CATCH

END

GO

/*
DECLARE @DSOnline DSTicket

INSERT INTO @DSOnline (DishID, OrderTime, Quantity, Price)
VALUES (1, '2024-12-13 12:00:00', 2, 50000),
       (2, '2024-12-13 12:05:00', 1, 30000)

------------------------------------------------------------------
DECLARE @DSPreOrder DSTicket

INSERT INTO @DSPreOrder (DishID, OrderTime, Quantity, Price)
VALUES (1, '2024-12-13 12:00:00', 2, 50000),
       (2, '2024-12-13 12:05:00', 1, 30000)

------------------------------------------------------------------
DECLARE @DSStandard DSTicket

INSERT INTO @DSStandard (DishID, OrderTime, Quantity, Price)
VALUES (1, '2024-12-13 12:00:00', 2, 50000),
       (2, '2024-12-13 12:05:00', 1, 30000)

*/


-- exec usp_ADD_ORDER_TICKET 'TKT0021', '0123456789', 'ONL', 1, 'EMP01', '2024 - 1 -1', 2, '2024 - 1 -1 14:00:00', '2024 - 1 -1 18:00:00', NULL, 'Table 1', '2024 - 1 -1 14:00:00','BIL0021', 10,  @DSOnline
-- exec usp_ADD_ORDER_TICKET 'TKT0022', '0123456789', 'PRE', 1, 'EMP01', '2024 - 1 -1', 2, '2024 - 1 -1 14:00:00', '2024 - 1 -1 18:00:00', NULL, 'Table 1', '2024 - 1 -1 14:00:00','BIL0022, 10,  @DSPreOrder
-- exec usp_ADD_ORDER_TICKET 'TKT0023', '0123456789', 'STD', 1, 'EMP01', '2024 - 1 -1', 2, '2024 - 1 -1 14:00:00', '2024 - 1 -1 18:00:00', NULL, 'Table 1', '2024 - 1 -1 14:00:00', 'BIL0023', 10, @DSStandard

-- delete ORDER_TICKET where TicketID = 'TKT0022'

-----------------------------XÓA 1 ORDER TICKET VÀ CÁC DỮ LIỆU LIÊN QUAN TỚI NÓ Ở CÁC BẢNG KHÁC-------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_XoaOrderTicket
	@TicketID char(10)
AS
BEGIN
	DECLARE @OrderType char(3)

	SELECT @OrderType = TicketType
	FROM ORDER_TICKET 
	WHERE TicketID =@TicketID

	DELETE BILL
	WHERE TicketID = @TicketID

	IF @OrderType = 'ONL'
	BEGIN
		DELETE ONLINE_TICKET_DETAIL
		WHERE OTicketID = @TicketID

		DELETE ONLINE_TICKET
		WHERE OTicketID = @TicketID

		DELETE ORDER_TICKET
		WHERE TicketID = @TicketID
	END

	ELSE IF @OrderType = 'PRE'
	BEGIN
		DELETE PRE_ORDER_TICKET_DETAIL
		WHERE PTicketID = @TicketID

		DELETE PRE_ORDER_TICKET
		WHERE PTicketID = @TicketID

		DELETE ORDER_TICKET
		WHERE TicketID = @TicketID
	END

	ELSE IF @OrderType = 'STD'
	BEGIN
		DELETE STANDARD_ORDER_DETAIL
		WHERE SOTicketID = @TicketID

		DELETE STANDARD_ORDER_TICKET
		WHERE SOTicketID = @TicketID

		DELETE ORDER_TICKET
		WHERE TicketID = @TicketID
	END

END

-- exec usp_XoaOrderTicket 'TKT0021'
-- exec usp_XoaOrderTicket 'TKT0022'
-- exec usp_XoaOrderTicket 'TKT0023'


------------------------------THÊM KHÁCH HÀNG-------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ADD_CUSTOMER
	@CCCD char(10),
	@CustomerFirstname nvarchar(20),
	@CustomerLastname nvarchar(20),
	@PhoneNumber char(10),
	@Email varchar(50),
	@Gender nchar(3),
	@isMember bit,
	@isRegistered bit
AS
BEGIN
	BEGIN TRY 
	IF EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		RAISERROR(N'Đã tồn tại khách hàng này rồi', 16,1);
		RETURN;
	END

	INSERT INTO CUSTOMER VALUES(@CCCD, @CustomerFirstname, @CustomerLastname, @PhoneNumber, @Email, @Gender, @isMember, @isRegistered)
	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_ADD_CUSTOMER '1111111111', N'Đinh Việt', N'Đức', '0902510445', 'dinhzitduck@gmail.com', 'Nam', 1,1
-- DELETE CUSTOMER WHERE CCCD = '1111111111'

-----------------------------THÊM TÀI KHOẢN ONLINE CHO KHÁCH HÀNG--------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ADD_ONLINE_CUSTOMER
	@OCCCD char(10),
	@password varchar(50)
AS
BEGIN
	BEGIN TRY 
	IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @OCCCD)
	BEGIN
		RAISERROR(N'Khách hàng này chưa có thông tin', 16,1);
		RETURN;
	END

	INSERT INTO ONLINE_CUSTOMER VALUES(@OCCCD, @password)
	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_ADD_ONLINE_CUSTOMER '1111111111', 'abc'

-----------------------------THÊM THẺ MEMBER CHO KHÁCH HÀNG--------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ADD_MEMBER_CUSTOMER
	@MCCCD char(10),
	@CardNumber char(10),
	@CreateDate datetime,
	@SupportEmp char(5)
AS
BEGIN
	BEGIN TRY 
	IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @MCCCD)
	BEGIN
		RAISERROR(N'Khách hàng này chưa có thông tin', 16,1);
		RETURN;
	END
	INSERT INTO CUSTOMER_MEMBER VALUES(@MCCCD, @CardNumber, @CreateDate, @SupportEmp, 'MEMBER', 0, @CreateDate)
	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_ADD_MEMBER_CUSTOMER '1111111111', 'MC0006', '2024-12-13', 'EMP01'

----------------------------XÓA THẺ MEMBER ---------------------------------------
GO 
CREATE OR ALTER PROCEDURE usp_DELETE_MEMBER_CARD
	@MCCCD char(10)
AS
BEGIN
	BEGIN TRY 
	IF NOT EXISTS(SELECT 1 FROM CUSTOMER_MEMBER WHERE MCCCD = @MCCCD)
	BEGIN
		RAISERROR(N'Khách hàng này chưa có thông tin để xóa ', 16,1);
		RETURN;
	END

	DELETE CUSTOMER_MEMBER
	WHERE MCCCD = @MCCCD

	UPDATE CUSTOMER
	SET isMember = 0
	WHERE CCCD = @MCCCD

	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_DELETE_MEMBER_CARD '1111111111'

-------------------------------XÓA TÀI KHOẢN ONLINE------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_DELETE_ONLINE_ACCOUNT
	@OCCCD char(10)
AS
BEGIN
	BEGIN TRY 
	IF NOT EXISTS(SELECT 1 FROM ONLINE_CUSTOMER WHERE OCCCD = @OCCCD)
	BEGIN
		RAISERROR(N'Khách hàng này chưa có thông tin để xóa ', 16,1);
		RETURN;
	END

	DELETE ONLINE_CUSTOMER
	WHERE OCCCD = @OCCCD

	UPDATE CUSTOMER
	SET isRegistered = 0
	WHERE CCCD = @OCCCD
	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_DELETE_ONLINE_ACCOUNT '1111111111'

----------------------------------XÓA KHÁCH HÀNG VÀ CÁC TÀI KHOẢN MEMBER/ONLINE LIÊN QUAN---------------------------------

GO
CREATE OR ALTER PROCEDURE usp_DELETE_CUSTOMER
	@CCCD char(10)
AS
BEGIN
	BEGIN TRY
	IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		RAISERROR(N'Khách hàng này chưa có thông tin để xóa ', 16,1);
		RETURN;
	END

	IF 1 = (SELECT isMember FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		exec usp_DELETE_MEMBER_CARD @CCCD
	END

	IF 1 = (SELECT isRegistered FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		exec usp_DELETE_ONLINE_ACCOUNT @CCCD
	END

	DELETE CUSTOMER
	WHERE CCCD = @CCCD
	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_DELETE_CUSTOMER '1111111111'

-------UPDATE THÔNG TIN KHÁCH HÀNG, CÓ THỂ GÁN ) VÀO isMember hoặc isRegistered để xóa nhanh thẻ member hay tài khoản online tương ứng-----------------------------

GO
CREATE OR ALTER PROCEDURE usp_UPDATE_CUSTOMER
	@CCCD char(10),
	@CustomerFirstname nvarchar(20),
	@CustomerLastname nvarchar(20),
	@PhoneNumber char(10),
	@Email varchar(50),
	@Gender nchar(3),
	@isMember bit,
	@isRegistered bit
AS
BEGIN
	BEGIN TRY 
	IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		RAISERROR(N'Không tồn tại khách hàng này.', 16,1);
		RETURN;
	END

	IF @isMember = 1 AND @isMember <> (SELECT isMember FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		RAISERROR(N'Nếu muốn tạo tài khoản MEMBER hãy sử dụng chức năng tạo MEMBER', 16,1);
		RETURN;
	END

	IF @isRegistered = 1 AND @isRegistered <> (SELECT isRegistered FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		RAISERROR(N'Nếu muốn tạo tài khoản ONLINE hãy sử dụng chức năng tạo ONLINE', 16,1);
		RETURN;
	END

	IF @isMember = 0 AND @isMember <> (SELECT isMember FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		exec usp_DELETE_MEMBER_CARD @CCCD
	END

	IF @isRegistered = 0 AND @isRegistered <> (SELECT isRegistered FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN
		exec usp_DELETE_ONLINE_ACCOUNT @CCCD
	END

	UPDATE CUSTOMER
	SET CustomerFirstName = @CustomerFirstname, CustomerLastName = @CustomerLastname, PhoneNumber = @PhoneNumber, Email = @Email, Gender = @Gender
	WHERE CCCD = @CCCD

	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

/*
exec usp_ADD_CUSTOMER '1111111111', N'Đinh Việt', N'Đức', '0902510445', 'dinhzitduck@gmail.com', 'Nam', 1,1
exec usp_ADD_ONLINE_CUSTOMER '1111111111', 'abc'
exec usp_ADD_MEMBER_CUSTOMER '1111111111', 'MC0006', '2024-12-13', 'EMP01'

exec usp_UPDATE_CUSTOMER '1111111111', N'Đinh Việt', N'Duck', '0902510445', 'dinhzitduck@gmail.com', 'Nam', 0,1

exec usp_DELETE_CUSTOMER '1111111111'
*/

-------------------------UPDATE MẬT KHẨU CỦA TÀI KHOẢN ONLINE------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_UPDATE_ONLINE_CUSTOMER
	@OCCCD char(10),
	@password varchar(50)
AS
BEGIN
	BEGIN TRY 
	IF NOT EXISTS(SELECT 1 FROM ONLINE_CUSTOMER WHERE OCCCD = @OCCCD)
	BEGIN
		RAISERROR(N'Không tồn tại tài khoản online của khách hàng này.', 16,1);
		RETURN;
	END

	UPDATE ONLINE_CUSTOMER
	SET O_password = @password
	WHERE OCCCD = @OCCCD

	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

/*
exec usp_ADD_CUSTOMER '1111111111', N'Đinh Việt', N'Đức', '0902510445', 'dinhzitduck@gmail.com', 'Nam', 1,1
exec usp_ADD_ONLINE_CUSTOMER '1111111111', 'abc'

exec usp_UPDATE_ONLINE_CUSTOMER '1111111111', 'abcd'

exec usp_DELETE_CUSTOMER '1111111111'
*/

-----------------------------TÍNH ĐIỂM TÍCH LŨY CHO KHÁCH HÀNG--------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ACCUMULATE_POINTS
    @CCCD CHAR(10),
    @STARTDATE DATETIME,
    @ENDDATE DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @CCCD)
        BEGIN
            RAISERROR(N'Không tồn tại khách hàng này.', 16, 1);
            RETURN;
        END

        DECLARE @POINT INT;

        SELECT @POINT = ISNULL(SUM(b.TotalPrice)/100000, 0)
		FROM BILL b
		JOIN ORDER_TICKET ot ON b.TicketID = ot.TicketID
		WHERE 
        b.CreatedDate >= @STARTDATE
		AND b.CreatedDate <= @ENDDATE
        AND ot.CCCD = @CCCD

        UPDATE CUSTOMER_MEMBER
        SET MemberCardPoints = @POINT
        WHERE MCCCD = @CCCD;

    END TRY
    BEGIN CATCH
        PRINT N'Lỗi: ' + ERROR_MESSAGE();
    END CATCH
END

-------------------------------UPDATE RANK THẺ MEMBER CỦA KHÁCH HÀNG------------------------------------

GO 
CREATE OR ALTER PROCEDURE usp_UPDATE_MEMBER_RANK
	@CCCD char(10)
AS
BEGIN
	BEGIN TRY

	IF NOT EXISTS(SELECT 1 FROM CUSTOMER_MEMBER WHERE MCCCD = @CCCD)
	BEGIN
		RAISERROR(N'Không tồn tại tài khoản MEMBER của khách hàng này.', 16,1);
		RETURN;
	END

	DECLARE @CurrentRank char(6)
	DECLARE @GetRankDate datetime
	SELECT @CurrentRank = MemberCardRank, @GetRankDate = MemberCardAcquiredRankDate
	FROM CUSTOMER_MEMBER 
	WHERE MCCCD = @CCCD

	IF (@CurrentRank = 'MEMBER')
	BEGIN
		DECLARE @Today DATE SET @Today = CAST(GETDATE() AS DATE)
		EXEC usp_ACCUMULATE_POINTS @CCCD, '1900-01-01', @Today;

		IF 100 <= (SELECT MemberCardPoints FROM CUSTOMER_MEMBER WHERE MCCCD = @CCCD)
		BEGIN 
			UPDATE CUSTOMER_MEMBER
			SET MemberCardRank = 'SILVER', MemberCardAcquiredRankDate = getdate(), MemberCardPoints = 0
			WHERE MCCCD = @CCCD

			RETURN
		END
		ELSE 
			RETURN
	END

	IF(@CurrentRank = 'SILVER')
	BEGIN

		DECLARE @NextYearDate datetime
		SET @NextYearDate = DATEADD(year, 1, @GetRankDate)
		EXEC usp_ACCUMULATE_POINTS @CCCD, @GetRankDate, @NextYearDate

		IF 50 > (SELECT MemberCardPoints FROM CUSTOMER_MEMBER WHERE MCCCD = @CCCD) 
		BEGIN 
			UPDATE CUSTOMER_MEMBER
			SET MemberCardRank = 'MEMBER', MemberCardAcquiredRankDate = getdate()
			WHERE MCCCD = @CCCD

			RETURN
		END

		ELSE IF 100 <= (SELECT MemberCardPoints FROM CUSTOMER_MEMBER WHERE MCCCD = @CCCD) 
		BEGIN 
			UPDATE CUSTOMER_MEMBER
			SET MemberCardRank = 'GOLD', MemberCardAcquiredRankDate = getdate()
			WHERE MCCCD = @CCCD

			RETURN
		END
	END

	IF(@CurrentRank = 'GOLD')
	BEGIN
		DECLARE @NextYearDate1 datetime
		SET @NextYearDate = DATEADD(year, 1, @GetRankDate)
		EXEC usp_ACCUMULATE_POINTS @CCCD, @GetRankDate, @NextYearDate1

		IF 100 > (SELECT MemberCardPoints FROM CUSTOMER_MEMBER WHERE MCCCD = @CCCD) 
		BEGIN 
			UPDATE CUSTOMER_MEMBER
			SET MemberCardRank = 'SILVER', MemberCardAcquiredRankDate = getdate()
			WHERE MCCCD = @CCCD

			RETURN
		END
	END

	END TRY
	BEGIN CATCH
	PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-------------------------------------------------------------------
GO

/*
exec usp_ADD_CUSTOMER '1111111111', N'Đinh Việt', N'Đức', '0902510445', 'dinhzitduck@gmail.com', 'Nam', 1,0
exec usp_ADD_MEMBER_CUSTOMER '1111111111', 'MC0006', '2024-12-13', 'EMP01'


DECLARE @DSOnline DSTicket
INSERT INTO @DSOnline (DishID, OrderTime, Quantity, Price)
VALUES (1, '2024-12-13 12:00:00', 200, 50000),
       (2, '2024-12-13 12:05:00', 10, 30000)

exec usp_ADD_ORDER_TICKET 'TKT0021', '1111111111', 'ONL', 1, 'EMP01', '2024 - 12 -10', 2, '2024 - 12 -10 14:00:00', '2024 - 12 -10 18:00:00', NULL, 'Table 1', '2024 - 12 -10 14:00:00','BIL0021', 0,  @DSOnline

exec usp_UPDATE_MEMBER_RANK '1111111111'

DECLARE @DSOnline1 DSTicket
INSERT INTO @DSOnline1 (DishID, OrderTime, Quantity, Price)
VALUES (11, '2024-12-13 12:00:00', 200, 50000),
       (21, '2024-12-13 12:05:00', 10, 30000)

exec usp_ADD_ORDER_TICKET 'TKT0022', '1111111111', 'ONL', 1, 'EMP01', '2025 - 01 -01', 2, '2025 - 01 -01 14:00:00', '2025 - 01 -01 18:00:00', NULL, 'Table 1', '2025 - 01 -01 14:00:00','BIL0022', 0,  @DSOnline1

DECLARE @DSOnline2 DSTicket
INSERT INTO @DSOnline2 (DishID, OrderTime, Quantity, Price)
VALUES (11, '2024-12-13 12:00:00', 200, 50000),
       (21, '2024-12-13 12:05:00', 10, 30000)

exec usp_ADD_ORDER_TICKET 'TKT0023', '1111111111', 'ONL', 1, 'EMP01', '2025 - 01 -01', 2, '2025 - 01 -01 14:00:00', '2025 - 01 -01 18:00:00', NULL, 'Table 1', '2025 - 01 -01 14:00:00','BIL0023', 0,  @DSOnline2

exec usp_XoaOrderTicket 'TKT0021'
exec usp_XoaOrderTicket 'TKT0022'
exec usp_XoaOrderTicket 'TKT0023'
exec usp_DELETE_CUSTOMER '1111111111'
*/