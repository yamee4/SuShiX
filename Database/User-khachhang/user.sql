USE Nhom3_ADB
GO

-- ===== THÊM FEEDBACK TỪ KHÁCH HÀNG =====
create or alter proc usp_AddFeedbackDetail 
	@TicketID char(10),
	@FeedbackService int,
	@FeedbackFoodQuality int,
	@FeedbackPrice int,
	@FeedbackLocation int,
	@FeedbackNote nvarchar(100)
as
begin
	declare @FeedbackTotalScore int
	set @FeedbackTotalScore = 0

	if not exists (
					select 1
					from ORDER_TICKET
					where TicketID = @TicketID
				  )
		begin
			;throw 51002, N'Không tồn tại vé đặt này', 1
			return
		end

	if (
		(@FeedbackFoodQuality < 0 or @FeedbackFoodQuality > 10)
		or (@FeedbackLocation < 0 or @FeedbackLocation > 10)
		or (@FeedbackPrice < 0 or @FeedbackPrice > 10)
		or (@FeedbackService < 0 or @FeedbackService > 10)
		)
		begin
			;throw 51003, N'Số điểm phải từ 0 - 10.', 1
			return
		end
	
	insert into FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackFoodQuality, FeedbackLocation, FeedbackNote, FeedbackPrice, FeedbackService)
	values (@TicketID, @FeedbackTotalScore, @FeedbackFoodQuality, @FeedbackLocation, @FeedbackNote, @FeedbackPrice, @FeedbackService)
end
go