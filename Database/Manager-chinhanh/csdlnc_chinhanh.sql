USE Nhom3_ADB

-----------------------TRIGGER TÍNH ĐIỂM TOTAL CHO PHIẾU FEEDBACK--------------------------------------------
GO
CREATE OR ALTER TRIGGER TR_CalculateTotalScore
ON FEEDBACK_TICKET
AFTER INSERT, UPDATE
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

-----------------------TRIGGER UPDATE TỰ ĐỘNG DISCOUNT CHO ORDER--------------------------------------------
GO
CREATE OR ALTER TRIGGER TR_UpdateOrderDiscount
ON ORDER_TICKET
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @TicketID CHAR(10), @Discount INT, @TotalPrice BIGINT;
	SET @Discount = 0
	SELECT @TicketID = i.TicketID
	FROM INSERTED i;

	DECLARE @Rank char(6)

	IF EXISTS(SELECT 1 FROM CUSTOMER c JOIN ORDER_TICKET ot ON ot.CCCD = c.CCCD WHERE ot.TicketID = @TicketID AND c.isMember = 1)
	BEGIN
		SELECT @Rank = cm.MemberCardRank
		FROM ORDER_TICKET ot join CUSTOMER c on c.CCCD = ot.CCCD join CUSTOMER_MEMBER cm on cm.MCCCD = c.CCCD 
		WHERE @TicketID = ot.TicketID

		SET @Discount = CASE 
		WHEN @Rank = 'MEMBER' THEN 0
		WHEN @Rank = 'SILVER' THEN 10
		WHEN @Rank = 'GOLD' THEN 20
		ELSE 0
		END;
	END
	UPDATE ORDER_TICKET
	SET Discount = @Discount, CreatedDate = GETDATE()
	WHERE TicketID = @TicketID
END


-----------------------TRIGGER UPDATE TỰ ĐỘNG TỔNG TIỀN HÓA ĐƠN KHI INSERT TICKET DETAIL--------------------------------------------
-----------------------------------------------ONLINE TICKET------------------------------------------------------------------------

GO
CREATE OR ALTER TRIGGER trg_UpdateTotalPriceOnlineTicket
ON ONLINE_TICKET_DETAIL
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @OTicketID CHAR(10);
    DECLARE @TotalPrice BIGINT;

    DECLARE cur CURSOR FOR
    SELECT OTicketID FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @OTicketID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @TotalPrice = SUM(Quantity * Price)
        FROM ONLINE_TICKET_DETAIL
        WHERE OTicketID = @OTicketID;

        UPDATE ORDER_TICKET
        SET TotalPrice = @TotalPrice * (1 - Discount/100.0)
        WHERE TicketID = @OTicketID; 

        FETCH NEXT FROM cur INTO @OTicketID;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO

-----------------------------------------------PRE ORDER TICKET---------------------------------------------------------------
CREATE OR ALTER TRIGGER trg_UpdateTotalPricePreOrder
ON PRE_ORDER_TICKET_DETAIL
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @PTicketID CHAR(10);
    DECLARE @TotalPrice BIGINT;

    DECLARE cur CURSOR FOR
    SELECT PTicketID FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @PTicketID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @TotalPrice = SUM(Quantity * Price)
        FROM PRE_ORDER_TICKET_DETAIL
        WHERE PTicketID = @PTicketID;

        UPDATE ORDER_TICKET
        SET TotalPrice = @TotalPrice * (1 - Discount/100.0)
        WHERE TicketID = @PTicketID;

        FETCH NEXT FROM cur INTO @PTicketID;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO


-----------------------------------------------STANDARD TICKET---------------------------------------------------------------
CREATE OR ALTER TRIGGER trg_UpdateStandardOrderTotalPrice
ON STANDARD_ORDER_DETAIL
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @SOTicketID CHAR(10);
    DECLARE @TotalPrice BIGINT;

    DECLARE cur CURSOR FOR
    SELECT SOTicketID FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @SOTicketID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @TotalPrice = SUM(Quantity * Price)
        FROM STANDARD_ORDER_DETAIL
        WHERE SOTicketID = @SOTicketID;


        UPDATE ORDER_TICKET
        SET TotalPrice = @TotalPrice * (1 - Discount/100.0)
        WHERE TicketID = @SOTicketID;

        FETCH NEXT FROM cur INTO @SOTicketID;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO

-------------------------BẢNG LƯU TRỮ DANH SÁCH MÓN HÀNG TRONG 1 ORDER------------------------------------------

CREATE TABLE DSDONHANG
(
	DishID int,
	OrderTime datetime,
	Quantity int,
	Price bigint
)

