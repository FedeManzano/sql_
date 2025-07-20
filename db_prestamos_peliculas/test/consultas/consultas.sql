

-- 1. Listar los clientes que no hayan reportado préstamos del rubro “Policial”.
SELECT * FROM dbo.f_Clientes_Que_No_Alquilaron_Genero('Acción')

SELECT DISTINCT pre.CodSocio
FROM Prestamo AS pre
WHERE pre.CodPelicula IN 
(
    SELECT pel.CodPelicula
    FROM Pelicula AS pel 
    WHERE pel.IdGenero NOT IN 
    (
        SELECT gen.IdGenero
        FROM Genero AS gen 
        WHERE gen.NombreGenero = 'Acción'
    )
)

-- 2. Listar las películas de mayor duración que alguna vez fueron prestadas
SELECT *
FROM Pelicula pel 
WHERE pel.Duracion = 
(
    SELECT MAX(pel.Duracion)
    FROM Pelicula pel 
    WHERE pel.CodPelicula IN 
    (
        SELECT pres.CodPelicula
        FROM Prestamo pres 
    )
)

-- 3. Listar los clientes que tienen más de un préstamo sobre la misma película (listar
-- Cliente, Película y cantidad de préstamos).
SELECT pre.CodSocio, Pre.CodPelicula, COUNT(pre.CodPrestamo) CANTIDAD_PRESTAMOS
FROM Prestamo pre 
GROUP BY pre.CodSocio, Pre.CodPelicula
HAVING COUNT(pre.CodPrestamo) >=
(
    SELECT MAX(CLIENTES_MISMA_PELICULA.CANT_MISMA_PEL)
    FROM 
    (
        SELECT pre.CodSocio, Pre.CodPelicula, COUNT(pre.CodPrestamo) CANT_MISMA_PEL
        FROM Prestamo pre 
        GROUP BY pre.CodSocio, Pre.CodPelicula
    ) AS CLIENTES_MISMA_PELICULA
)


--4. Listar los clientes que han realizado préstamos del título “Rey León” y “Terminador
--3” (Ambos).

SELECT * FROM dbo.f_Clientes_Aquilarion_Pelicula('El Caballero De La Noche Asciende')
INTERSECT 
SELECT * FROM dbo.f_Clientes_Aquilarion_Pelicula('Harry Potter: La Piedra Filosofal')

SELECT * FROM Pelicula

-- 5. Listar las películas más vistas en cada mes (Mes, Película, Cantidad de Alquileres). 
SELECT  pmvdcmul.MES_DESC MES_AÑO, 
        pmvdcmul.CodPelicula COD_PELICULA, 
        pel.Titulo TITULO_PELICULA, 
        pmvdcmul.MAS_VECES_VISTA
FROM vw_Peluculas_Mas_Vistas_De_Cada_Mes_Del_Ultimo_Año pmvdcmul 
INNER JOIN 
Pelicula pel
ON pel.CodPelicula = pmvdcmul.CodPelicula 


-- 6. Listar los clientes que hayan alquilado todas las películas del video. 
SELECT pre.CodSocio
FROM Prestamo pre
WHERE pre.CodPelicula IN 
(
    SELECT CodPelicula
    FROM Pelicula
) 
GROUP BY pre.CodSocio 
HAVING COUNT(pre.CodPelicula) >= 
(
    SELECT COUNT(CodPelicula)
    FROM Pelicula
)

SELECT *
FROM Cliente cli
WHERE NOT EXISTS 
(
    SELECT 1
    FROM Prestamo pre 
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM Prestamo p2
        WHERE p2.CodSocio = cli.CodSocio AND 
                p2.CodPelicula = pre.CodPelicula
    )
)

DECLARE @cadena NVARCHAR(100) = 'Hola Mundo';
SELECT HASHBYTES('SHA2_256', @cadena); -- Calcula el hash SHA2_256


CREATE TABLE Usuario
(
    Nombre VARCHAR(50) PRIMARY KEY,
    pass VARCHAR(500)
)

INSERT INTO Usuario(Nombre, pass)
VALUES 
('Redondos_11_44', HASHBYTES('SHA2_256', 'S3CR3T'))

DELETE FROM Usuario


DECLARE @R CHAR(1)
EXEC sp_Login 'usuario', 'nombre', 'Redondos_11_44', 'pass', 'S3CR3T', @RESULTADO =  @R OUTPUT
PRINT(@R)


SELECT * FROM dbo.f_Alquilo_Mas_Peliculas()
SELECT * FROM dbo.f_Alquilo_Menos_Peliculas()



DECLARE @P_TERMINADOS_ENTRE VARCHAR(MAX) = dbo.f_Prestamos_Terminados_Entre_F('2025-01-01', '2025-01-03')
EXEC (@P_TERMINADOS_ENTRE)
SELECT * FROM Prestamo


SELECT * FROM dbo.f_Prestamos_No_Terminados_Entre('2025-01-01', '2025-02-10')

SELECT  dbo.f_Mes_Mas_Alquileres_Año(2025) AS MES_MAS_ALQUILERES