USE db_stock_productos

GO
CREATE VIEW vw_Mayores_Que_Mil
AS
	SELECT s.Fecha FECHA,COUNT(s.CodProd) MAYORES_1000
	FROM Stock s
	WHERE s.Cantidad > 1000
	GROUP BY s.Fecha
GO