-------------------------TÍNH DOANH THU 1 CHI NHÁNH CỤ THỂ TỪ NGÀY X ĐẾN NGÀY Y------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_GetBranchRevenue 
    @BranchID INT, 
    @startDate DATETIME, 
    @endDate DATETIME
AS
BEGIN
    -- Calculate the total revenue by summing the TotalPrice from the ORDER_TICKET table
    SELECT SUM(ODT.TotalPrice) AS N'Tổng doanh thu trong khoảng thời gian đã chọn'
    FROM ORDER_TICKET ODT
	JOIN BRANCH br ON br.BranchID = ODT.BranchID
	WHERE @BranchID = br.BranchID
	AND ODT.CreatedDate >= @startDate 
	AND ODT.CreatedDate <= @endDate
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

GO
CREATE OR ALTER PROCEDURE usp_GetHighestEmpScoreBranch
    @startDate DATE,
    @endDate DATE
AS
BEGIN
    WITH EmployeeFeedbackScores AS (
        SELECT 
            br.BranchName AS branchName,
            e.EmpFirstName + ' ' + e.EmpLastName AS Employee,
            AVG(fb.FeedbackService) AS AvgFeedbackScore
        FROM BRANCH br LEFT JOIN STATION_EMPLOYEE se ON br.BranchID = se.BranchID
					   JOIN EMPLOYEE e ON e.EmpID = se.EmpID
					   JOIN ORDER_TICKET od ON od.EmpID = se.EmpID
					   JOIN FEEDBACK_TICKET fb ON od.TicketID = fb.TicketID
        WHERE od.CreatedDate BETWEEN @startDate AND @endDate
        GROUP BY br.BranchID, br.BranchName, e.EmpFirstName, e.EmpLastName
    ),

    MaxFeedbackScores AS (
        SELECT 
            MAX(AvgFeedbackScore) AS MaxAvgFeedbackScore
        FROM 
            EmployeeFeedbackScores
    )
    SELECT 
        ef.branchName,
        ef.Employee,
        ef.AvgFeedbackScore AS N'Điểm đánh giá trung bình cao nhất'
    FROM 
        EmployeeFeedbackScores ef
    JOIN 
        MaxFeedbackScores mf
     ON ef.AvgFeedbackScore = mf.MaxAvgFeedbackScore;
END

-- exec usp_GetEmpServiceScore 'EMP02'

--exec usp_GetHighestEmpScoreBranch '2024-1-1', '2024-2-1' 

--------------------------TÌM KIẾM EMPLOYEE ĐANG LÀM TRONG 1 CHI NHÁNH-----------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_SearchEmployee
	@BranchID INT,
	@EmpID CHAR(5)
AS
BEGIN 
	SELECT e.*
	FROM EMPLOYEE e join STATION_EMPLOYEE se on e.EmpID = se.EmpID 
	WHERE e.EmpID = @EmpID and se.BranchID = @BranchID
END

--------------------------HÀM HỖ TRỢ THÊM DÒNG ONLINE ORDER-----------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ThemOnlineOrder
    @TicketID char(10)
AS
BEGIN
    INSERT INTO ONLINE_TICKET (OTicketID)
    VALUES (@TicketID)
END

-------------------------HÀM HỖ TRỢ THÊM DÒNG PRE ORDER------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ThemPreOrder
    @TicketID char(10),
    @BranchID int,
    @NumberOfCustomer int,
    @PreOrderNote nvarchar(100)
AS
BEGIN
    DECLARE @BranchName nvarchar(30)
    DECLARE @AreaName nvarchar(30)

    SELECT @BranchName = BranchName, @AreaName = AreaName
    FROM BRANCH 
    WHERE BranchID = @BranchID

    INSERT INTO PRE_ORDER_TICKET (PTicketID, BranchName, Area, NumberofCustomer,  PreOrderNote)
    VALUES (@TicketID, @BranchName, @AreaName, @NumberOfCustomer, @PreOrderNote)
END


-------------------------HÀM HỖ TRỢ THÊM DÒNG STANDARD ORDER------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ThemStandardOrder
    @TicketID char(10),
    @TableName nvarchar(30),
    @EmpID char(5)
AS
BEGIN
    INSERT INTO STANDARD_ORDER_TICKET (SOTicketID, TableName, SupportEmployee)
    VALUES (@TicketID, @TableName, @EmpID)
END


--------------------------HÀM HỖ TRỢ ADD DỮ LIỆU TỪNG MÓN HÀNG TRONG ORDER VÀO BẢNG CÓ LOẠI ORDER TƯƠNG ỨNG-----------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ADD_DETAIL_ORDER 
    @TicketID char(10)
