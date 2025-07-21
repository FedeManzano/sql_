
GO
CREATE OR ALTER FUNCTION f_Precio_Total_Abonar(@COD_SOC CHAR(6))
RETURNS DECIMAL(10,2)
BEGIN 
    RETURN 
    (
        SELECT
        CASE 
            WHEN COUNT(CodPrestamo) = 0 THEN 0
            ELSE COUNT(CodPrestamo) * dbo.f_Precio()
        END AS PRECIO_TOTAL
        FROM Prestamo
        WHERE CodSocio = @COD_SOC AND 
        FechaDevolucion IS NULL
        GROUP BY FechaPrestamo
    )
END
GO