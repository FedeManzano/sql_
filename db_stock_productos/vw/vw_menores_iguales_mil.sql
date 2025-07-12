USE db_stock_productos

GO
CREATE VIEW vw_Menores_Que_Mil
AS
	SELECT s.Fecha FECHA, COUNT(s.CodProd) MENORES_1000
	FROM Stock s
	WHERE s.Cantidad <= 1000 AND s.Cantidad > 0
	GROUP BY s.Fecha
GO