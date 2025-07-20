
GO
CREATE OR ALTER FUNCTION f_Prestamos_No_Terminados_Entre(@F_INICIO VARCHAR(20), @F_FIN VARCHAR(20))
RETURNS TABLE 
AS 
    RETURN 
    (
        SELECT PRE.CodPrestamo AS COD_PRESTAMO, PRE.CodSocio AS COD_SOCIO 
        FROM Prestamo as PRE 
        WHERE PRE.FechaPrestamo >= @F_INICIO 
        AND PRE.FechaPrestamo <= @F_FIN
        AND PRE.FechaDevolucion IS NULL
    )
