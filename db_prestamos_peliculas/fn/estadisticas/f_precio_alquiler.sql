

GO
CREATE OR ALTER FUNCTION f_Precio()
RETURNS DECIMAL(10,2)
AS 
BEGIN 
     RETURN (SELECT pre.PrecioPrestamo FROM Precio pre)
END
GO

   
    