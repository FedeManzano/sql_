USE db_viajes;

GO
ALTER PROCEDURE sp_Insertar_Automovil
@MODELO SMALLINT,
@AÑO SMALLINT
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF @MODELO < 0 OR @AÑO < 1900 
		BEGIN
			PRINT('Modelo invalido')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @PAT CHAR(7) = dbo.f_Generador_Patentes()
		
		INSERT INTO Automovil(MatriculaAutomovil, Modelo, Año)
		VALUES
		(@PAT, @MODELO, @AÑO)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH
END
GO


