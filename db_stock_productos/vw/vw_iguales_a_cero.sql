USE db_stock_productos

GO
ALTER VIEW vw_Stock_Cero
AS
	SELECT s.Fecha FECHA, COUNT(s.CodProd) IGUAL_0
	FROM Stock s
	WHERE s.Cantidad = 0
	GROUP BY s.Fecha
GO