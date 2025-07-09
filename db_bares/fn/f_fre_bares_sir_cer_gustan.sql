USE db_bares;

GO
CREATE FUNCTION f_Todas_Cervezas_Que_Gustan_Bar()
RETURNS TABLE
AS
	RETURN
	(
		SELECT *
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
			GROUP BY s.NombreBar
			HAVING COUNT(s.NombreCerveza) >= 
			(
				SELECT COUNT(g.NombreCerveza)
				FROM Gusta g
				WHERE g.DniPersona = fre.DniPersona
			)
		)
	)
GO