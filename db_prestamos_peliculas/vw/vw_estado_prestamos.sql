
GO
CREATE OR ALTER VIEW vw_Estado_Prestamos
AS
    SELECT  CodPrestamo AS CODIGO, 
            CodSocio SOCIO, 
            CodPelicula PELICULA, 
            NroEjemplar EJEMPLAR, 
            FechaPrestamo F_PRESTAMO,
            CASE 
                WHEN FechaDevolucion IS NULL THEN 'EN ESPERA'
                ELSE 'TERMINADO'
            END AS ESTADO
    FROM Prestamo
GO

