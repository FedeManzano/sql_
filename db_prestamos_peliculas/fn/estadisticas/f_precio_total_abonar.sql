
GO
CREATE OR ALTER FUNCTION f_Precio_Total_Abonar(@COD_SOC CHAR(6))
RETURNS DECIMAL(10,2)
BEGIN 
    RETURN 
    (
        SELECT COUNT(CodPrestamo) * dbo.f_Precio()
        FROM Prestamo
        WHERE CodSocio = @COD_SOC AND 
        FechaDevolucion IS NULL
    )
END
GO