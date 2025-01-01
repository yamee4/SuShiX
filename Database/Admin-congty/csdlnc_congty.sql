USE Nhom3_ADB

---------------------CHUYỂN CƠ SỞ LÀM VIỆC CHO NHÂN VIÊN----------------------
GO
CREATE OR ALTER PROCEDURE usp_TransferEmployee
	@EmpID char(5),
	@toBranchID int,
	@transferPosition nvarchar(20)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE EmpID = @EmpID)
		BEGIN
			RAISERROR(N'Không tồn tại nhân viên đó trong hệ thống cửa hàng', 16, 1);
			RETURN
		END

		IF NOT EXISTS (SELECT 1 FROM BRANCH WHERE BranchID = @toBranchID)
		BEGIN
			RAISERROR(N'Không tồn tại chi nhánh đó trong hệ thống cửa hàng', 16, 1);
			RETURN
		END

		DECLARE @oldBranch int;
		select @oldBranch = BranchID
		from WORK_HISTORY
		where EmpID = @EmpID


		UPDATE WORK_HISTORY set EndDate = GETDATE() WHERE EmpID = @EmpID and BranchID = @oldBranch
		UPDATE STATION_EMPLOYEE set BranchID = @toBranchID where EmpID = @EmpID
		INSERT INTO WORK_HISTORY VALUES (@EmpID, GETDATE(), NULL, @toBranchID)
	END TRY
	BEGIN CATCH
		PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END



---------LẤY DOANH THU CỦA MỖI MÓN ĂN ĐÃ BÁN ĐƯỢC TỪ NGÀY X TỚI Y CỦA 1 CHI NHÁNH, XUẤT RA BẢNG VỚI MỖI LOẠI ĐƠN HÀNG-----------
--------------------------------------------------------STANDARD ORDER----------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_CalculateStandardOrderRevenue
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        sod.DishID, 
        d.DishName,
        SUM(sod.Quantity * sod.Price) AS TotalRevenue,
        SUM(sod.Quantity) AS TotalQuantity
    FROM 
        STANDARD_ORDER_DETAIL sod
    JOIN 
        ORDER_TICKET ot ON sod.SOTicketID = ot.TicketID
    JOIN
        DISH d ON sod.DishID = d.DishID
    WHERE 
        ot.CreatedDate BETWEEN @StartDate AND @EndDate
    GROUP BY 
        sod.DishID, d.DishName
    ORDER BY 
        TotalRevenue DESC;
END

--------------------------------------------------------PRE ORDER----------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_CalculatePreOrderRevenue
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        pod.DishID, 
        d.DishName,
        SUM(pod.Quantity * pod.Price) AS TotalRevenue,
        SUM(pod.Quantity) AS TotalQuantity
    FROM 
        PRE_ORDER_TICKET_DETAIL pod
    JOIN 
        ORDER_TICKET ot ON pod.PTicketID = ot.TicketID
    JOIN
        DISH d ON pod.DishID = d.DishID
    WHERE 
        ot.CreatedDate BETWEEN @StartDate AND @EndDate
    GROUP BY 
        pod.DishID, d.DishName
    ORDER BY 
        TotalRevenue DESC;
END

--------------------------------------------------------ONLINE ORDER----------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE usp_CalculateOnlineOrderRevenue
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        od.DishID, 
        d.DishName,
        SUM(od.Quantity * od.Price) AS TotalRevenue,
        SUM(od.Quantity) AS TotalQuantity
    FROM 
        ONLINE_TICKET_DETAIL od
    JOIN 
        ORDER_TICKET ot ON od.OTicketID = ot.TicketID
    JOIN
        DISH d ON od.DishID = d.DishID
    WHERE 
        ot.CreatedDate BETWEEN @StartDate AND @EndDate
    GROUP BY 
        od.DishID, d.DishName
    ORDER BY 
        TotalRevenue DESC;
END
GO

----------------------LẤY TỔNG DOANH THU CỦA CÔNG TY(aka TẤT CẢ BRANCH)-------------------------
CREATE OR ALTER PROCEDURE usp_GetCompanyRevenue 
    @startDate DATETIME, 
    @endDate DATETIME
AS
BEGIN
    SELECT SUM(ODT.TotalPrice) AS N'Tổng doanh thu trong khoảng thời gian đã chọn'
    FROM ORDER_TICKET ODT
	WHERE ODT.CreatedDate >= @startDate 
	AND ODT.CreatedDate <= @endDate
END

