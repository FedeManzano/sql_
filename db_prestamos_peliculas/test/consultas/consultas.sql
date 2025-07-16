

-- 1. Listar los clientes que no hayan reportado préstamos del rubro “Policial”.
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
SELECT pre.CodSocio
FROM Prestamo pre 
WHERE pre.CodPelicula IN 
(
    SELECT pel.CodPelicula
    FROM Pelicula pel 
    WHERE pel.Titulo = 'Rocky 2'
)
INTERSECT
SELECT pre.CodSocio
FROM Prestamo pre 
WHERE pre.CodPelicula IN 
(
    SELECT pel.CodPelicula
    FROM Pelicula pel 
    WHERE pel.Titulo = 'Rambo 2'
)

-- 5. Listar las películas más vistas en cada mes (Mes, Película, Cantidad de Alquileres). 
GO
CREATE OR ALTER VIEW vw_Cantidad_Vistas_Peliculas_Por_Mes
AS 
    SELECT MONTH(pre.FechaPrestamo) MES, pre.CodPelicula, COUNT(pre.CodPrestamo) CANT_PEL
    FROM Prestamo pre 
    WHERE YEAR(pre.FechaPrestamo) = 
    (
        SELECT MAX(YEAR(FechaPrestamo))
        FROM Prestamo
    )
    GROUP BY MONTH(pre.FechaPrestamo), pre.CodPelicula
GO

GO
CREATE OR ALTER VIEW vw_Max_Cantidad_Vistas_por_Mes
AS 
    SELECT cvppm.MES MES, MAX(cvppm.CANT_PEL) MAX_PEL
    FROM vw_Cantidad_Vistas_Peliculas_Por_Mes cvppm
    GROUP BY cvppm.MES
GO


GO
CREATE OR ALTER VIEW vw_Peluculas_Mas_Vistas_De_Cada_Mes_Del_Ultimo_Año
AS 
    SELECT 
        CASE 
            WHEN MES = 1 THEN 'Enero'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 2 THEN 'Febrero'     +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 3 THEN 'Marzo'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 4 THEN 'Abril'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 5 THEN 'Mayo'        +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 6 THEN 'Junio'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 7 THEN 'Julio'       +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 8 THEN 'Agosto'      +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 9 THEN 'Septiembre'  +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 10 THEN 'Octubre'    +       '/' + dbo.f_Ultimo_Año()
            WHEN MES = 11 THEN 'Noviembre'  +       '/' + dbo.f_Ultimo_Año()
            ELSE 'Diciembre'                +       '/' + dbo.f_Ultimo_Año()
        END AS MES_DESC,
        pre.CodPelicula, 
        COUNT(pre.CodPrestamo) MAS_VECES_VISTA
    FROM vw_Max_Cantidad_Vistas_por_Mes mcvpm 
    INNER JOIN Prestamo pre 
    ON MONTH(pre.FechaPrestamo) = mcvpm.MES
    GROUP BY MES,CodPelicula, MAX_PEL
    HAVING mcvpm.MAX_PEL = COUNT(pre.CodPrestamo) 
GO


SELECT * FROM vw_Peluculas_Mas_Vistas_De_Cada_Mes_Del_Ultimo_Año


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