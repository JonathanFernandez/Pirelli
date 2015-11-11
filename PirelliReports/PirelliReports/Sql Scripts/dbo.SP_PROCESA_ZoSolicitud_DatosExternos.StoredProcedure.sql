USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESA_ZoSolicitud_DatosExternos]    Script Date: 11/11/2015 1:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===========================================================================
-- Author:		Nicolas Galiano
-- Create date: Diciembre 2014
-- Description:	SP que  valida  y envia los datos de la tabla:
--      dbo.ZoSolicitud_DatosExternos-->dbo.ZoSolicitud
-- ===========================================================================
CREATE PROCEDURE [dbo].[SP_PROCESA_ZoSolicitud_DatosExternos] 

AS
BEGIN

-------------------------------------------------------------------------------------------------

PRINT 'FUERZO A ACTUALIZAR LAS PROMOS'

EXEC SP_INSERT_UPDATE_ZOTIPOPROMOxIP 


-------------------------------------------------------------------------------------------------

PRINT 'CASTEO LA IP Y EL CODIGO DE CLIENTE'

UPDATE dbo.ZoSolicitud_DatosExternos  
SET IP=RIGHT(CAST('0000000' AS varchar) + CAST(LTRIM(RTRIM([IP])) AS varchar), 7),
    CODCLIE=RIGHT(CAST('0000000000' AS varchar) + CAST(LTRIM(RTRIM([CODCLIE])) AS varchar), 10),
    [NombreUsu]= CASE  [NombreUsu] WHEN '' THEN 'CF' ELSE [NombreUsu] END 
    
    
-------------------------------------------------------------------------------------------------

PRINT 'ACTUALIZO PAIS DE IP'

UPDATE dbo.ZoSolicitud_DatosExternos 
SET dbo.ZoSolicitud_DatosExternos.PAIS = P.PAIS
FROM dbo.ZoSolicitud_DatosExternos
INNER JOIN dbo.Zoprodu1 AS P 
       ON P.IP = dbo.ZoSolicitud_DatosExternos.IP 

--------------------------------------------------------------------------------------------------

PRINT 'ACTUALIZO PROVINCIA'

UPDATE dbo.ZoSolicitud_DatosExternos
SET dbo.ZoSolicitud_DatosExternos.CodProv = C.CodProv,dbo.ZoSolicitud_DatosExternos.ciudad = C.ciudad
FROM dbo.ZoSolicitud_DatosExternos
INNER JOIN dbo.Zoclien1 AS C 
       ON C.COD = dbo.ZoSolicitud_DatosExternos.CODCLIE 
       
--------------------------------------------------------------------------------------------------

PRINT 'ACTUALIZO LAS CUOTAS Y EL DESCUENTO DE LA PROMO'

UPDATE dbo.ZoSolicitud_DatosExternos
SET dbo.ZoSolicitud_DatosExternos.[Cuotas] =
											 CASE DATEPART(dw,dbo.ZoSolicitud_DatosExternos.[fechaCompra])
										  
											  WHEN 1 THEN P.Cuota1
											  WHEN 2 THEN P.Cuota2
											  WHEN 3 THEN P.Cuota3
											  WHEN 4 THEN P.Cuota4
											  WHEN 5 THEN P.Cuota5
											  WHEN 6 THEN P.Cuota6
											  WHEN 7 THEN P.Cuota7
											END
, dbo.ZoSolicitud_DatosExternos.[Descuento]=
											 CASE DATEPART(dw,dbo.ZoSolicitud_DatosExternos.[fechaCompra])
										  
											  WHEN 1 THEN P.Descu1
											  WHEN 2 THEN P.Descu2
											  WHEN 3 THEN P.Descu3
											  WHEN 4 THEN P.Descu4
											  WHEN 5 THEN P.Descu5
											  WHEN 6 THEN P.Descu6
											  WHEN 7 THEN P.Descu7
											 END
FROM dbo.ZoSolicitud_DatosExternos
INNER JOIN dbo.ZoTipoPromo AS P ON P.CodTipoPromo = dbo.ZoSolicitud_DatosExternos.CodPromo
WHERE dbo.ZoSolicitud_DatosExternos.[Descuento]='0' 


 
PRINT 'EN CASO DE QUE TENGA DESCUENTO POR IP'

