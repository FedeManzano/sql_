USE db_viajes;

GO
ALTER PROCEDURE sp_Crear_Tablas
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY

		CREATE TABLE Automovil 
		(
			MatriculaAutomovil CHAR(7) PRIMARY KEY, 
			Modelo SMALLINT, 
			Año SMALLINT
		);

		CREATE TABLE Chofer
s		(
			NroLicenciaChofer CHAR(9) PRIMARY KEY, 
			Nombre VARCHAR(30) NOT NULL, 
			Apellido VARCHAR(30) NOT NULL, 
			Fecha_ingreso DATE NOT NULL, 
			Telefono VARCHAR(30)
		);


		CREATE TABLE Cliente 
		(
			DniCliente CHAR(8) PRIMARY KEY, 
			CalleCliente VARCHAR(50),  
			LocalidadCliente VARCHAR(100) 
		) 


		CREATE TABLE Viaje
		(
			FechaHoraInicio DATE NOT NULL, 
			FechaHoraFin DATE NOT NULL, 
			NroLicenciaChofer CHAR(9) NOT NULL, 
			DniCliente CHAR(8) NOT NULL, 
			MatriculaAutomovil CHAR(7) NOT NULL,
			kmTotales INT NOT NULL, 
			EsperaTotal INT NOT NULL, 
			CostoEspera DECIMAL(10,2) NOT NULL, 
			CostoKms DECIMAL(10,2) NOT NULL
			
			PRIMARY KEY(FechaHoraInicio, NroLicenciaChofer),
			FOREIGN KEY(NroLicenciaChofer) REFERENCES Chofer(NroLicenciaChofer),
			FOREIGN KEY(DniCliente) REFERENCES Cliente(DniCliente),
			FOREIGN KEY(MatriculaAutomovil) REFERENCES Automovil(MatriculaAutomovil),
		);
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH
END
GO
