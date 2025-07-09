USE db_viajes;

GO
ALTER PROCEDURE sp_Insertar_Automovil
@MODELO SMALLINT,
@A�O SMALLINT
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF @MODELO < 0 OR @A�O < 1900 
		BEGIN
			PRINT('Modelo invalido')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @PAT CHAR(7) = dbo.f_Generador_Patentes()
		
		INSERT INTO Automovil(MatriculaAutomovil, Modelo, A�o)
		VALUES
		(@PAT, @MODELO, @A�O)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH
END
GO


