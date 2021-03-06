USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[ST_REPORT_SOLICITUDES]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE       PROCEDURE [PROD].[ST_REPORT_SOLICITUDES]  @FECHA_D AS VARCHAR(19),@FECHA_H  AS VARCHAR(19),@CodIp Varchar(7)='X', @CodClie Varchar(10)='X', @Desclie varchar(25)='X'
AS


if @codIp<>'X' and @codClie<>'X' 
begin
	SELECT     dbo.ZoSolicitud.CodSolicitud AS ID, dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, dbo.ZoSolicitud.CodClie AS CODCLIE, 
	                      dbo.ZoSolicitud.fechaCompra AS FECHA, dbo.ZoSolicitud.Ciudad AS CUIDAD, dbo.ZoSolicitud.CodProv AS CODPROV, dbo.Zoprovincia.ZODesc AS DESCPROV, 
	                      dbo.Zoprodu1.Descrip AS DESCR, dbo.Zoclien1.Cod, dbo.Zoclien1.Cuit, dbo.Zoclien1.RazSoc AS DESCCLI,
			      dbo.ZoSolicitud.Cantidad ,dbo.ZoSolicitud.fecAlta, dbo.ZoSolicitud.NroFactura
	FROM         dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
	And dbo.ZoSolicitud.CodClie=@codClie And dbo.ZoSolicitud.IP=@codIp
end 
if @codIp='X' and @codClie='X' And @Desclie='X' 
begin
	SELECT     dbo.ZoSolicitud.CodSolicitud AS ID, dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, dbo.ZoSolicitud.CodClie AS CODCLIE, 
	                      dbo.ZoSolicitud.fechaCompra AS FECHA, dbo.ZoSolicitud.Ciudad AS CUIDAD, dbo.ZoSolicitud.CodProv AS CODPROV, dbo.Zoprovincia.ZODesc AS DESCPROV, 
	                      dbo.Zoprodu1.Descrip AS DESCR, dbo.Zoclien1.Cod, dbo.Zoclien1.Cuit, dbo.Zoclien1.RazSoc AS DESCCLI,
			      dbo.ZoSolicitud.Cantidad ,dbo.ZoSolicitud.fecAlta, dbo.ZoSolicitud.NroFactura	
	FROM         dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
	
end 

if @codIp='X' and @codClie<>'X' 
begin
	SELECT     dbo.ZoSolicitud.CodSolicitud AS ID, dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, dbo.ZoSolicitud.CodClie AS CODCLIE, 
			      dbo.ZoSolicitud.fechaCompra AS FECHA, dbo.ZoSolicitud.Ciudad AS CUIDAD, dbo.ZoSolicitud.CodProv AS CODPROV, dbo.Zoprovincia.ZODesc AS DESCPROV, 
			      dbo.Zoprodu1.Descrip AS DESCR, dbo.Zoclien1.Cod, dbo.Zoclien1.Cuit, dbo.Zoclien1.RazSoc AS DESCCLI,
			      dbo.ZoSolicitud.Cantidad ,dbo.ZoSolicitud.fecAlta, dbo.ZoSolicitud.NroFactura
	FROM         dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
	And dbo.ZoSolicitud.CodClie=@codClie 
end 

if @codIp<>'X' and @codClie='X' 
begin
	SELECT     dbo.ZoSolicitud.CodSolicitud AS ID, dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, dbo.ZoSolicitud.CodClie AS CODCLIE, 
	                      dbo.ZoSolicitud.fechaCompra AS FECHA, dbo.ZoSolicitud.Ciudad AS CUIDAD, dbo.ZoSolicitud.CodProv AS CODPROV, dbo.Zoprovincia.ZODesc AS DESCPROV, 
	                      dbo.Zoprodu1.Descrip AS DESCR, dbo.Zoclien1.Cod, dbo.Zoclien1.Cuit, dbo.Zoclien1.RazSoc AS DESCCLI,
			      dbo.ZoSolicitud.Cantidad ,dbo.ZoSolicitud.fecAlta, dbo.ZoSolicitud.NroFactura
	FROM         dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102))
	And  dbo.ZoSolicitud.IP=@codIp
end 

if @codIp='X' and @codClie='X' And @Desclie<>'X' 
begin
	SELECT     dbo.ZoSolicitud.CodSolicitud AS ID, dbo.ZoSolicitud.IP AS IP, dbo.ZoSolicitud.Pais AS LOTE, dbo.ZoSolicitud.CodClie AS CODCLIE, 
	                      dbo.ZoSolicitud.fechaCompra AS FECHA, dbo.ZoSolicitud.Ciudad AS CUIDAD, dbo.ZoSolicitud.CodProv AS CODPROV, dbo.Zoprovincia.ZODesc AS DESCPROV, 
	                      dbo.Zoprodu1.Descrip AS DESCR, dbo.Zoclien1.Cod, dbo.Zoclien1.Cuit, dbo.Zoclien1.RazSoc AS DESCCLI,
			      dbo.ZoSolicitud.Cantidad ,dbo.ZoSolicitud.fecAlta, dbo.ZoSolicitud.NroFactura	
	FROM         dbo.ZoSolicitud 
	INNER JOIN
	dbo.Zoprovincia ON dbo.ZoSolicitud.CodProv = dbo.Zoprovincia.Zocod 
	INNER JOIN
	dbo.Zoprodu1 ON dbo.ZoSolicitud.IP = dbo.Zoprodu1.IP AND dbo.ZoSolicitud.Pais = dbo.Zoprodu1.pais 
	INNER JOIN
	dbo.Zoclien1 ON dbo.ZoSolicitud.CodClie = dbo.Zoclien1.Cod
	WHERE     (fechaCompra >= CONVERT(DATETIME,@FECHA_D, 102) AND fechaCompra <= CONVERT(DATETIME, @FECHA_h, 102)) 
	And dbo.Zoclien1.RazSoc like @Desclie
	
end 




GO
