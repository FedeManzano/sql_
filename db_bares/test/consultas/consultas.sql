USE db_bares;

--1 -  Asisten a bares que sirven al menos una cerveza que les guste
SELECT DniPersona FROM dbo.f_Asiste_Bares_Al_Menos_Una_Gusta()


-- 2. No frecuentan ningún bar que sirva alguna cerveza que les guste.
SELECT fre.DniPersona
FROM Frecuenta fre
WHERE fre.DniPersona NOT IN
(
	SELECT DniPersona FROM dbo.f_Asiste_Bares_Al_Menos_Una_Gusta()
)

-- 3. Frecuentan solamente los bares que sirven todas las cervezas que les gustan.
SELECT * FROM Persona p
WHERE p.Dni IN
(
	SELECT DISTINCT DniPersona FROM dbo.f_Todas_Cervezas_Que_Gustan_Bar()
)

-- 4. Frecuentan solamente los bares que no sirven ninguna de las cervezas que no les
-- gusta.
SELECT *
FROM Frecuenta fre
WHERE fre.NombreBar NOT IN
(
	SELECT s.NombreBar
	FROM Sirve s
	WHERE s.NombreCerveza NOT IN
	(
		SELECT gus.NombreCerveza
		FROM Gusta gus
		WHERE gus.DniPersona = fre.DniPersona
	)
	GROUP BY s.NombreBar
)

