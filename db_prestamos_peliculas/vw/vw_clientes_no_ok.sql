GO
CREATE OR ALTER VIEW vw_Clientes_NO_OK
AS 
    SELECT  CodSocio AS COD_SOCIO, 
            NombreSocio AS NOMBRE, 
            ApellidoSocio AS APELLIDO, 
            Email AS CORREO, 
            Telefono AS TELEFONO
    FROM Cliente
    WHERE Estado = 0
GO