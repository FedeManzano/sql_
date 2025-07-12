USE db_video_club;


-- 1. Listar los clientes que no hayan reportado pr�stamos del rubro �Policial�
GO
ALTER FUNCTION f_Clientes_No_Genero (@GENERO_NOMBRE VARCHAR(20))
RETURNS TABLE
AS
	RETURN
	(
		SELECT DISTINCT alq.CodCli
		FROM Alquiler alq
		WHERE alq.CodPel NOT IN
		(
			SELECT pel.CodPel 
			FROM Pelicula pel
			WHERE pel.IdGenero IN
			(
				SELECT gen.IdGenero
				FROM Genero gen
				WHERE UPPER(gen.NombreGenero) LIKE UPPER('%' + @GENERO_NOMBRE + '%')
			)
		)
	)
GO

SELECT * FROM dbo.f_Clientes_No_Genero('POLICIAL')
SELECT * FROM dbo.f_Clientes_No_Genero('SUPER HEROES')
SELECT * FROM dbo.f_Clientes_No_Genero('ACCION')
SELECT * FROM dbo.f_Clientes_No_Genero('DRAMA')
SELECT * FROM Cliente


-- 2. Listar las pel�culas de mayor duraci�n que alguna vez fueron prestadas.

GO
CREATE FUNCTION f_Duracion_Max_Pel_Alq() 
RETURNS TABLE
AS
	RETURN
	(
		SELECT *
		FROM Pelicula pel
		WHERE pel.Duracion >=
		(
			SELECT MAX(pel.Duracion)
			FROM Pelicula pel
			WHERE pel.CodPel IN 
			(
				SELECT alq.CodPel
				FROM Alquiler alq

			)
		)	
	)
GO

SELECT * FROM dbo.f_Duracion_Max_Pel_Alq()


-- 3 - Listar los clientes que tienen m�s de un pr�stamo sobre la misma pel�cula (listar
-- Cliente, Pel�cula y cantidad de pr�stamos).
GO
CREATE FUNCTION f_Clientes_Aquiler_Misma_Pelicula()
RETURNS TABLE
AS
	RETURN
	(
		SELECT alq.CodCli, alq.CodPel, COUNT(alq.CodPel) CANTIDAD
		FROM Alquiler alq
		GROUP BY alq.CodCli, alq.CodPel
		HAVING COUNT(alq.CodPel) >= 
		(
			SELECT MAX(CLIENTE_MISMA_PELICULA.CANTIDAD_MISMA_PELICULA)
			FROM
			(
				SELECT alq.CodCli, alq.CodPel, COUNT(alq.CodPel) AS CANTIDAD_MISMA_PELICULA
				FROM Alquiler alq
				GROUP BY alq.CodCli, alq.CodPel
			) AS CLIENTE_MISMA_PELICULA
		)	
	)
GO

SELECT * FROM dbo.f_Clientes_Aquiler_Misma_Pelicula()


-- 4. Listar los clientes que han realizado pr�stamos del t�tulo �Rey Le�n� y �Terminador
-- 3� (Ambos).

GO
CREATE FUNCTION f_Alquilaron_Las_Peliculas(@PEL1 VARCHAR(50), @PEL2 VARCHAR(50))
RETURNS TABLE
AS
	RETURN
	(
		SELECT alq.CodCli
		FROM Alquiler alq
		WHERE alq.CodPel IN 
		(
			SELECT pel.CodPel
			FROM Pelicula pel
			WHERE pel.Titulo = @PEL1
		)
		INTERSECT
		SELECT alq.CodCli
		FROM Alquiler alq
		WHERE alq.CodPel IN 
		(
			SELECT pel.CodPel
			FROM Pelicula pel
			WHERE pel.Titulo = @PEL2
		)
	)
GO

SELECT * FROM dbo.f_Alquilaron_Las_Peliculas('EL CONJUTO I', 'EL CONJUTO II')

-- 5. Listar las pel�culas m�s vistas en cada mes (Mes, Pel�cula, Cantidad de Alquileres).
SELECT MES, alq.CodPel, MAX_CANT
FROM
(
	SELECT MES ,MAX(CANT) MAX_CANT
	FROM 
	(
		SELECT MONTH(alq.FechaAlq) MES,alq.CodPel PELICULA, COUNT(alq.IdAlquiler) CANT 
		FROM Alquiler alq
		GROUP BY MONTH(alq.FechaAlq), alq.CodPel
	) AS MAS_VISTAS
	GROUP BY MES
) AS VISTAS_MAXIMA INNER JOIN Alquiler alq ON MONTH(alq.FechaAlq) = MES
GROUP BY MES, alq.CodPel, MAX_CANT
HAVING MAX_CANT = ALL
(
	SELECT COUNT(a.IdAlquiler) 
	FROM Alquiler a
	WHERE a.CodPel = alq.CodPel
)

