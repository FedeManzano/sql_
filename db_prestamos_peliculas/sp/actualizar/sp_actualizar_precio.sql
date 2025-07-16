
GO
CREATE OR ALTER PROCEDURE sp_Actualizar_Precio
@PRECIO DECIMAL(10,2)
AS 
BEGIN 
    IF @PRECIO < 0
        RETURN 0
    UPDATE Precio SET PrecioPrestamo = @PRECIO WHERE CodigoPrecio = 1
END
GO