UPDATE DE
SET DE.DESCUENTO =PE.DESCUENTO
FROM dbo.ZoSolicitud_DatosExternos DE
INNER JOIN dbo.ZoTipoPromoXIP AS PE 
		   ON PE.CodTipoPromo = DE.CodPromo AND PE.IP=DE.IP
INNER JOIN dbo.ZoTipoPromo AS P 
       ON P.CodTipoPromo = DE.CodPromo		   
WHERE DE.[fechaCompra]>=P.FecDesde 
      AND DE.[fechaCompra] <=P.FecHasta
      AND DE.[Descuento]='0'  

-----------------------------------------------------------------------------------------------
      
PRINT 'CONVIERTO LA FECHA DE COMPRA A SOLO FECHA (ignoro los hh:mm:ss ya que de ESKER viene como 12:00:00)...'
UPDATE [ZoSolicitud_DatosExternos] SET fechaCompra = CONVERT (char(10), fechaCompra, 102) 
      
-----------------------------------------------------------------------------------------------
      
PRINT 'MARCO TODO A PROCESAR...'
UPDATE [ZoSolicitud_DatosExternos] SET [FlgProcesado]='3' WHERE [FlgProcesado]='0'


------------------------------------------------------------------------------------------------    
 
PRINT 'VALIDO QUE NO EXISTAN REPETIDOS CONTRA LA TABLA ZoSolicitud_DatosExternos'

UPDATE DE
SET DE.[FlgProcesado] = '4', DE.NOTA='Registro duplicado, ya existe Registro en la tabla ZoSolicitud_DatosExternoS'
FROM dbo.ZoSolicitud_DatosExternos AS DE
INNER JOIN dbo.ZoSolicitud_DatosExternos  AS S ON 
									DE.IP = S.IP AND 
									DE.Pais = S.Pais AND
									DE.CodClie = S.CodClie AND
									DE.fechaCompra = S.fechaCompra AND
									RIGHT((CAST('00000' as VARCHAR) + CAST(DE.NroFactura as VARCHAR)) ,5) = RIGHT((CAST('00000' as VARCHAR) + CAST(S.NroFactura as VARCHAR)) ,5)	   
WHERE NOT S.[CodSolicitud]  IS NULL AND DE.[CodSolicitud] <> S.[CodSolicitud]


PRINT 'VALIDO QUE NO EXISTAN REPETIDOS CONTRA LA TABLA ZoSolicitud'

UPDATE DE
SET DE.[FlgProcesado] = '4', DE.NOTA='Registro duplicado, ya existe Registro en la tabla ZoSolicitud'
FROM dbo.ZoSolicitud_DatosExternos AS DE
INNER JOIN dbo.ZoSolicitud  AS S ON 
									DE.IP = S.IP AND 
									DE.Pais = S.Pais AND
									DE.CodClie = S.CodClie AND
									DE.fechaCompra = S.fechaCompra AND
									RIGHT((CAST('00000' as VARCHAR) + CAST(DE.NroFactura as VARCHAR)) ,5) = RIGHT((CAST('00000' as VARCHAR) + CAST(S.NroFactura as VARCHAR)) ,5)	   
WHERE NOT S.[CodSolicitud]  IS NULL

/*
UPDATE A
SET A.[FlgProcesado] = '4', A.NOTA='Registro duplicado, ya existe Registro en la tabla ZoSolicitud'
FROM dbo.ZoSolicitud_DatosExternos A
INNER JOIN dbo.ZoSolicitud  AS C 
           ON C.ESKER_ID = A.ESKER_ID and A.[FlgProcesado]<>'4'
*/

              
-------------------------------------------------------------------------------------------------


--LAS QUE QUEDAN EN 4 ES PORQUE TIENEN ALGUN DATO MAL.
PRINT 'VALIDA QUE EXISTA EL PRODUCTO, EL CLIENTE, LA PROVINCIA Y LA PROMO E IDENTIFICO EL MOTIVO DE LA INCOSISTENCIA:'

