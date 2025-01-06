use Nhom3_ADB
go

--TV1: Thêm một đơn hàng mới cho khách hàng
SET STATISTICS TIME ON;
delete from DSDONHANG
insert into DSDONHANG values 
(1, GETDATE(), 1, 50000),
(2, '2025/1/2', 1, 60000)
exec dbo.usp_ADD_ORDER_TICKET 
	@CCCD = '0000000001',
	@TicketType = 'STD',
	@BranchID = 1,
	@EmpID = '00001',
	@NumberOfCustomer = 3,
	@PreOrderNote = N'Nothing',
	@TableName = N'Table 1'
SET STATISTICS TIME OFF;
go

SELECT 
    name AS ConstraintName,
    type_desc AS ConstraintType,
    object_name(parent_object_id) AS TableName
FROM 
    sys.objects
WHERE 
    type = 'PK' AND object_name(parent_object_id) = 'ORDER_TICKET';


select *
from STANDARD_ORDER_TICKET
where SOTicketID = 'TKT0100003'

--TV2: Thêm mới một nhân viên và chi nhánh hiện tại người nhân viên đang hoạt động
SET STATISTICS TIME ON;
exec dbo.usp_ADD_EMPLOYEE 
	@EmpFirstName = N'Nguyễn Chí',
	@EmpLastName = N'Huy',
	@EmpDOB = '1999/1/1',
	@EmpGender = 'Nam',
	@Salary = 5000000,
	@StationName = 'Cashier',
	@BranchID = 1
SET STATISTICS TIME OFF;
go

--select *
--from EMPLOYEE
--where EmpLastName = N'Tèo'


--TV3: Xóa một hóa đơn khỏi cơ sở dữ liệu
SET STATISTICS TIME ON;
exec dbo.usp_XoaOrderTicket 
	'TKT0100003'
SET STATISTICS TIME OFF;
go


--TV4: Cập nhật thông tin của một nhân viên khi chuyển đến chi nhánh khác làm việc
SET STATISTICS TIME ON;
exec usp_TransferEmployee
	@EmpID = '0000000001',
	@toBranchID = 2,
	@transferPosition = 'Host/Hostess'
SET STATISTICS TIME OFF;
go

--TV5: Lấy doanh thu các hoá đơn của 1 chi nhánh cụ thể theo tuần, tháng, quý, năm.
SET STATISTICS TIME ON;
exec usp_GetBranchRevenue 
    @BranchID = 1, 
    @startDate = '2021-12-01 00:00:00.000',
    @endDate = '2022-12-01 00:00:00.000'
SET STATISTICS TIME OFF;
go

-- ADD INDEX
CREATE NONCLUSTERED INDEX IX_ORDER_TICKET_BranchID_CreatedDate
ON Order_Ticket ([BranchID], [CreatedDate], [TotalPrice]);

--drop index IX_ORDER_TICKET_BranchID_CreatedDate on Order_Ticket


--TV6: Lấy danh sách các phản hồi từ khách hàng và điểm đánh giá trung bình của mỗi nhân viên. 
-- Sắp xếp điểm của nhân viên từng chi nhánh và liệt kê ra các nhân viên có số điểm phục vụ cao nhất theo tuần, tháng, quý, năm 
SET STATISTICS TIME ON;
exec usp_GetHighestEmpScoreBranch
    @startDate = '2021-12-01 00:00:00.000',
    @endDate = '2022-12-01 00:00:00.000'
SET STATISTICS TIME OFF;
go

-- Optional
CREATE NONCLUSTERED INDEX IDX_ORDER_TICKET_CreateDate
ON Order_Ticket (CreatedDate)
go

drop index IDX_ORDER_TICKET_CreateDate
ON Order_Ticket
go