
GO
CREATE OR ALTER FUNCTION f_Prestamos_Con_Retraso()
RETURNS TABLE 
AS 
    RETURN
    (
        SELECT PRE.CodPrestamo COD_PRES
        FROM Prestamo PRE 
        WHERE PRE.FechaDevolucion IS NULL AND 
             DATEDIFF(DAY, PRE.FechaPrestamo, GETDATE()) > 3
    )