UPDATE	A SET 
	
	A.[FlgProcesado] = '4',

	A.NOTA =' Error en: ' +
		CAST(CASE WHEN IP.IP			IS NULL	THEN ' - PRODUCTO'	ELSE '' END as VARCHAR) +
		CAST(CASE WHEN CL.Cod			IS NULL	THEN ' - CLIENTE'	ELSE '' END as VARCHAR) +
		CAST(CASE WHEN PR.Zocod			IS NULL	THEN ' - PROVINCIA' ELSE '' END as VARCHAR) +
		CAST(CASE WHEN TP.CodTipoPromo	IS NULL	THEN ' - PROMOCION' ELSE '' END as VARCHAR) 

FROM [dbo].[ZoSolicitud_DatosExternos] A
	 LEFT JOIN dbo.Zoprodu1 IP		ON IP.IP = A.IP AND IP.PAIS= A.PAIS
	 LEFT JOIN  dbo.Zoclien1 CL		ON CL.Cod = A.[CodClie]
	 LEFT JOIN dbo.Zoprovincia PR	ON PR.Zocod = A.[CodProv]
	 LEFT JOIN dbo.ZoTipoPromo TP	ON TP.CodTipoPromo = A.[CodPromo] AND A.[fechaCompra] >= TP.FecDesde AND A.[fechaCompra] <= TP.FecHasta   

WHERE A.[FlgProcesado]<>'4' AND ((IP.IP IS NULL) OR 
									(CL.Cod IS NULL)		OR 
									(PR.Zocod IS NULL) OR 
									(TP.CodTipoPromo IS NULL))

------------------------------------------------------------------------------------------------


PRINT 'CARGO LOS REGISTROS EN LA TABLA'


INSERT INTO dbo.ZoSolicitud (CodAgrup, IP, Pais, CodClie, fechaCompra, Cantidad, NroFactura, NroTicket, NroCom, NroTarjeta, NroAuto, NombreUsu, DirUsu, 
                      Nro, Dpto, Piso, Ciudad, CodProv, Vehiculo, Cuotas, Telefono, CodPos, Precio, FlgProcesado, CodPromo, Descuento, CodAux, FecAlta, UsuAlta, 
                      FecUltAct, UsuUltAct, FecSubSAP, Nota,[Esker_link],[Esker_ID])
                      
SELECT				   [CodAgrup]
					  ,[IP]
					  ,[Pais]
					  ,[CodClie]
					  ,[fechaCompra]
					  ,[Cantidad]
					  ,[NroFactura]
					  ,[NroTicket]
					  ,[NroCom]
					  ,[NroTarjeta]
					  ,[NroAuto]
					  ,[NombreUsu]
					  ,[DirUsu]
					  ,[Nro]
					  ,[Dpto]
					  ,[Piso]
					  ,[Ciudad]
					  ,[CodProv]
					  ,[Vehiculo]
					  ,[Cuotas]
					  ,[Telefono]
					  ,[CodPos]
					  ,[Precio]
					  ,'0' as [FlgProcesado]
					  ,[CodPromo]
					  ,[Descuento]
					  ,[CodAux]
					  ,[FecAlta]
					  ,[UsuAlta]
					  ,[FecUltAct]
					  ,[UsuUltAct]
					  ,[FecSubSAP]
					  ,[Nota]
					  ,[Esker_link]
					  ,[Esker_ID]
				  FROM [Comercial].[dbo].[ZoSolicitud_DatosExternos]
				  WHERE [FlgProcesado]='3' --AND [CodPromo]='55'


----------------------------------------------------------------------------------------------------
PRINT 'ELIMINO LOS DATOS QUE SE GRABARON BIEN'
				  
DELETE FROM [Comercial].[dbo].[ZoSolicitud_DatosExternos] WHERE [FlgProcesado]='3' --AND [CodPromo]='55'


END






/*
SELECT       IP, Pais, CodClie, fechaCompra, RIGHT((CAST('00000' as VARCHAR) + CAST(NroFactura as VARCHAR)) ,5) as FACT, COUNT(*) as REPETICIONES
FROM            dbo.ZoSolicitud
WHERE MONTH(FechaCompra) IN ('6','7') AND YEAR(FechaCompra)=2014
GROUP BY IP, Pais, CodClie, fechaCompra, RIGHT((CAST('00000' as VARCHAR) + CAST(NroFactura as VARCHAR)) ,5)
HAVING COUNT(*) > 1
Order BY fechaCompra desc

*/
GO
