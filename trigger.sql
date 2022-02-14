create proc HesapAc (@TCNo nchar(11), @Name varchar(50), @Para money)
as
declare @TranCounter int = @@trancount
if @TranCounter>0
save transaction kayit_noktasi 
begin try
begin tran
update dbo.Hesap set Hesap -= 10 where ID=ID
insert into dbo.Hesap(TCKimlikNo,Ad,Hesap) VALUES (@TCNo,@Name,@Para)
update dbo.Hesap set Hesap += 10 *(select COUNT(Hesap)-1 from Hesap) where TCKimlikNo=@TCNo
COMMIT TRAN
END TRY
BEGIN CATCH
if @TranCounter=0
ROLLBACK TRAN
else 
if XACT_STATE()<>-1
rollback transaction kayit_noktasi
declare @ErrorMesSage
nvarchar(4000)= ERROR_MESSAGE()
DECLARE @ErrorSeverity int = ERROR_SEVERITY()
DECLARE @ErrorState int =  Error_State()
Raiserror(@ErrorMessage,@ErrorSeverity,@ErrorState)

PRINT 'Beklenmedik Bir Hata Olustu'
END CATCH

EXEC HesapAc '11111111114', 'Dennis', 0

EXEC HesapAc '11111111115', 'Denns', 0

SELECT *FROM Hesap

--------------------------------------------------------------------

create trigger trg_listele on Hesap
after insert
as
begin
select * from Hesap
end

exec HesapAc '11111111116', 'Franco', 0

--------------------------------
create trigger trg_altLimit on hesap
for insert
as
if exists (select* from dbo.Hesap where Hesap=0)
begin
raiserror ('hesap 0dan fazla olmali',1,1)
rollback transaction
end

exec HesapAc '11111111117', 'micheal',1