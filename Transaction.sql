CREATE PROCEDURE SiparisSil(@siparisID int) AS
DECLARE @TranCounter INT = @@TRANCOUNT
DECLARE @Miktar INT
IF @TranCounter>0
SAVE TRANSACTION kayit_noktasi
BEGIN TRANSACTION
BEGIN TRY
IF EXISTS(SELECT * FROM Orders Where OrderID=@siparisID) AND @TranCounter=0
BEGIN
UPDATE Products  SET UnitsInStock+=od.Quantity from [Order Details] od
where Products.ProductID=od.ProductID AND od.OrderID=@siparisID
Delete From [Order Details] Where OrderID=@siparisID
Delete from Orders where OrderID=@siparisID
COMMIT TRANSACTION
END
ELSE
BEGIN
ROLLBACK TRANSACTION
END
END TRY
BEGIN CATCH
IF @TranCounter=0
ROLLBACK TRAN
ELSE
IF XACT_STATE()<>-1
ROLLBACK TRANSACTION kayit_noktasi
DECLARE @ErrorMessage NVARCHAR(4000)=ERROR_MESSAGE()
DECLARE @ErrorSeverity INT=ERROR_SEVERITY()
DECLARE @ErrorState INT=ERROR_STATE()
RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState)
END CATCH

Exec SiparisSil 10247