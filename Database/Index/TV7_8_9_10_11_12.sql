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

DROP INDEX idx_branch_areaname ON BRANCH;
DROP INDEX idx_area_menuid ON AREA;
DROP INDEX idx_dish_menu_inmenu ON DISH_MENU;