USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[ST_SOLICITUDES]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext exec ST_SOLICITUDES

--<asp:Button runat="server" id="login_lost_btn" class="btn btn-link" Text="Ver factura Online " OnClientClick="javascript:OpenPopUp('https://na2.esker.com/ondemand/webaccess/FlexibleForm/FlexibleForm.aspx?action=run&layout=_flexibleform&id=CD%23DUXW3214594.110726382');"/>
-- [dbo].[ST_SOLICITUDES] '%',
-- exec ST_SOLICITUDES '%','%'
-- exec ST_SOLICITUDES '','MARTOLIO'
CREATE         PROCEDURE [dbo].[ST_SOLICITUDES] 
		@ClieID Varchar(15)='%', 
		@DescClie varchar(30)='%', 
		@Cuotas varchar(3)='%',
		@FlgProcesado varchar(1)='%', 
		@Descuento varchar(10)='%', 
		@UsuAlta varchar (15)='%', 
		@NroFactura varchar (15)='%', 
		@NroIP varchar (15) ='%', 
		@DescIP varchar (50) ='%',
		@FechaDesde datetime ='1900/1/1', 
		@FechaHasta datetime ='2900/1/1',
		 @TOPE int=100, 
		@AgrupID Varchar(15)='%',
		 @NroTicket Varchar(15)='%',
		@CodPromo Varchar(15)='%',
		 @FamiAgrIP Varchar(10)= '%'
AS

BEGIN
	set rowcount @TOPE
	
	SELECT	dbo.ZoSolicitud.CodSolicitud AS ID, 
			--'<asp:Button runat="server" id="login_lost_btn'+ convert(nvarchar,dbo.ZoSolicitud.IP)+'" class="btn btn-link" Text="Ver factura Online " OnClientClick="javascript:OpenPopUp('''+dbo.ZoSolicitud.Esker_Link+''');"/>' as NewsHeadline,
			--dbo.ZoSolicitud.Esker_Link,
			dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, 
			dbo.ZoSolicitud.CodClie AS CODCLIE, 
			dbo.ZoSolicitud.fechaCompra AS FECHA, dbo.ZoSolicitud.Ciudad AS CIUDAD, 
			dbo.ZoSolicitud.CodProv AS CODPROV, dbo.Zoprovincia.ZODesc AS DESCPROV, 
			dbo.Zoprodu1.Descrip AS DESCR, dbo.Zoclien1.Cod, dbo.Zoclien1.Cuit, dbo.Zoclien1.RazSoc AS DESCCLI,
			dbo.ZoSolicitud.NroTicket AS TICKET, dbo.ZoSolicitud.NroFactura AS FACTURA,
			DescTipoPromo as codPromo, --dbo.ZoSolicitud.codPromo , 
			dbo.ZoSolicitud.FlgProcesado,ZoSolicitud.Cantidad,
			NroTicket, NombreUsu, Cuotas, Precio, Descuento, FecAlta, UsuAlta, Precio, FecSubSAP, CodAgrup AS CodAGRUP, 
			FecUltAct, UsuUltAct, dbo.ZoSolicitud.Pais as LOTE, dbo.ZoSolicitud.NOTA as Nota,
			dbo.ZoSolicitud.Esker_Link,
			dbo.ZoSolicitud.Esker_ID--,
		
			--'<a href="'+dbo.ZoSolicitud.Esker_Link+'" target="_blank"><button OnClick="javascript:OpenPopUp('''+dbo.ZoSolicitud.Esker_Link+''');" class="btn btn-warning">Ver Factura </button></a>' as [Esker Link]
	FROM         dbo.ZoSolicitud WITH(NOLOCK)
	INNER JOIN
	dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
	
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais
	and dbo.Zoprodu1.Descrip like @DescIP and dbo.Zoprodu1.IP like @NroIP  
	
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	AND dbo.Zoclien1.RazSoc like @DescClie and dbo.Zoclien1.cod like @ClieID
	
	INNER JOIN 
		dbo.ZoTipoPromo ON dbo.ZoSolicitud.CodPromo = dbo.ZoTipoPromo.CodTipoPromo

	INNER JOIN
		dbo.T000_FAMILIA ON FAMICODI = dbo.zoprodu1.familia	and FAMIAGRCODI like @FamiAgrIP
				
	--Filtros Añadidos a pedido de Milagros Cicora (Aprobó Claudia Toro) - E.J.B. Julio 2011
	WHERE Cuotas like @Cuotas AND FlgProcesado like @FlgProcesado AND Descuento like @Descuento AND UsuAlta like  @UsuAlta AND NroFactura like  @NroFactura  
	
	--Filtro de FECHA_COMPRA ALTERADO A FECHA DE CARGA A PEDIDO DE Ma. Paula DELBUENO e IRIGOYEN Jr. (E.J.B - Julio 2014)
	AND dbo.ZoSolicitud.FecAlta >= CONVERT(DATETIME, @FechaDesde, 102) --AND dbo.ZoSolicitud.fechaCompra >= CONVERT(DATETIME, @FechaDesde, 102) 
	AND dbo.ZoSolicitud.FecAlta <= CONVERT(DATETIME, @FechaHasta, 102) --AND dbo.ZoSolicitud.fechaCompra <= CONVERT(DATETIME, @FechaHasta, 102) 
	

	AND CodAgrup LIKE @AgrupID 
	AND NroTicket LIKE @NroTicket 
	AND dbo.ZoSolicitud.codPromo like @CodPromo
	--AND FlgProcesado NOT IN ('5')

	order by dbo.ZoSolicitud.CodSolicitud desc

	set rowcount 0
END
GO
