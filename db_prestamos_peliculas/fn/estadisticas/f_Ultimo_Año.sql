

GO
CREATE OR ALTER FUNCTION f_Ultimo_Año()
RETURNS VARCHAR(MAX)
AS 
BEGIN 
    RETURN 
    (
        TRY_CAST((SELECT MAX(YEAR(FechaPrestamo)) FROM Prestamo) AS VARCHAR(MAX))
    )
END

