USE db_bares;

GO
CREATE PROCEDURE sp_Crear_Tablas
AS
BEGIN
	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	SET LOCK_TIMEOUT 3000
	BEGIN TRY
		CREATE TABLE Persona
		(
			Dni CHAR(8) PRIMARY KEY,
			NombrePersona VARCHAR(30) NOT NULL
		);

		CREATE TABLE Cerveza
		(
			NombreCerveza VARCHAR(30) PRIMARY KEY
		);

		CREATE TABLE Bar
		(
			NombreBar VARCHAR(30) PRIMARY KEY
		);

		CREATE TABLE Frecuenta
		(
			DniPersona CHAR(8) NOT NULL,
			NombreBar VARCHAR(30) NOT NULL,
			PRIMARY KEY(DniPersona, NombreBar),
			FOREIGN KEY(DniPersona) REFERENCES Persona(Dni),
			FOREIGN KEY(NombreBar) REFERENCES Bar(NombreBar)
		);

		CREATE TABLE Sirve
		(
			NombreCerveza VARCHAR(30) NOT NULL,
			NombreBar VARCHAR(30) NOT NULL,
			PRIMARY KEY(NombreCerveza, NombreBar),
			FOREIGN KEY(NombreCerveza) REFERENCES Cerveza(NombreCerveza),
			FOREIGN KEY(NombreBar) REFERENCES Bar(NombreBar)
		);


		CREATE TABLE Gusta
		(
			DniPersona CHAR(8) NOT NULL,
			NombreCerveza VARCHAR(30) NOT NULL,
			PRIMARY KEY(DniPersona, NombreCerveza),
			FOREIGN KEY(NombreCerveza) REFERENCES Cerveza(NombreCerveza),
			FOREIGN KEY(DniPersona) REFERENCES Persona(Dni)
		);


		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
	END CATCH
END
GO