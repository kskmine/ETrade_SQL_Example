SELECT P.ProductID,P.ProductName, SUM(OD.UnitPrice*OD.Quantity) AS KAZANC FROM Products P
INNER JOIN [Order Details] OD ON OD.ProductID=P.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY KAZANC DESC 

-----------------------------------------------------------------------------

CREATE PROC YilaGoreSatisss
@yil int 
AS
SELECT * FROM [Summary of Sales by Year]
WHERE YEAR(ShippedDate)=@yil

DECLARE @suanyil int                         ----- declare set ve exec aynı anda execute et hata alırsın
SET @suanyil=1997 --YEAR(GETDATE())

EXEC YilaGoreSatisss @yil=@suanyil

----------------------------------------------------------------

CREATE PROC UrunListelee
@parametre int 
AS
SELECT * FROM Products WHERE @parametre> UnitsInStock 

EXEC UrunListelee 5

-----------------------------------------------------------------------

CREATE FUNCTION KDVHesapla
(
    @deger int
)
RETURNS int 
AS
BEGIN

DECLARE @KDV int
SET @KDV=@deger*1.8
RETURN @KDV

END

SELECT ProductName,UnitPrice , dbo.KDVHesapla(UnitPrice) AS KDV FROM Products

-------------------------------------------------------------------------------------------

CREATE FUNCTION Fonksiyon
(
    @deger int
)
RETURNS varchar(20) 
AS

BEGIN
DECLARE @Sonuc varchar(20)
IF @deger < 20
BEGIN
SET @Sonuc = 'stok az'
END
IF @deger > 20
BEGIN
SET @Sonuc = 'stok çok'
END
RETURN @Sonuc
END

CREATE PROC StokDurumu
AS
BEGIN TRY
SELECT ProductID,ProductName,dbo.Fonksiyon(UnitsInStock) AS Stok 
FROM Products
END TRY
BEGIN CATCH
RAISERROR('HATAAAAAA',1,1)
END CATCH

 EXEC StokDurumu

 ----------------------------------------------------------------------------------------

 
