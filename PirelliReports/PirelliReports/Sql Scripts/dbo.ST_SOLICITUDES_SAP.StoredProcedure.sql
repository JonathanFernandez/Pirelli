USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[ST_SOLICITUDES_SAP]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec ST_SOLICITUDES_SAP '%%','%%','%%','0','%%',3000,'%'


--EXEC ST_SOLICITUDES_SAP '%%','%%'
--EXEC ST_SOLICITUDES_SAP '%%','%%', '0516600'

CREATE        PROCEDURE [dbo].[ST_SOLICITUDES_SAP]  

		@ClieID Varchar(15)='%%', @DescClie varchar(30)='%%', 
		@IP_INC varchar(500)='%%', @IP varchar(9)='0', 
		@CodPromo varchar(9)='%%',@TOPE int=10,
		@FamiAgrIP Varchar(10)= '%%'
		
		--@ClieID Varchar(15)='X', @DescClie varchar(30)='X', 
		--@IP_INC varchar(500)='%', @IP varchar(9)='X', 
		--@CodPromo varchar(9)='%',@TOPE int=10,
		--@FamiAgrIP Varchar(10)= '%'
		
AS
	begin
		set rowcount @TOPE
		
		SET NOCOUNT ON;
			
			SELECT	dbo.ZoSolicitud.CodClie AS CODCLIE,
					dbo.Zoclien1.RazSoc AS DESCCLI, 
					CUIT, 
					dbo.ZoSolicitud.IP AS IP, --dbo.ZoSolicitud.Pais AS LOTE, 
            		dbo.Zoprodu1.Descrip AS DESCR,  
					SUM(CANTIDAD) as cantidad,
					dbo.ZoSolicitud.flgprocesado as Procesado,
					dbo.ZoSolicitud.Descuento,
					dbo.ZoSolicitud.CodPromo, 
					dbo.ZoTipoPromo.DescTipoPromo, 
					ISNULL(CodCliRefill,Cod) as CliRefill

			FROM         dbo.ZoSolicitud 
			INNER JOIN
				dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
			INNER JOIN
				dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP  AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
				AND dbo.Zoprodu1.FlgFilBusq = '1'
				AND dbo.Zoprodu1.IP LIKE (@IP_INC) 
				AND NOT dbo.Zoprodu1.IP IN (@IP) --> Añadido por Mili Cicora / Claudia Toro 09/2011  E.J.B.		
				
				--AND dbo.Zoprodu1.IP IN (SELECT VALUE FROM #IPS_INC) 
				--AND NOT dbo.Zoprodu1.IP IN (SELECT VALUE FROM #IPS_INC) --> Añadido por Mili Cicora / Claudia Toro 09/2011  E.J.B.		
			INNER JOIN
				dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod And
				dbo.Zoclien1.RazSoc like @DescClie and dbo.Zoclien1.cod like @ClieID AND dbo.Zoclien1.FlgFilBusq = '1'
			INNER JOIN 
				dbo.ZoTipoPromo ON dbo.ZoSolicitud.CodPromo = dbo.ZoTipoPromo.CodTipoPromo
			INNER JOIN
				dbo.T000_FAMILIA ON FAMICODI = familia	and FAMIAGRCODI like @FamiAgrIP

			where 
					dbo.ZoSolicitud.flgprocesado NOT IN ('1','5', '6')    
					and dbo.ZoSolicitud.Cuotas>=1 
					and dbo.ZoSolicitud.CodPromo like @CodPromo
					
					--PROVISORIO A PEDIDO DE POL PARA NO MANDAR NADA A FACTURAR FUERA DE MAYO/JUNIO 2014
					-- 16/01/2014 - Alteró: Ema
					--and YEAR(dbo.ZoSolicitud.fechaCompra) = 2014 AND  MONTH(dbo.ZoSolicitud.fechaCompra) IN ('5','6')
					--and YEAR(dbo.ZoSolicitud.fechaCompra) = 2014 AND  MONTH(dbo.ZoSolicitud.fechaCompra) IN ('6')
					
			Group by dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc, CUIT, dbo.ZoSolicitud.IP, --dbo.ZoSolicitud.Pais, 
					dbo.Zoprodu1.Descrip, dbo.Zoclien1.Cod,dbo.ZoSolicitud.flgprocesado,dbo.ZoSolicitud.Descuento, dbo.ZoSolicitud.CodPromo, dbo.ZoTipoPromo.DescTipoPromo, ISNULL(CodCliRefill,Cod)  
			order by dbo.Zoclien1.Cod
			set rowcount 0	

		
	end









--if @ClieID='X' and @DescClie='X' --and @IP='X'
--	begin
--	SELECT    dbo.ZoSolicitud.CodClie AS CODCLIE,dbo.Zoclien1.[Desc] AS DESCCLI,dbo.ZoSolicitud.IP AS IP, --dbo.ZoSolicitud.Pais AS LOTE, 
--	dbo.Zoprodu1.Descrip AS DESCR, SUM(CANTIDAD) as cantidad,dbo.ZoSolicitud.flgprocesado as Procesado,dbo.ZoSolicitud.Descuento,  dbo.ZoSolicitud.CodPromo
--	FROM         dbo.ZoSolicitud 
--	INNER JOIN
--	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
--	INNER JOIN
--	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
--	where dbo.ZoSolicitud.flgprocesado<>'1' --and  dbo.ZoSolicitud.CodPromo='1' --And
----	(dbo.ZoSolicitud.Cuotas=6 or
---- (dbo.ZoSolicitud.CodClie in (Select CodSucursal From zosucursalesaux) 
--  And dbo.ZoSolicitud.Cuotas>=6--))
--	Group by dbo.ZoSolicitud.CodClie,dbo.Zoclien1.[Desc],dbo.ZoSolicitud.IP, --dbo.ZoSolicitud.Pais, 
--	dbo.Zoprodu1.Descrip, dbo.Zoclien1.Cod,dbo.ZoSolicitud.flgprocesado,dbo.ZoSolicitud.Descuento, dbo.ZoSolicitud.CodPromo 
--	order by dbo.Zoclien1.Cod
--end
--else
--	begin
----EXEC [dbo].[ST_SOLICITUDES_SAP] '%', '%', '0516600,0737400'
----print @ip
--		SELECT    dbo.ZoSolicitud.CodClie AS CODCLIE,dbo.Zoclien1.[Desc] AS DESCCLI,dbo.ZoSolicitud.IP AS IP, --dbo.ZoSolicitud.Pais AS LOTE, 
--            	dbo.Zoprodu1.Descrip AS DESCR,  SUM(CANTIDAD) as cantidad,dbo.ZoSolicitud.flgprocesado as Procesado,dbo.ZoSolicitud.Descuento,  dbo.ZoSolicitud.CodPromo 
--		FROM         dbo.ZoSolicitud 
--		INNER JOIN
--		dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
--		INNER JOIN
--		dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP  AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
--			AND dbo.Zoprodu1.IP LIKE (@IP_INC) 
--			AND NOT dbo.Zoprodu1.IP IN (@IP) --> Añadido por Mili Cicora / Clauda Toro 09/2011  E.J.B.		
--		INNER JOIN
--		dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod And
--		dbo.Zoclien1.[desc] like @DescClie and dbo.Zoclien1.cod like @ClieID
--		where dbo.ZoSolicitud.flgprocesado<>'1' and  --dbo.ZoSolicitud.CodPromo='1' and 
----		(dbo.ZoSolicitud.Cuotas=6 or (dbo.ZoSolicitud.CodClie in (Select CodSucursal From zosucursalesaux) And 
--dbo.ZoSolicitud.Cuotas>=6--))
--		Group by dbo.ZoSolicitud.CodClie,dbo.Zoclien1.[Desc],dbo.ZoSolicitud.IP, --dbo.ZoSolicitud.Pais, 
--                dbo.Zoprodu1.Descrip, dbo.Zoclien1.Cod,dbo.ZoSolicitud.flgprocesado,dbo.ZoSolicitud.Descuento, dbo.ZoSolicitud.CodPromo 
--		order by dbo.Zoclien1.Cod
--	end


GO
