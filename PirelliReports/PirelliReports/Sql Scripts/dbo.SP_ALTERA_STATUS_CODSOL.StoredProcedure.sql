USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALTERA_STATUS_CODSOL]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Emanuel J. Barbera
-- Create date: Diciembre 2013
-- Description:	SP que altera en forma masiva los Status y Notas de diferentes Códigos de Solicitud
-- =============================================
CREATE PROCEDURE [dbo].[SP_ALTERA_STATUS_CODSOL] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	--======================================================================
    -- Hago el Update de los Registros cargados en ZoSolicitud_AlteraStatus.
    --======================================================================
	UPDATE ZoSolicitud
	SET		FlgProcesado = b.FlgProcesado, 
			--Nota = SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
			--Le piso la nota que tenían. Prefieren tener el último comentario a que quede trunco por exceso de caracteres.
			Nota =
					CASE WHEN LEN(SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)) <= 200
						THEN	SUBSTRING(LTRIM(RTRIM(ISNULL(a.Nota, ''))) + ' ' + LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
						ELSE	SUBSTRING(LTRIM(RTRIM(b.Nota)) + ' ' + CAST(GETDATE() as VARCHAR),1,200)
					END
	FROM ZoSolicitud a
	INNER JOIN ZoSolicitud_AlteraStatus b on a.CodSolicitud = b.CodSolicitud --and	a.id_bb = b.id_bb

	--No funciona esta Query debajo:
	--print 'Resultado: ' + CAST(@@ROWCOUNT as VARCHAR) +' registros afectados.'

	--===================================================
    -- Elimino los Registros de ZoSolicitud_AlteraStatus.
    --===================================================
	DELETE dbo.ZoSolicitud_AlteraStatus


END

GO
