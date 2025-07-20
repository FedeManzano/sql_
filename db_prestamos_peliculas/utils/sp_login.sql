
GO
CREATE OR ALTER PROCEDURE sp_Login
    @NOMBRE_TABLA VARCHAR (MAX),
    @NOMBRE_CAMPO_US VARCHAR(MAX),
    @NOMBRE_USUARIO VARCHAR(MAX),
    @NOMBRE_CAMPO_SECRET VARCHAR(MAX),
    @SECRET VARCHAR(MAX),
    @RESULTADO INT OUTPUT
    AS 
        BEGIN
            BEGIN TRANSACTION SP_L
            BEGIN TRY 
                IF  @NOMBRE_CAMPO_US        IS NULL OR
                    @NOMBRE_CAMPO_SECRET    IS NULL OR 
                    @NOMBRE_TABLA           IS NULL OR
                    @NOMBRE_USUARIO         IS NULL OR 
                    @SECRET                 IS NULL 
                    RAISERROR('Los parámetros de la sesión son erroneos', 11, 1)
                    
                SET @NOMBRE_TABLA       = UPPER(TRIM(@NOMBRE_TABLA))
                SET @NOMBRE_CAMPO_US    = UPPER(TRIM(@NOMBRE_CAMPO_US))
                SET @NOMBRE_CAMPO_SECRET= UPPER(TRIM(@NOMBRE_CAMPO_SECRET))
                SET @NOMBRE_CAMPO_US    = UPPER(TRIM(@NOMBRE_CAMPO_US))
                SET @SECRET = HASHBYTES('SHA2_256', @SECRET)
            
                DECLARE @INICIO_SESION NVARCHAR(MAX) =
                '   SELECT * 
                    FROM ' + @NOMBRE_TABLA + '
                    WHERE ' + 
                        @NOMBRE_CAMPO_US + '= '+ '''' + @NOMBRE_USUARIO + '''' + ' COLLATE Latin1_General_CS_AS' + 
                        ' AND ' + 
                        @NOMBRE_CAMPO_SECRET  + '= ' + ''''+ @SECRET +'''' + ' COLLATE Latin1_General_CS_AS'
                CREATE TABLE Usuario_log
                (
                    Nombre VARCHAR(500) PRIMARY KEY,
                    Pass VARCHAR(MAX)
                ) 

                INSERT INTO Usuario_log
                EXEC(@INICIO_SESION)       
                SET @RESULTADO = (SELECT COUNT(1) FROM Usuario_log)
                DROP TABLE Usuario_log

                COMMIT TRANSACTION
            END TRY
            BEGIN CATCH 
                DECLARE @MJE_ERROR NVARCHAR(4000),
                        @SEVERIDAD INT,
                        @ESTADO INT 
                SELECT 
                    @MJE_ERROR = ERROR_MESSAGE(),
                    @SEVERIDAD = ERROR_SEVERITY(),
                    @ESTADO = ERROR_STATE()

            RAISERROR(@MJE_ERROR, @SEVERIDAD, @ESTADO)
            ROLLBACK TRANSACTION 
            END CATCH
        END
GO
