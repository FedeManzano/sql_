USE db_viajes;

GO
CREATE FUNCTION f_Generar_Dni()
RETURNS CHAR(8)
AS
BEGIN
	DECLARE @DNI CHAR(8) = dbo.f_Numeros_Aleatorios(8)
	WHILE EXISTS (SELECT * FROM Cliente WHERE DniCliente = @DNI)
		SET @DNI = dbo.f_Numeros_Aleatorios(8)
	RETURN @DNI
END