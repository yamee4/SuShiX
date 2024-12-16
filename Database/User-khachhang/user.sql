USE Nhom3_ADB
GO

-- ===== KHÁCH HÀNG =====
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

	insert into FEEDBACK_TICKET (TicketID, FeedbackTotalScore, FeedbackFoodQuality, FeedbackLocation, FeedbackNote, FeedbackPrice, FeedbackService)
	values (@TicketID, @FeedbackTotalScore, @FeedbackFoodQuality, @FeedbackLocation, @FeedbackNote, @FeedbackPrice, @FeedbackService)
end
go