
GO
CREATE OR ALTER FUNCTION f_Generar_Ubicacion_ejemplar(@COD_PEL INT)
RETURNS CHAR(25)
AS 
BEGIN 
    DECLARE @GENERO_NOMBRE VARCHAR(MAX) = 
    (
        SELECT TOP(1)gen.NombreGenero
        FROM Pelicula AS pel INNER JOIN Genero AS gen 
        ON gen.IdGenero = pel.IdGenero 
        WHERE pel.CodPelicula = @COD_PEL
    )

    DECLARE @PELICULA_NOMBRE VARCHAR(MAX) = 
    (
        SELECT pel.Titulo
        FROM Pelicula AS pel 
        WHERE pel.CodPelicula = @COD_PEL
    )

    IF @GENERO_NOMBRE IS NULL 
    BEGIN 
        RETURN NULL
    END

    IF @PELICULA_NOMBRE IS NULL 
    BEGIN 
        RETURN NULL
    END

    DECLARE @IND_INICIAL INT = 1
    DECLARE @OFFSET_INICIAL INT = 2

    DECLARE @IND_PELICULA INT = 1
    DECLARE @OFFSET_PELICULA INT = 1

    DECLARE @INICIAL_GENERO CHAR(2) = 
            SUBSTRING
            (
                @GENERO_NOMBRE, 
                @IND_INICIAL,
                @OFFSET_INICIAL
            )

    DECLARE @INICIAL_PELICULA CHAR(1) = 
            SUBSTRING
            (
                @PELICULA_NOMBRE, 
                @IND_PELICULA,
                @OFFSET_PELICULA
            )
            
    DECLARE @NRO_EJEMPLAR INT = dbo.f_Get_Nro_Ejemplar(@COD_PEL)
   
    DECLARE @EJ_CAD VARCHAR(10) = 
        TRY_CAST
        (
            @NRO_EJEMPLAR AS VARCHAR(10)
        )
    
    DECLARE @UBI VARCHAR(25) = 
        UPPER(@INICIAL_GENERO) + 
        UPPER(@INICIAL_PELICULA) + '_' +
        dbo.f_Random_Numbers(3) + '-' +
        @EJ_CAD

    WHILE EXISTS (SELECT * FROM Ejemplar WHERE Ubicacion = @UBI)
    BEGIN
        SET  @UBI = 
                UPPER(@INICIAL_GENERO) + 
                UPPER(@INICIAL_PELICULA) + '_' +
                dbo.f_Random_Numbers(3) + '-' +
                @EJ_CAD
        END
    RETURN @UBI
END
GO