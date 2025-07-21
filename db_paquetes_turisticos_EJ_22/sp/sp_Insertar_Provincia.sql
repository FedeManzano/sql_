-- USE db_paquetes_turisticos
GO 
CREATE OR ALTER PROCEDURE sp_Insertar_Provincia
@NOMBRE_PROV VARCHAR(MAX),
@COD_PAIS INT 
AS 
BEGIN 
     BEGIN TRANSACTION
    BEGIN TRY 

        DECLARE @COD_PROV INT = (SELECT COUNT(1) FROM Provincia) + 1
        EXEC sp_Format_Tittle @CADENA = @NOMBRE_PROV OUTPUT 
        SET @NOMBRE_PROV = TRIM(@NOMBRE_PROV)
        
        -- Insert país llama al TG Validar Provincia
        INSERT INTO Provincia(CodProvincia, NombreProvincia, CodPais)
        VALUES (@COD_PROV, @NOMBRE_PROV, @COD_PAIS)
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
