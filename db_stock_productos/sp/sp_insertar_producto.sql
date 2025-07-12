USE db_stock_productos;

GO
ALTER PROCEDURE sp_Insertar_Producto
@DESC VARCHAR(100),
@COD_PROV INT,
@STOCK_ACTUAL INT
AS
BEGIN

	IF NOT EXISTS (SELECT * FROM Proveedor WHERE CodProv = @COD_PROV)
	BEGIN
		PRINT('Nro Proveedor no existe')
		RETURN
	END

	DECLARE @COD_PRD INT = (SELECT COUNT(1) FROM Producto) + 1
	DECLARE @NRO INT = (SELECT COUNT(1) FROM Stock) + 1
	DECLARE @F DATE = GETDATE()
	INSERT INTO Producto(CodProd, CodProv, Descripcion, StockActual)
	VALUES
	(@COD_PRD, @COD_PROV, @DESC, @STOCK_ACTUAL)
	EXEC sp_Insertar_Stock @F, @COD_PRD, @STOCK_ACTUAL
END
GO