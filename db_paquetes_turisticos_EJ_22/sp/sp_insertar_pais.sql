-- USE db_paquetes_turisticos
GO
CREATE OR ALTER PROCEDURE sp_Insertar_Pais 
@NOMBRE_PAIS VARCHAR(MAX)
AS 
BEGIN

    BEGIN TRANSACTION
    BEGIN TRY 
        DECLARE @COD TINYINT = (SELECT COUNT(1) FROM Pais) + 1
        EXEC sp_Format_Tittle @CADENA = @NOMBRE_PAIS OUTPUT
        SET @NOMBRE_PAIS = TRIM(@NOMBRE_PAIS)

        -- Insert país llama al TG Validar País
        INSERT INTO Pais(CodPais, NombrePais)
        VALUES (@COD, @NOMBRE_PAIS)
        COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH 
        DECLARE @MJE NVARCHAR(4000), 
                @SEVERIDAD INT,
                @ESTADO INT 

        SELECT  @MJE = ERROR_MESSAGE(),
                @SEVERIDAD = ERROR_SEVERITY(),
                @ESTADO = ERROR_STATE()
        RAISERROR(@MJE, @SEVERIDAD, @ESTADO)

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    END CATCH 
END 
GO