
GO
CREATE OR ALTER VIEW vw_Clientes_Estado_Descriptivo
AS 
    SELECT  CodSocio AS CODIGO, 
            NombreSocio AS NOMBRE, 
            ApellidoSocio AS APELLIDO, 
            Email AS CORREO, 
            Telefono AS TELEFONO,
        CASE 
            WHEN Estado = 1 THEN 'OK'
            ELSE 'LISTA NEGRA'
        END AS S_ESTADO
    FROM Cliente
GO

