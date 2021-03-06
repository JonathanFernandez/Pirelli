USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALTERA_IP_CODSOL]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jonathan Fernandez
-- Create date: Junio 2015
-- Description:	SP que altera en forma masiva los ip y Notas de diferentes Códigos de Solicitud
-- =============================================
CREATE PROCEDURE [dbo].[SP_ALTERA_IP_CODSOL] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	--======================================================================
    -- Hago el Update de los Registros cargados en ZoSolicitud_AlteraIP
    --======================================================================
	UPDATE ZoSolicitud
	SET ip = b.IP, 
		--select a.ip,b.ip,a.codSolicitud,b.codsolicitud,		
		Nota =
				CASE WHEN LEN(SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)) <= 200
					THEN	SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
					ELSE	SUBSTRING(LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
				END --as nota
	FROM ZoSolicitud a
	INNER JOIN  dbo.ZoSolicitud_AlteraIP b on 
	a.CodSolicitud = b.CodSolicitud 


	--===================================================
    -- Elimino los Registros de ZoSolicitud_AlteraIP.
    --===================================================
	DELETE dbo.ZoSolicitud_AlteraIP


END

GO