AS
BEGIN
    DECLARE cur1 CURSOR FOR
        SELECT DishID, OrderTime, Quantity, Price
        FROM DSDONHANG

    DECLARE @DishID int,
            @OrderTime datetime,
            @Quantity int,
            @Price int

	DECLARE @OrderType char(3)

	SELECT @OrderType = TicketType
	FROM ORDER_TICKET 
	WHERE TicketID = @TicketID


    OPEN cur1

    FETCH NEXT FROM cur1 INTO @DishID, @OrderTime, @Quantity, @Price

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
        FETCH NEXT FROM cur1 INTO @DishID, @OrderTime, @Quantity, @Price
    END

    -- Close and deallocate the cursor
    CLOSE cur1
    DEALLOCATE cur1
END

----------------------------HÀM CHÍNH TẠO 1 ORDER TICKET VÀ TẠO ĐƠN HÀNG CÓ LOẠI ORDER TƯƠNG ỨNG INPUT VÀ THÊM DỮ LIỆU MỖI SẢN PHẨM TƯƠNG ỨNG-------------------------------------------

GO
CREATE OR ALTER PROCEDURE usp_ADD_ORDER_TICKET 
	@CCCD char(10),
	@TicketType char(3),
	@BranchID int,
	@EmpID char(5),
	@NumberOfCustomer int,
	@PreOrderNote nvarchar(100),
	@TableName nvarchar(30)
AS
BEGIN
	BEGIN TRY
    IF @TicketType NOT IN ('ONL', 'PRE', 'STD')
    BEGIN
        RAISERROR(N'TicketType không hợp lệ', 16, 1);
        RETURN
    END

	DECLARE @TicketID char(10)
	-- Find a new ticketID
	declare @temp char(10)
	select @temp = cast(max(cast(substring(TicketID, 4, len(TicketID) - 3) as int)) + 1 as char(10))
	from ORDER_TICKET
	if @temp is null
		begin 
			set @TicketID = 'TKT' + '0000001'
		end
	else
		set @TicketID = 'TKT' + REPLICATE('0', 7 - len(@temp)) + @temp


    INSERT INTO ORDER_TICKET (TicketID, TicketType, BranchID, CCCD, EmpID)
    VALUES (@TicketID, @TicketType, @BranchID, @CCCD, @EmpID)
    
    
    IF @TicketType = 'ONL'
    BEGIN
        EXEC usp_ThemOnlineOrder @TicketID
        PRINT(N'Thêm thành công order')
    END

    IF @TicketType = 'PRE'
    BEGIN
        EXEC usp_ThemPreOrder @TicketID, @BranchID, @NumberOfCustomer, @PreOrderNote
        PRINT(N'Thêm thành công order')
    END

    IF @TicketType = 'STD'
    BEGIN
        EXEC usp_ThemStandardOrder @TicketID, @TableName, @EmpID
        PRINT(N'Thêm thành công order')
    END

	EXEC usp_ADD_DETAIL_ORDER @TicketID

	IF 1 = (SELECT isMember FROM CUSTOMER WHERE CCCD = @CCCD)
	BEGIN 
		UPDATE CUSTOMER_MEMBER
		SET MemberCardPoints = MemberCardPoints + (SELECT TotalPrice /100000 FROM ORDER_TICKET WHERE TicketID = @TicketID)
		WHERE MCCCD = @CCCD;
	END

	END TRY
	BEGIN CATCH
		PRINT(N'Lỗi: ' + ERROR_MESSAGE())
	END CATCH

END
GO

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

	DELETE FEEDBACK_TICKET where TicketID = @TicketID

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
        -- Check if the customer exists
        IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @MCCCD)
        BEGIN
            RAISERROR(N'Khách hàng này chưa có thông tin', 16, 1);
            RETURN;
        END

        -- Check if the support employee exists
        IF NOT EXISTS(SELECT 1 FROM EMPLOYEE WHERE EmpID = @SupportEmp)
        BEGIN
            RAISERROR(N'Nhập sai nhân viên tạo member card', 16, 1);
            RETURN;
        END

        -- Insert the new member
        INSERT INTO CUSTOMER_MEMBER (MCCCD, MemberCardNumber, CreatedDate, SupportEmp, MemberCardRank, MemberCardPoints, MemberCardAcquiredRankDate)
        VALUES (@MCCCD, @CardNumber, @CreateDate, @SupportEmp, 'MEMBER', 0, @CreateDate);
        
        -- Optionally, you can return a success message
        SELECT 'Member card created successfully' AS SuccessMessage;

    END TRY
    BEGIN CATCH
        -- Capture the error and return it
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END

-- exec usp_ADD_MEMBER_CUSTOMER '0000000006', 'MC0006', '2024-12-13', '00001'

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

