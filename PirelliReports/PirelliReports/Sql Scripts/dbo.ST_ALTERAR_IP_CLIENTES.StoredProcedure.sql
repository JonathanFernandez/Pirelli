USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[ST_ALTERAR_IP_CLIENTES]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ST_ALTERAR_IP_CLIENTES] @tipo as int

AS
if @tipo =1
	BEGIN
--	select distinct z.IP, p.descrip, p.pais from zoSolicitud z
--	inner join zoprodu1 p on p.ip= z.ip
--	where z.flgprocesado<>'1'
--	order by z.ip asc
	
	select distinct z.IP, p.descrip, p.pais from zoSolicitud z
	inner join zoprodu1 p on p.ip= z.ip
	where z.flgprocesado<>'1' 
    and 
    p.pais=(SELECT TOP 1 pais  From dbo.Zoprodu1 where Zoprodu1.ip= z.ip ORDER BY FLGBAJALOGICA, p.PAIS)
	order by z.ip asc

	END
ELSE
	BEGIN
		select distinct z.codclie, p.RazSoc from zoSolicitud z
		inner join zoclien1 p on p.cod = z.codclie
		where z.flgprocesado<>'1'
		order by z.codclie asc	
	END





GO
