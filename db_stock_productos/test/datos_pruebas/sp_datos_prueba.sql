USE db_stock_productos

GO
CREATE PROCEDURE sp_Insertar_Datos
AS
BEGIN
	
	EXEC sp_Insertar_Proveedor 'COCA COLA', '2023-03-02'
	EXEC sp_Insertar_Proveedor 'PEPSI', '2023-02-02'
	EXEC sp_Insertar_Proveedor 'ARCOR', '2023-02-02'
	EXEC sp_Insertar_Proveedor 'LA SERENISIMA', '2022-02-02'

	EXEC sp_Insertar_Producto 'MESA DE COCINA', 1, 1000
	EXEC sp_Insertar_Producto 'HERRAMIENTAS DE JARDIN', 2, 500
	EXEC sp_Insertar_Producto 'SMART TV', 3, 0
	EXEC sp_Insertar_Producto 'PELOTAS DE FUTBOL', 1, 10
	EXEC sp_Insertar_Producto 'PISAS AISLANTES', 4, 1500
	EXEC sp_Insertar_Producto 'AZULEJOS DE BAÑO', 3, 1500
	EXEC sp_Insertar_Producto 'PARRILLA ELECTRICA', 1, 1200
	EXEC sp_Insertar_Producto 'PLATOS PORCeLANA', 3, 0

END
GO
SELECT * FROM dbo.f_Lista_Stock()