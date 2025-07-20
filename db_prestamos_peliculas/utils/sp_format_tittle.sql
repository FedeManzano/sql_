
GO
CREATE OR ALTER PROCEDURE sp_Format_Tittle
@CADENA VARCHAR(MAX) OUTPUT
AS 
BEGIN 
    IF @CADENA IS NULL 
    BEGIN 
        SET @CADENA = ''
        RETURN 0
    END
    SET @CADENA = TRIM(@CADENA)
    CREATE TABLE AUX_TABLA
    (
        Campo VARCHAR(MAX)
    );

    INSERT INTO AUX_TABLA (Campo) 
    SELECT value FROM STRING_SPLIT(@CADENA, ' ') WHERE value <> ' '

    DECLARE @CANT INT = (SELECT COUNT(1) FROM AUX_TABLA)
    DECLARE @CADENA_AUX VARCHAR(MAX)

    SET @CADENA = ''

    WHILE @CANT >= 1
    BEGIN 
        SELECT @CADENA_AUX = Campo FROM AUX_TABLA 
        WHERE Campo IN 
        (   
           SELECT TOP(1)Campo FROM AUX_TABLA  
        )

        SET @CADENA_AUX =  TRIM(UPPER(SUBSTRING(@CADENA_AUX, 1, 1)) +  LOWER(SUBSTRING(@CADENA_AUX, 2, LEN(@CADENA_AUX))))
        SET @CADENA = @CADENA + @CADENA_AUX + ' '
        SET @CADENA_AUX  = ''
    
        SET @CANT = @CANT - 1
        
        DELETE TOP(1) FROM AUX_TABLA
    END


    SET @CADENA = TRIM(@CADENA)
    DROP TABLE AUX_TABLA
END
GO