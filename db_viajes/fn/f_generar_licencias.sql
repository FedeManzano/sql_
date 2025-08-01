USE db_viajes

GO
CREATE FUNCTION f_Generador_Licencias ()
RETURNS CHAR(9)
AS
BEGIN
	DECLARE @LIC CHAR(9) =dbo.f_Numeros_Aleatorios(8) +  dbo.f_Letras_Aleatorias(1,1)
	WHILE EXISTS (SELECT * FROM Chofer WHERE NroLicenciaChofer = @LIC)
		SET @LIC = dbo.f_Numeros_Aleatorios(8) +  dbo.f_Letras_Aleatorias(1,1)
	RETURN @LIC
END
GO