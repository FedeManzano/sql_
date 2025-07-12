USE db_stock_productos

GO
ALTER PROCEDURE sp_Insertar_Stock
@FECHA DATE,
@COD_PROD INT,
@CANT INT
AS
BEGIN

	DECLARE @NRO INT = (SELECT COUNT(*) FROM Stock ) + 1

	INSERT INTO Stock(NroStock, CodProd, Fecha, Cantidad)
	VALUES
	(@NRO, @COD_PROD, @FECHA, @CANT)
	
END
GO