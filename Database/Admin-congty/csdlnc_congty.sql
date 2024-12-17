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

		INSERT INTO STATION_EMPLOYEE VALUES(@toBranchID, @EmpID, @transferPosition);	
		INSERT INTO WORK_HISTORY VALUES(@EmpID, getdate(), NULL, @toBranchID);
	END TRY
	BEGIN CATCH
		PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END



-----------------------------LẤY DOANH THU CỦA MỖI MÓN ĂN ĐÃ BÁN ĐƯỢC TỪ NGÀY X TỚI Y CỦA 1 CHI NHÁNH, XUẤT RA BẢNG VỚI MỖI LOẠI ĐƠN HÀNG-----------------------
GO
CREATE OR ALTER PROCEDURE usp_GetDishRevenue
	@BranchID int,
	@startDate datetime,
	@endDate datetime
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM BRANCH WHERE BranchID = @BranchID)
		BEGIN
			RAISERROR(N'Không tồn tại chi nhánh đó trong hệ thống cửa hàng', 16, 1);
			RETURN
		END

		SELECT otd.DishID as N'Mã Món', d.DishName as N'Tên Món', sum(otd.Price * otd.Quantity) as N'Tổng doanh thu món trong đơn online-order'
		FROM (SELECT * FROM ORDER_TICKET WHERE BranchID = @BranchID) as SubTable join ONLINE_TICKET_DETAIL otd on SubTable.TicketID = otd.OTicketID join Dish d on d.DishID = otd.DishID join ONLINE_TICKET olt on olt.OTicketID = SubTable.TicketID
		GROUP BY otd.DishID, d.DishName, olt.DeliveryDate
		HAVING olt.DeliveryDate BETWEEN @startDate AND @endDate
		ORDER BY sum(otd.Price * otd.Quantity) DESC

		SELECT pot.DishID as N'Mã Món', d.DishName as N'Tên Món', sum(pot.Price * pot.Quantity) as N'Tổng doanh thu món trong đơn pre-order'
		FROM (SELECT * FROM ORDER_TICKET WHERE BranchID = @BranchID) as SubTable join PRE_ORDER_TICKET_DETAIL pot on SubTable.TicketID = pot.PTicketID join Dish d on d.DishID = pot.DishID join PRE_ORDER_TICKET prt on prt.PTicketID = SubTable.TicketID
		GROUP BY pot.DishID, d.DishName, prt.PreOrderArrivalTime
		HAVING prt.PreOrderArrivalTime BETWEEN @startDate AND @endDate
		ORDER BY sum(pot.Price * pot.Quantity) DESC

		SELECT sod.DishID as N'Mã Món', d.DishName as N'Tên Món', sum(sod.Price * sod.Quantity) as N'Tổng doanh thu món trong đơn standard-order'
		FROM (SELECT * FROM ORDER_TICKET WHERE BranchID = @BranchID) as SubTable join STANDARD_ORDER_DETAIL sod on SubTable.TicketID = sod.SOTicketID join Dish d on d.DishID = sod.DishID join STANDARD_ORDER_TICKET sot on sot.SOTicketID = SubTable.TicketID
		GROUP BY sod.DishID, d.DishName, sot.CreatedDate
		HAVING sot.CreatedDate BETWEEN @startDate AND @endDate
		ORDER BY sum(sod.Price * sod.Quantity) DESC

	END TRY
	BEGIN CATCH
		PRINT(N'Lỗi:' + ERROR_MESSAGE());
	END CATCH
END

-- exec usp_GetDishRevenue 1, '1900-01-01', '2025-1-1'


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
	@Salary int
AS
BEGIN
	BEGIN TRY
		DECLARE @EmpID char(5), @temp char(5)

		select @temp = cast(max(cast(EmpID as int)) + 1 as char(5))
		from EMPLOYEE
		set @EmpID = replicate('0', 5 - len(@temp)) + @temp

		INSERT INTO EMPLOYEE VALUES(@EmpID, @EmpFirstName, @EmpLastName, @EmpDOB, @EmpGender, @Salary, NULL)
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