USE Nhom3_ADB

-- ===== Replace Membership Card =====
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
			      )p
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
	where MemberCardNumber like 'MC%'
	set @newMemberCardNumber = 'MC' + REPLICATE('0', 4 - len(@temp)) + @temp

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

--exec dbo.usp_ReplaceMemberShipCard '0123456789', '2024-11-12', 'EMP02'


-- ===== Calculate Total Order =====
go
create or alter proc usp_CalculateTotalOrderAmount
	@CCCD char(10)
as
begin 
	select ot.CCCD, sum(td.Price) as TotalPrice
	from ORDER_TICKET ot 
	join (
			select potd.PTicketID as TicketID, potd.quantity * potd.price as Price
			from PRE_ORDER_TICKET_DETAIL potd
			union all
			select sod.SOTicketID as TicketID, sod.quantity * sod.price as Price
			from STANDARD_ORDER_DETAIL sod
			union all
			select otd.OTicketID as TicketID, otd.quantity * otd.price as Price
			from ONLINE_TICKET_DETAIL otd
	) td
	on ot.TicketID = td.TicketID
	where ot.CCCD = @CCCD
	group by ot.CCCD
end

--go
--exec dbo.usp_CalculateTotalOrderAmount '0123456789'
go