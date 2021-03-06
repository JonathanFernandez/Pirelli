USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[ST_SOLICITUDES_SAP_DIA_PADRE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE    PROCEDURE [dbo].[ST_SOLICITUDES_SAP_DIA_PADRE]  @ClieID Varchar(15)='X', @DescClie varchar(30)='X'
AS


if @ClieID='X' and @DescClie='X'
	begin
	SELECT     dbo.ZoSolicitud.CodClie AS CODCLIE,dbo.Zoclien1.RazSoc AS DESCCLI,dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, 
	dbo.Zoprodu1.Descrip AS DESCR, SUM(CANTIDAD) as cantidad,dbo.ZoSolicitud.flgprocesado as Procesado, dbo.ZoSolicitud.descuento
	FROM         dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	where dbo.ZoSolicitud.flgprocesado<>'1' and  dbo.ZoSolicitud.CodPromo IN ('4')
	Group by dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc,dbo.ZoSolicitud.IP, dbo.ZoSolicitud.Pais, 
	dbo.Zoprodu1.Descrip, dbo.Zoclien1.Cod,dbo.ZoSolicitud.flgprocesado,dbo.ZoSolicitud.descuento
	order by dbo.Zoclien1.Cod
end
else
	begin
		SELECT    dbo.ZoSolicitud.CodClie AS CODCLIE,dbo.Zoclien1.RazSoc AS DESCCLI,dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, 
	    	dbo.Zoprodu1.Descrip AS DESCR,  SUM(CANTIDAD) as cantidad,dbo.ZoSolicitud.flgprocesado as Procesado,dbo.ZoSolicitud.descuento
		FROM         dbo.ZoSolicitud 
		INNER JOIN
		dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
		INNER JOIN
		dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
		INNER JOIN
		dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod And
		dbo.Zoclien1.RazSoc like @DescClie and dbo.Zoclien1.cod like @ClieID
		where dbo.ZoSolicitud.flgprocesado<>'1' and  dbo.ZoSolicitud.CodPromo IN ('4')--('3','4')
		Group by dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc,dbo.ZoSolicitud.IP, dbo.ZoSolicitud.Pais, 
	        dbo.Zoprodu1.Descrip, dbo.Zoclien1.Cod,dbo.ZoSolicitud.flgprocesado,dbo.ZoSolicitud.descuento
		order by dbo.Zoclien1.Cod
	end











GO
