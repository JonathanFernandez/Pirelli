USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_GEO_CLIENTES_SOLICITUDES]    Script Date: 18/11/2015 2:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_HELPTEXT EXEC ST_SOLICITUDES

--<ASP:BUTTON RUNAT="SERVER" ID="LOGIN_LOST_BTN" CLASS="BTN BTN-LINK" TEXT="VER FACTURA ONLINE " ONCLIENTCLICK="JAVASCRIPT:OPENPOPUP('HTTPS://NA2.ESKER.COM/ONDEMAND/WEBACCESS/FLEXIBLEFORM/FLEXIBLEFORM.ASPX?ACTION=RUN&LAYOUT=_FLEXIBLEFORM&ID=CD%23DUXW3214594.110726382');"/>
-- [DBO].[ST_SOLICITUDES] '%',
-- EXEC ST_SOLICITUDES '%','%'
-- EXEC ST_SOLICITUDES '','MARTOLIO'
CREATE        PROCEDURE [dbo].[SP_GEO_CLIENTES_SOLICITUDES] 
		@CLIEID VARCHAR(15)='%', 
		@DESCCLIE VARCHAR(30)='%', 
		@CUOTAS VARCHAR(3)='%',
		@FLGPROCESADO VARCHAR(1)='%', 
		@DESCUENTO VARCHAR(10)='%', 
		@USUALTA VARCHAR (15)='%', 
		@NROFACTURA VARCHAR (15)='%', 
		@NROIP VARCHAR (15) ='%', 
		@DESCIP VARCHAR (50) ='%',
		@FECHADESDE DATETIME ='1900/1/1', 
		@FECHAHASTA DATETIME ='2900/1/1',
		@TOPE INT=100, 
		@AGRUPID VARCHAR(15)='%',
		@NROTICKET VARCHAR(15)='%',
		@CODPROMO VARCHAR(15)='%',
		@FAMIAGRIP VARCHAR(10)= '%'
AS

BEGIN
	SET ROWCOUNT @TOPE
	
	SELECT	DISTINCT
	DBO.ZOCLIEN1.COD,
	DBO.ZOCLIEN1.RAZSOC,
	DBO.ZOCLIEN1.DIRSUC,
	DBO.ZOCLIEN1.LATITUD,
	DBO.ZOCLIEN1.LONGITUD,
	DBO.ZOSOLICITUD.CODSOLICITUD
			

	FROM         DBO.ZOSOLICITUD WITH(NOLOCK)
	INNER JOIN
	DBO.ZOPROVINCIA ON DBO.ZOSOLICITUD.CODPROV = DBO.ZOPROVINCIA.ZOCOD 
	
	INNER JOIN
	DBO.ZOPRODU1 ON DBO.ZOSOLICITUD.IP = DBO.ZOPRODU1.IP AND DBO.ZOSOLICITUD.PAIS = DBO.ZOPRODU1.PAIS
	AND DBO.ZOPRODU1.DESCRIP LIKE @DESCIP AND DBO.ZOPRODU1.IP LIKE @NROIP  
	
	INNER JOIN
	DBO.ZOCLIEN1 ON DBO.ZOSOLICITUD.CODCLIE = DBO.ZOCLIEN1.COD
	AND DBO.ZOCLIEN1.RAZSOC LIKE @DESCCLIE AND DBO.ZOCLIEN1.COD LIKE @CLIEID
	
	INNER JOIN 
		DBO.ZOTIPOPROMO ON DBO.ZOSOLICITUD.CODPROMO = DBO.ZOTIPOPROMO.CODTIPOPROMO

	INNER JOIN
		DBO.T000_FAMILIA ON FAMICODI = DBO.ZOPRODU1.FAMILIA	AND FAMIAGRCODI LIKE @FAMIAGRIP
				
	--FILTROS AÑADIDOS A PEDIDO DE MILAGROS CICORA (APROBÓ CLAUDIA TORO) - E.J.B. JULIO 2011
	WHERE CUOTAS LIKE @CUOTAS AND FLGPROCESADO LIKE @FLGPROCESADO AND DESCUENTO LIKE @DESCUENTO AND USUALTA LIKE  @USUALTA AND NROFACTURA LIKE  @NROFACTURA  
	
	--FILTRO DE FECHA_COMPRA ALTERADO A FECHA DE CARGA A PEDIDO DE MA. PAULA DELBUENO E IRIGOYEN JR. (E.J.B - JULIO 2014)
	AND DBO.ZOSOLICITUD.FECALTA >= CONVERT(DATETIME, @FECHADESDE, 102) --AND DBO.ZOSOLICITUD.FECHACOMPRA >= CONVERT(DATETIME, @FECHADESDE, 102) 
	AND DBO.ZOSOLICITUD.FECALTA <= CONVERT(DATETIME, @FECHAHASTA, 102) --AND DBO.ZOSOLICITUD.FECHACOMPRA <= CONVERT(DATETIME, @FECHAHASTA, 102) 
	

	AND CODAGRUP LIKE @AGRUPID 
	AND NROTICKET LIKE @NROTICKET 
	AND DBO.ZOSOLICITUD.CODPROMO LIKE @CODPROMO
	--AND FLGPROCESADO NOT IN ('5')

	ORDER BY DBO.ZOSOLICITUD.CODSOLICITUD DESC

	SET ROWCOUNT 0
END
GO
