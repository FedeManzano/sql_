
GO
CREATE OR ALTER PROCEDURE sp_Insertar_Usuario
@TIPO_DOC CHAR(3),
@NRODNI CHAR(8),
@CORREO VARCHAR(100),
@NOMBRE VARCHAR(100),
@FNAC DATE 
AS
BEGIN 
    BEGIN TRANSACTION 
    BEGIN TRY

        SET @CORREO = LOWER(@CORREO)
        SET @NOMBRE = dbo.f_Format_Tittle(@NOMBRE)

        -- LLAMADO TG Valdar_Usuario
        INSERT INTO Usuario(Tipo_Doc, Nro_Doc, Correo, Nombre, FNacimiento)
        VALUES
        (@TIPO_DOC, @NRODNI, @CORREO, @NOMBRE, @FNAC)
        COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH
        DECLARE @MJE_ERROR NVARCHAR(4000), @SEVERIDAD INT, @ESTADO INT 

        SELECT 
            @MJE_ERROR = ERROR_MESSAGE(),
            @SEVERIDAD = ERROR_SEVERITY(),
            @ESTADO = ERROR_STATE()
        PRINT(@MJE_ERROR)
        RAISERROR(@MJE_ERROR, @SEVERIDAD, @ESTADO)
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    END CATCH

END