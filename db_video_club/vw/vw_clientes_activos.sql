USE db_video_club;

/*
	Vista que muestra solo el los clientes con el estado activo
*/
GO
CREATE VIEW vw_Clientes_Activos
AS
	SELECT	CodCli AS CODIGO,
			NombreCliente AS NOMBRE,
			ApellidoCliente AS APELLIDO,
			Direccion AS DIRECCION,
			Tel AS TEL,
			Email AS EMAIL
	FROM Cliente
	WHERE Estado = 1
GO