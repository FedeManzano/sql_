
GO
CREATE OR ALTER VIEW vw_Clientes_OK
AS 
    SELECT  CodSocio AS COD_SOCIO, 
            NombreSocio AS NOMBRE, 
            ApellidoSocio AS APELLIDO, 
            Email AS CORREO, 
            Telefono AS TELEFONO
    FROM Cliente
    WHERE Estado = 1
GO