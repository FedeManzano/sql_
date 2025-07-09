USE db_viajes;


GO
ALTER PROCEDURE sp_Cargar_Datos_Prueba
AS
BEGIN
	
	EXEC sp_Insertar_Automovil 100, 2024
	EXEC sp_Insertar_Automovil 30, 2024
	EXEC sp_Insertar_Automovil 20, 2025
	EXEC sp_Insertar_Automovil 15, 2021
	EXEC sp_Insertar_Automovil 70, 2019
	EXEC sp_Insertar_Automovil 24, 2016
	EXEC sp_Insertar_Automovil 50, 2023
	EXEC sp_Insertar_Automovil 50, 2021
	EXEC sp_Insertar_Automovil 22, 2020

	EXEC sp_Insertar_Chofer 'marcos', 'pereira','2023-02-10', '541146541122'
	EXEC sp_Insertar_Chofer 'carlos', 'reina','2022-01-10', '541146546122'
	EXEC sp_Insertar_Chofer 'ariel', 'medina','2019-05-07', '541146556122'
	EXEC sp_Insertar_Chofer 'fernando', 'alonso','2025-07-01', '541146536125'
	EXEC sp_Insertar_Chofer 'marcelo', 'perez','2021-07-01', '541146530125'
	EXEC sp_Insertar_Chofer 'leonardo', 'lopez','2014-01-01', '541144536125'
	EXEC sp_Insertar_Chofer 'ismael', 'perez','2016-02-07', '541144546125'

	EXEC sp_Insertar_Cliente 'B. Frione 4680', 'Ciudadela'
	EXEC sp_Insertar_Cliente 'Rivadavia 800', 'Cap. Federal'
	EXEC sp_Insertar_Cliente 'Lugano', 'Prov. Buenos Aires'
	EXEC sp_Insertar_Cliente 'Flores', 'Prov. Cap. Federal'
	EXEC sp_Insertar_Cliente 'Promera Junta', 'Prov. Cap. Federal'
	EXEC sp_Insertar_Cliente 'Palermo', 'Cap. Federal'
	
END

SELECT * FROM Chofer
SELECT * FROM Cliente
SELECT * FROM Automovil
INSERT INTO Viaje(FechaHoraInicio, FechaHoraFin, NroLicenciaChofer, DniCliente, MatriculaAutomovil, kmTotales, EsperaTotal, CostoEspera, CostoKms )
	VALUES 	
	('2020-02-01', '2020-02-03', '11386646X', '17066951', 'CBK 567', 1000, 50, 500, 250),
	('2021-12-01', '2021-01-01', '09130398L', '47180626', 'ZYY 755', 150, 60, 150, 200),
	('2020-02-01', '2020-02-03', '11386646X', '17066951', 'CBK 567', 1000, 50, 500, 250),
	('2021-03-01', '2021-03-06', '11386646X', '17066951', 'CBK 567', 500, 25, 150, 100),
	('2021-04-01', '2021-04-06', '40648517P', '33559514', 'EHU 091', 700, 125, 100, 110),
	('2021-05-01', '2021-05-06', '27415399B', '47180626', 'EHU 091', 500, 200, 150, 120),
	('2021-06-01', '2021-06-06', '11386646X', '33559514', 'FEY 585', 500, 200, 150, 120),
	('2021-07-01', '2021-07-06', '40648517P', '81527970', 'FMA 083', 400, 100, 20, 200),
	('2021-08-01', '2021-09-06', '40648517P', '81767670', 'JKJ 292', 350, 20, 150, 100),
	('2021-09-01', '2021-10-06', '93170703Q', '60461898', 'QUK 216', 200, 40, 160, 100),
	('2021-10-01', '2021-11-06', '99476455P', '81527970', 'SND 202', 150, 60, 150, 200),
	('2021-11-01', '2021-12-06', '09130398L', '47180626', 'ZYY 755', 150, 60, 150, 200),
	('2021-11-01', '2021-12-06', '09130398L', '47180626', 'ZYY 755', 150, 60, 150, 200)
