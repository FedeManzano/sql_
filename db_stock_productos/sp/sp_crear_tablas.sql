USE db_stock_productos;

GO
CREATE PROCEDURE sp_Creat_Tablas
AS
BEGIN

	CREATE TABLE Proveedor 
	(
		CodProv INT PRIMARY KEY, 
		RazonSocial VARCHAR(50) NOT NULL, 
		FechaInicio DATE NOT NULL
	);

	CREATE TABLE Producto
	(
		CodProd INT PRIMARY KEY, 
		Descripcion VARCHAR(100), 
		CodProv INT NOT NULL, 
		StockActual	INT NOT NULL DEFAULT 0,
		FOREIGN KEY(CodProv) REFERENCES Proveedor(CodProv) ON DELETE CASCADE
	);

	CREATE TABLE Stock 
	(
		NroStock INT NOT NULL, 
		Fecha DATE NOT NULL, 
		CodProd INT NOT NULL, 
		Cantidad INT NOT NULL DEFAULT 0,
		PRIMARY KEY(NroStock, Fecha, CodProd),
		FOREIGN KEY(CodProd) REFERENCES Producto(CodProd) ON DELETE CASCADE
	);

END
GO


