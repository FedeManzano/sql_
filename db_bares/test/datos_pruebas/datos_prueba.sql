USE db_bares;


EXEC sp_Insertar_Persona '3/455548', 'esteban'

SELECT * FROM Cerveza

GO
CREATE PROCEDURE sp_Insertar_Datos_Prueba
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		
		EXEC sp_Insertar_Persona '32595830', 'Federico' 
		EXEC sp_Insertar_Persona '25444666', 'Marcos' 
		EXEC sp_Insertar_Persona '25444111', 'Ismael'
		EXEC sp_Insertar_Persona '27888444', 'Ramiro'
		EXEC sp_Insertar_Persona '18777555', 'Carlos'
		EXEC sp_Insertar_Persona '14222555', 'esteban'

		INSERT INTO Cerveza(NombreCerveza) VALUES
		('HEINIKEN'),
		('BRAMA'),
		('STELLA'),
		('QUILMES'),
		('SCHNEIDER'),
		('IMPERIAL'),
		('ISENBECK')

		INSERT INTO Bar(NombreBar) VALUES
		('TIA CLEO'),
		('PUNTA RAMOS'),
		('BRAKO'),
		('SHERLOCK'),
		('LUKS'),
		('COSMOS'),
		('LA JUAKINA')

		INSERT INTO Sirve(NombreBar, NombreCerveza) VALUES
		('TIA CLEO', 'BRAMA'),
		('TIA CLEO', 'STELLA'),
		('COSMOS', 'BRAMA'),
		('COSMOS', 'STELLA'),
		('COSMOS', 'QUILMES'),
		('BRAKO', 'BRAMA'),
		('SHERLOCK', 'QUILMES'),
		('PUNTA RAMOS', 'STELLA'),
		('LUKS', 'QUILMES'),
		('LUKS', 'BRAMA'),
		('LA JUAKINA', 'STELLA'),
		('LA JUAKINA', 'BRAMA')

		INSERT INTO Frecuenta(DniPersona, NombreBar) VALUES
		('32595830', 'COSMOS'),
		('32595830', 'TIA CLEO'),
		('32595830', 'LA JUAKINA'),
		('14222555', 'LA JUAKINA'),
		('14222555', 'LUKS'),
		('18777555', 'COSMOS'),
		('18777555', 'PUNTA RAMOS'),
		('25444111', 'TIA CLEO'),
		('25444666', 'LA JUAKINA'),
		('25444666', 'COSMOS'),
		('27888444', 'SHERLOCK')

	
		INSERT INTO Gusta(DniPersona, NombreCerveza) VALUES
		('32595830', 'BRAMA'),
		('32595830', 'STELLA'),
		('14222555', 'QUILMES'),
		('14222555', 'BRAMA'),
		('14222555', 'ISENBECK'),
		('18777555', 'IMPERIAL'),
		('25444111','BRAMA'),
		('25444111','IMPERIAL'),
		('25444111','QUILMES'),
		('25444666','QUILMES'),
		('27888444','BRAMA')
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
	END CATCH
END
GO

DELETE FROM Frecuenta WHERE DniPersona = '32595830' AND NombreBar = 'COSMOS'