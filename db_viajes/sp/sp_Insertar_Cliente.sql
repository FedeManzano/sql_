USE db_viajes
 
GO
CREATE PROCEDURE sp_Insertar_Cliente
@CALLE VARCHAR(50),
@LOCALIDAD VARCHAR(100)
AS
BEGIN
	DECLARE @DNI CHAR(8) = dbo.f_Generar_Dni()	

	INSERT INTO Cliente(DniCliente, LocalidadCliente, CalleCliente)
	VALUES
	(@DNI, UPPER(@LOCALIDAD), UPPER(@CALLE))
END
GO