USE db_viajes;

-- 1. Indique cuales son los autos con mayor cantidad de kilómetros realizados en el
-- último mes.
SELECT v.MatriculaAutomovil
FROM Viaje v
GROUP BY v.MatriculaAutomovil
HAVING SUM(v.kmTotales) >= 
(
	SELECT MAX(CANTIDAD_KM_AUTOMOVIL.ACUM_KM_AUTOMOVIL)
	FROM 
	(
		SELECT v.MatriculaAutomovil, SUM(v.kmTotales) ACUM_KM_AUTOMOVIL
		FROM Viaje v
		GROUP BY v.MatriculaAutomovil
	) AS CANTIDAD_KM_AUTOMOVIL
)

-- 2. Indique los clientes que más viajes hayan realizado con el mismo chofer.
SELECT v.DniCliente CLI, v.NroLicenciaChofer CHO, COUNT(*) 
FROM Viaje v
GROUP BY v.DniCliente, v.NroLicenciaChofer
HAVING COUNT(*) >= 
(
	SELECT MAX(CANT_VECES_MISMO_CHOFER.CANTIDAD_VECES)
	FROM 
	(
		SELECT v.DniCliente CLI, v.NroLicenciaChofer CHO, COUNT(*) CANTIDAD_VECES
		FROM Viaje v
		GROUP BY v.DniCliente, v.NroLicenciaChofer
	) AS CANT_VECES_MISMO_CHOFER
)

-- 4. Obtenga nombre y apellido de los choferes que no manejaron todos los vehículos
-- que disponemos.
SELECT * 
FROM Chofer
WHERE NroLicenciaChofer IN 
(
	SELECT v.NroLicenciaChofer
	FROM Viaje v
	WHERE v.NroLicenciaChofer NOT IN 
	(
		SELECT v.NroLicenciaChofer
		FROM Viaje v
		GROUP BY v.NroLicenciaChofer
		HAVING COUNT(DISTINCT v.MatriculaAutomovil) >=
		(
			SELECT COUNT(*)
			FROM Automovil
		)
	)
)


--5. Obtenga el nombre y apellido de los clientes que hayan viajado en todos nuestros
-- autos.
SELECT DISTINCT via.DniCliente
FROM Viaje via
WHERE via.MatriculaAutomovil IN 
(
	SELECT MatriculaAutomovil
	FROM Automovil
)
GROUP BY via.DniCliente
HAVING COUNT(via.MatriculaAutomovil) >=
(
	SELECT COUNT(MatriculaAutomovil)
	FROM Automovil
)

-- 6. Queremos conocer el tiempo de espera promedio de los viajes de los últimos 2
-- meses
SELECT AVG(v.CostoEspera)
FROM Viaje v

-- 7. Indique los kilómetros realizados en viajes por cada auto.
SELECT v.MatriculaAutomovil, SUM(v.kmTotales)
FROM Viaje v
GROUP BY v.MatriculaAutomovil

-- 8. Indique el costo promedio de los viajes realizados por cada auto
SELECT v.MatriculaAutomovil, AVG(v.CostoEspera + v.CostoKms)
FROM Viaje v
GROUP BY v.MatriculaAutomovil

-- 9. Indique el costo total de los viajes realizados por cada chofer en el último mes.
SELECT v.NroLicenciaChofer, SUM(v.CostoEspera) + SUM(v.CostoKms)
FROM Viaje v
GROUP BY v.NroLicenciaChofer

-- 10. Indique la fecha inicial, el chofer y el cliente que hayan realizado el viaje más largo
-- de este año.
SELECT v.FechaHoraInicio, v.DniCliente, v.NroLicenciaChofer
FROM Viaje v
WHERE v.kmTotales >= 
(
	SELECT MAX(v.kmTotales)
	FROM Viaje v
)























