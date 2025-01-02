USE Nhom3_ADB

-- ===== TẠO THẺ KH MỚI KHI KH LÀM MẤT =====
go
create or alter proc  usp_ReplaceMemberShipCard
	 @mcccd char(10),
	 @issueDate date,
	 @employeeID char(5)
as
begin
	if not exists (
					select 1
					from CUSTOMER_MEMBER
					where MCCCD = @mcccd
			      )
		begin
			;throw 51000, N'Khách hàng này chưa tạo thẻ', 1
			return
		end

	declare @MemberCardRank char(6), @MemberCardPoints int, @MemberCardAcquiredRankDate date
	select @MemberCardRank = MemberCardRank, @MemberCardPoints = MemberCardPoints, @MemberCardAcquiredRankDate = MemberCardAcquiredRankDate
	from CUSTOMER_MEMBER
	where MCCCD = @mcccd

	delete from CUSTOMER_MEMBER
	where MCCCD = @mcccd
	
	
	-- Find a new membercard
	declare @newMemberCardNumber char(10), @temp char(10)
	select @temp = cast(max(cast(substring(MemberCardNumber, 3, len(membercardnumber) - 2) as int)) + 1 as char(10))
	from CUSTOMER_MEMBER
	set @newMemberCardNumber = 'MC' + REPLICATE('0', 5 - len(@temp)) + @temp

	print(@temp)
	print(@temp)

	print(N'Thành công')
	print(N'Mã nhân viên mới: ' + @newMemberCardNumber)

	insert into CUSTOMER_MEMBER
	(
	MCCCD,
	MemberCardNumber,
	CreatedDate,
	SupportEmp,
	MemberCardRank,
	MemberCardPoints,
	MemberCardAcquiredRankDate
	)
	values 
	(
		@mcccd,
		@newMemberCardNumber,
		@issueDate,
		@employeeID,
		@MemberCardRank,
		@MemberCardPoints,
		@MemberCardAcquiredRankDate
	)
end
go