-- exec usp_DELETE_MEMBER_CARD '0000000006'

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
-------- update straight to member ---------
GO
CREATE OR ALTER PROCEDURE usp_ACCUMULATE_POINTS
    @CCCD CHAR(10),
    @STARTDATE DATETIME,
    @ENDDATE DATETIME,
    @POINT INT OUTPUT  -- Add an output parameter
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS(SELECT 1 FROM CUSTOMER WHERE CCCD = @CCCD)
        BEGIN
            RAISERROR(N'Không tồn tại khách hàng này.', 16, 1);
            RETURN;
        END

        SELECT @POINT = ISNULL(SUM(ODT.TotalPrice)/100000, 0)
        FROM ORDER_TICKET ODT
        WHERE 
            ODT.CreatedDate >= @STARTDATE
            AND ODT.CreatedDate <= @ENDDATE
            AND ODT.CCCD = @CCCD

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

	DECLARE @Today DATE SET @Today = CAST(GETDATE() AS DATE)
	DECLARE @NextYearDate datetime
	SET @NextYearDate = DATEADD(year, 1, @GetRankDate)

	DECLARE @aYearPoint int
	EXEC usp_ACCUMULATE_POINTS @CCCD, @Today, @NextYearDate, @aYearPoint;


	IF (@CurrentRank = 'MEMBER')
	BEGIN
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
		IF 50 > @aYearPoint
		BEGIN 
			UPDATE CUSTOMER_MEMBER
			SET MemberCardRank = 'MEMBER', MemberCardAcquiredRankDate = getdate()
			WHERE MCCCD = @CCCD

			RETURN
		END

		ELSE IF 100 <= @aYearPoint
		BEGIN 
			UPDATE CUSTOMER_MEMBER
			SET MemberCardRank = 'GOLD', MemberCardAcquiredRankDate = getdate()
			WHERE MCCCD = @CCCD

			RETURN
		END
	END

	IF(@CurrentRank = 'GOLD')
	BEGIN
		IF 100 > @aYearPoint
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

-- ------------------------- HIỂN THỊ ĐƠN HÀNG ONLINE CỦA 1 KH ------------------------
CREATE OR ALTER PROC  usp_HienThiDonHangOnline
	@CCCD char(10)
AS
BEGIN

SELECT otd.*
FROM ORDER_TICKET o
JOIN ONLINE_TICKET ot 
ON o.TicketID = ot.OTicketID
JOIN ONLINE_TICKET_DETAIL otd
ON ot.OTicketID = otd.OTicketID
WHERE o.CCCD = @CCCD

END
GO

-- ------------------------ HIỂN THỊ THỰC ĐƠN CHI NHÁNH ----------------------------
CREATE OR ALTER PROC usp_ThucDonChiNhanh
	@BranchID int
AS
BEGIN

SELECT d.*
FROM MENU_DETAIL md
JOIN BRANCH b 
ON md.BranchID = b.BranchID
JOIN DISH d
ON md.DishID = d.DishID
WHERE b.BranchID = @BranchID AND md.isServing = 1
	
END
GO

-- ------------------------ HIỂN THỊ COMBO CHI NHÁNH ----------------------------
CREATE OR ALTER PROC usp_HienThiComBoChiNhanh
	@BranchID int
AS
BEGIN

SELECT b.BranchID, b.BranchName, c.ComboID, dc.DishID, d.DishName
FROM BRANCH b
JOIN AREA a
ON a.AreaName = b.AreaName
JOIN DISH_MENU dm
ON a.MenuID = dm.MenuID 
JOIN COMBO c
ON dm.DishID = c.ComboID
JOIN DISH_COMBO dc
ON dc.ComboID = c.ComboID
JOIN DISH d
ON d.DishID = dc.DishID
WHERE b.BranchID = @BranchID AND dm.inMenu = 1;

END

---Updated upstream
select * from ORDER_TICKET
----
go
create or alter proc usp_UpdateOrderTicket
	@TicketID char(10),
	@SupportEmp char(5),
	@CCCD char(10)
as
begin
	begin TRY
	if not exists (select 1 from ORDER_TICKET where ticketID = @ticketID)
	begin
		raiserror(N'Không tồn tại đơn này', 16,1);
		return
	end

	update ORDER_TICKET 
	set EmpID = @SupportEmp
	where ticketID = @TicketID and EmpID is null

	update ORDER_TICKET 
	set CCCD = @CCCD
	where ticketID = @TicketID and CCCD is null
	end TRY
	begin CATCH
	print(N'Lỗi:' + ERROR_MESSAGE());
	return
	end catch
end
