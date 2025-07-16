
GO
CREATE OR ALTER PROCEDURE sp_Insertar_Genero
@NOMBRE_GENERO VARCHAR(MAX)
AS
BEGIN 
    IF  @NOMBRE_GENERO IS NULL      OR
        LEN(@NOMBRE_GENERO) < 2     OR 
        TRIM(@NOMBRE_GENERO) = ''   OR
        @NOMBRE_GENERO LIKE '%[^a-zA-Z0-9 ]%'
    BEGIN
        PRINT('Error en el nombre del género') 
        RETURN 0
    END

    EXEC sp_Format_Tittle @CADENA = @NOMBRE_GENERO OUTPUT

    DECLARE @ID TINYINT = (SELECT COUNT(1) FROM Genero) + 1

    INSERT INTO Genero(IdGenero, NombreGenero) VALUES 
    (@ID, TRIM(@NOMBRE_GENERO))

    RETURN 1
END
GO

