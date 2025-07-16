
GO
CREATE OR ALTER VIEW vw_Estado_Ejemplares
AS 
    SELECT  e.NroEjemplar AS NRO,
            p.CodPelicula AS C_PELICULA,
            p.Titulo AS TITULO,
            e.Ubicacion UBICACION,
            CASE 
                WHEN e.Estado = 1 THEN 'DISPONIBLE'
                ELSE 'PRESTADO'
            END AS ESTADO_EJEMPLAR
    FROM Ejemplar e INNER JOIN Pelicula p ON p.CodPelicula = e.CodPelicula
GO
