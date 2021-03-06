USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[ST_REPORT_IP_CLIE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE      PROCEDURE [PROD].[ST_REPORT_IP_CLIE]  @FECHA_D AS VARCHAR(19),@FECHA_H  AS VARCHAR(19),@CodPromo as Char(1)='1' 
, @CodClie Varchar(10)='X'
AS


if @Codpromo<>'2' 
begin
	Select dbo.ZoSolicitud.IP, dbo.Zoprodu1.Descrip AS DESCR_IP,rtrim(dbo.ZoSolicitud.pais) as LOTE,dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc AS DESCCLI, sum(Cantidad) as Cantidad
	from dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
	and dbo.ZoSolicitud.codpromo=@CodPromo
	group by dbo.ZoSolicitud.IP, dbo.Zoprodu1.Descrip,dbo.ZoSolicitud.pais,dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc
	order by dbo.ZoSolicitud.CodClie
end
else
begin
if @codClie='X'
	begin
		Select dbo.ZoSolicitud.IP, dbo.Zoprodu1.Descrip AS DESCR_IP,dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc AS DESCCLI, sum(Cantidad) as Cantidad
		from dbo.ZoSolicitud 
		INNER JOIN
		dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
		INNER JOIN
		dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
		WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
		and dbo.ZoSolicitud.codpromo=@CodPromo
		group by dbo.ZoSolicitud.IP, dbo.Zoprodu1.Descrip,dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc
		order by dbo.ZoSolicitud.CodClie
	end
else
	begin
		Select dbo.ZoSolicitud.IP, dbo.Zoprodu1.Descrip AS DESCR_IP,dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc AS DESCCLI, sum(Cantidad) as Cantidad
		from dbo.ZoSolicitud 
		INNER JOIN
		dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
		INNER JOIN
		dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
		WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
		and dbo.ZoSolicitud.codpromo=@CodPromo And dbo.ZoSolicitud.CodClie=@CodClie
		group by dbo.ZoSolicitud.IP, dbo.Zoprodu1.Descrip,dbo.ZoSolicitud.CodClie,dbo.Zoclien1.RazSoc
		order by dbo.ZoSolicitud.CodClie
	end
end






GO