--exec usp_GetCompanyRevenue '1900-01-01', '2023-12-31'

-----------------------------------TẠO EMPLOYEE--------------------------------
GO
CREATE OR ALTER PROCEDURE usp_ADD_EMPLOYEE
	@EmpFirstName nvarchar(20),
	@EmpLastName nvarchar(20),
	@EmpDOB datetime,
	@EmpGender nvarchar(3),
	@Salary int,
	@StationName nvarchar(20),
	@BranchID int
AS
BEGIN
	BEGIN TRY
		DECLARE @EmpID char(5), @temp char(5)

		select @temp = cast(max(cast(EmpID as int)) + 1 as char(5))
		from EMPLOYEE
		if @temp is null 
			begin
				set @EmpID = '00001'
			end
		else 
			set @EmpID = replicate('0', 5 - len(@temp)) + @temp

		INSERT INTO EMPLOYEE VALUES(@EmpID, @EmpFirstName, @EmpLastName, @EmpDOB, @EmpGender, @Salary, NULL)
		INSERT INTO WORK_HISTORY VALUES (@EmpID, GETDATE(), NULL, @BranchID)
		INSERT INTO STATION_EMPLOYEE VALUES (@BranchID, @EmpID, @StationName)
	END TRY

	BEGIN CATCH
		PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

------------------------------UPDATE THÔNG TIN EMPLOYEE, UPDATE BRANCH MANAGER CŨNG VỚI HÀM NÀY---------------
GO
CREATE OR ALTER PROCEDURE usp_Update_Employee
	@EmpID char(5),
	@EmpFirstName nvarchar(20),
	@EmpLastName nvarchar(20),
	@EmpDOB datetime,
	@EmpGender nvarchar(3),
	@Salary int,
	@BranchManager int
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE EmpID = @EmpID)
		BEGIN
			RAISERROR(N'Không tồn tại nhân viên này', 16,1);
			RETURN;
		END

		IF(@BranchManager IS NOT NULL)
		BEGIN
		IF NOT EXISTS (SELECT 1 FROM BRANCH WHERE BranchID = @BranchManager)
		BEGIN
			RAISERROR(N'Không tồn tại chi nhánh này', 16,1);
			RETURN;
		END

		IF EXISTS (SELECT 1 FROM EMPLOYEE WHERE BranchManager = @BranchManager)
		BEGIN
			RAISERROR(N'Đã có nhân viên quản lý chi nhánh này rồi', 16,1);
			RETURN;
		END
		END

		UPDATE EMPLOYEE
		SET EmpFirstName = @EmpFirstName, EmpLastName = @EmpLastName, EmpBirthDate = @EmpDOB, EmpGender = @EmpGender, Salary = @Salary, BranchManager = @BranchManager
		WHERE EmpID = @EmpID

		END TRY

		BEGIN CATCH
			PRINT(N'Lỗi:' + ERROR_MESSAGE());
		END CATCH
END

---------------------------------XÓA EMPLOYEE VÀ CÁC DỮ LIỆU LIÊN QUAN ĐẾN EMPLOYEE ĐÓ Ở BẢNG KHÁC------------------
GO
CREATE OR ALTER PROCEDURE usp_Delete_Employee
	@EmpID char(5)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM EMPLOYEE WHERE EmpID = @EmpID)
		BEGIN
			RAISERROR(N'Không tồn tại nhân viên này', 16,1);
			RETURN;
		END

		UPDATE STANDARD_ORDER_TICKET
		SET SupportEmployee = NULL
		WHERE SupportEmployee = @EmpID

		UPDATE CUSTOMER_MEMBER
		SET SupportEmp = NULL
		WHERE SupportEmp = @EmpID

		UPDATE ORDER_TICKET 
		SET EmpID = NULL
		WHERE EmpID = @EmpID

		UPDATE STATION_EMPLOYEE 
		SET EmpID = NULL
		WHERE EmpID = @EmpID

		UPDATE WORK_HISTORY
		SET EmpID = NULL
		WHERE EmpID = @EmpID

		DELETE EMPLOYEE
		WHERE EmpID = @EmpID
	END TRY
	
	BEGIN CATCH
		PRINT(N'Lỗi' + ERROR_MESSAGE());
	END CATCH
END

--exec usp_ADD_EMPLOYEE 'EMP99', 'a', 'a', '1-1-1', 'Nam', 100000
--exec usp_Update_Employee 'EMP99', 'b', 'a', '1-1-1', 'Nam', 100000, NULL
--exec usp_Delete_Employee 'EMP99'