USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALTERA_IP_CODSOL]    Script Date: 11/22/2015 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SP_ALTERA_IP_CODSOL
-- =============================================
-- Author:		Jonathan Fernandez
-- Create date: Junio 2015
-- Description:	SP que altera en forma masiva los ip y Notas de diferentes Códigos de Solicitud
-- =============================================
ALTER PROCEDURE [dbo].[SP_ALTERA_IP_CODSOL] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;
	--======================================================================
    -- VALIDO IP + LOTE EXISTENTES
    --======================================================================
	--UPDATE dbo.ZoSolicitud_AlteraIP
	--SELECT * 
	--FROM dbo.ZoSolicitud_AlteraIP B
	UPDATE B
	SET B.Nota = B.Nota + '- NO SE PROCESO '
	FROM dbo.ZoSolicitud_AlteraIP B
	LEFT JOIN Zoprodu1 Z ON
		Z.IP = B.IP AND
		Z.pais = B.Pais
	WHERE Z.IP IS NULL
	--======================================================================
    -- Hago el Update de los Registros cargados en ZoSolicitud_AlteraIP
    --======================================================================
	UPDATE a
	SET a.ip = b.IP, 
	--select a.ip,b.ip,a.codSolicitud,b.codsolicitud,		
	a.Nota = CASE WHEN LEN(SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)) <= 200
				THEN	SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
					ELSE	SUBSTRING(LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
				END ,
	a.PAIS = b.Pais
	FROM ZoSolicitud a
	INNER JOIN  dbo.ZoSolicitud_AlteraIP b on 
		a.CodSolicitud = b.CodSolicitud 
	INNER JOIN Zoprodu1 Z ON
		Z.IP = B.IP AND
    	Z.pais = B.Pais
	WHERE B.NOTA NOT LIKE'%NO SE PROCESO%' 
	--===================================================
    -- Elimino los Registros de ZoSolicitud_AlteraIP.
    --===================================================
--SELECT TOP 10 * FROM ZoSolicitud
	DELETE dbo.ZoSolicitud_AlteraIP WHERE NOTA NOT LIKE'%NO SE PROCESO%'
END