USE db_viajes

GO
ALTER FUNCTION f_Generador_Patentes ()
RETURNS CHAR(7)
AS
BEGIN
	DECLARE @PATENTE CHAR(7) = dbo.f_Letras_Aleatorias(3,1) + ' ' + dbo.f_Numeros_Aleatorios(3)
	WHILE EXISTS (SELECT * FROM Automovil WHERE MatriculaAutomovil = @PATENTE)
		SET @PATENTE = dbo.f_Letras_Aleatorias(3,1) + ' ' + dbo.f_Numeros_Aleatorios(3)
	RETURN @PATENTE
END
GO