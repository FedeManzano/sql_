USE db_stock_productos

GO
CREATE FUNCTION f_Lista_Stock()
RETURNS TABLE
AS
	RETURN
	(
		SELECT	s.Fecha, 
				(SELECT MAYORES_1000 FROM vw_Mayores_Que_Mil WHERE s.Fecha = FECHA) AS '> 1000',
				(SELECT MENORES_1000 FROM vw_Menores_Que_Mil WHERE s.Fecha = FECHA) AS '< 1000',
				(SELECT IGUAL_0 FROM vw_Stock_Cero WHERE s.Fecha = FECHA) AS '= 0'
		FROM Stock s
		GROUP BY s.Fecha 
	)
GO