GO
CREATE VIEW Catidad_Vistas_X_Mes_Pelicula
AS
	SELECT MONTH(alq.FechaAlq) MES,alq.CodPel PELICULA, COUNT(alq.IdAlquiler) CANT 
	FROM Alquiler alq
	GROUP BY MONTH(alq.FechaAlq), alq.CodPel	

GO
CREATE VIEW Mas_Vistas_Por_Mes
AS
	SELECT CANT_VISTAS.MES ,MAX(CANT_VISTAS.CANT) MAX_CANT
	FROM Catidad_Vistas_X_Mes_Pelicula AS CANT_VISTAS
	GROUP BY CANT_VISTAS.MES

GO
CREATE VIEW MES_PELICULA_CANTIDAD_MAYOR
AS
	SELECT MV.MES, alq.CodPel, MV.MAX_CANT
	FROM Mas_Vistas_Por_Mes MV INNER JOIN Alquiler alq ON MONTH(alq.FechaAlq) = MV.MES
	GROUP BY MV.MES, alq.CodPel, MV.MAX_CANT
	HAVING MV.MAX_CANT <= ALL
	(
		SELECT COUNT(a.IdAlquiler) 
		FROM Alquiler a
		WHERE a.CodPel = alq.CodPel
	)
GO

SELECT MV.MES, pel.Titulo, MV.MAX_CANT
FROM MES_PELICULA_CANTIDAD_MAYOR MV INNER JOIN Pelicula pel ON MV.CodPel = pel.CodPel

--6. Listar los clientes que hayan alquilado todas las pel�culas del video. 
SELECT alq.CodCli 
FROM Alquiler alq
GROUP BY alq.CodCli
HAVING COUNT(DISTINCT alq.CodPel) >=
(
	SELECT COUNT(1)
	FROM Pelicula 
)


-- 7. Listar las pel�culas que no han registrado ning�n pr�stamo a la fecha. 
SELECT *
FROM Cliente cli
WHERE cli.CodCli NOT IN
(
	SELECT alq.CodCli FROM Alquiler alq
)

--8. Listar los clientes que no han efectuado la devoluci�n de ejemplares.
SELECT alq.CodCli
FROM Alquiler alq
WHERE alq.FechaDev IS NULL


-- 9. Listar los t�tulos de las pel�culas que tienen la mayor cantidad de pr�stamos.

SELECT pel.CodPel, pel.Titulo, pel.Duracion, pel.IdDirector, pel.IdGenero,CANT_MAX_PELICULA.CANT_MAX CANTIDAD_AQL
FROM 
(
	SELECT alq.CodPel C_PELICULA, COUNT(alq.IdAlquiler) CANT_MAX
	FROM Alquiler alq
	GROUP BY alq.CodPel
	HAVING  COUNT(alq.IdAlquiler) >= 
	(
		SELECT MAX(CANT_ALQ_X_PEL.CANT_ALQ)
		FROM 
		(
			SELECT alq.CodPel C_PELICULA, COUNT(alq.IdAlquiler) CANT_ALQ
			FROM Alquiler alq
			GROUP BY alq.CodPel
		) AS CANT_ALQ_X_PEL
	) 
) AS CANT_MAX_PELICULA INNER JOIN Pelicula pel ON pel.CodPel = CANT_MAX_PELICULA.C_PELICULA

-- 10. Listar las pel�culas que tienen todos los ejemplares prestados. 

SELECT eje.CodPel, COUNT(DISTINCT eje.NroEj)
FROM Ejemplar eje
GROUP BY eje.CodPel
HAVING COUNT(DISTINCT eje.NroEj) =
(
	SELECT COUNT(DISTINCT e.NroEj)
	FROM Ejemplar e
	WHERE e.CodPel = eje.CodPel AND e.Estado = 0
	GROUP BY e.CodPel
)

GO
ALTER FUNCTION f_Clientes_Alquilaron_Pelicula(@NOM_PEL VARCHAR(50))
RETURNS TABLE
AS
	RETURN
	(
		SELECT alq.CodCli
		FROM Alquiler alq
		WHERE alq.CodPel IN
		(
			SELECT pel.CodPel
			FROM Pelicula pel
			WHERE UPPER(pel.Titulo) = UPPER(@NOM_PEL)
		)
	)


SELECT * FROM dbo.f_Clientes_Alquilaron_Pelicula('EL CONJURO I')
INTERSECT
SELECT * FROM dbo.f_Clientes_Alquilaron_Pelicula('EL CONJURO II')



