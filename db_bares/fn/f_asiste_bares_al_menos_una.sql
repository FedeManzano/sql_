USE db_bares;

GO
ALTER FUNCTION f_Asiste_Bares_Al_Menos_Una_Gusta()
RETURNS TABLE
AS
	RETURN 
	(
		SELECT fre.DniPersona
		FROM Frecuenta fre
		WHERE fre.NombreBar IN
		(
			SELECT s.NombreBar
			FROM Sirve s
			WHERE s.NombreCerveza IN
			(
				SELECT gus.NombreCerveza
				FROM Gusta gus
				WHERE gus.DniPersona = fre.DniPersona
			)
		)
	)
GO