GO
CREATE OR ALTER PROCEDURE sp_Insertar_Destino
@DESC VARCHAR(MAX),
@PRECIO FLOAT
AS 
BEGIN 
    IF @DESC IS NULL OR @DESC = ''
        RETURN 0
    
    DECLARE @PAIS INT = dbo.f_Random_Numbers(2) % 12 + 1

    EXEC sp_Format_Tittle @CADENA = @DESC OUTPUT

    DECLARE @COD INT = (SELECT COUNT(1) FROM Destino) + 1


    INSERT INTO Destino(CodDestino, Descripcion, CodPaisDestino, Precio) 
    VALUES 
    (@COD, @DESC, @PAIS, @PRECIO)

END
GO


