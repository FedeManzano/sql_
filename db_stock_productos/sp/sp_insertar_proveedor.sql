USE db_stock_productos;


GO
CREATE PROCEDURE sp_Insertar_Proveedor
@RAZ VARCHAR(50),
@FECHAINI DATE
AS
BEGIN
	DECLARE @CODPROV INT = (SELECT COUNT(*) FROM Proveedor) + 1
	INSERT INTO Proveedor(CodProv, RazonSocial, FechaInicio)
	VALUES (@CODPROV, @RAZ, @FECHAINI)
END
GO