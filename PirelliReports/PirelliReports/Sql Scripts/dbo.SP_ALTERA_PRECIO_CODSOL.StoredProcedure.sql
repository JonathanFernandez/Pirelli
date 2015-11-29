USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALTERA_PRECIO_CODSOL]    Script Date: 29/11/2015 19:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		EMANUEL J. BARBERA
-- CREATE DATE: DICIEMBRE 2013
-- DESCRIPTION:	SP QUE ALTERA EN FORMA MASIVA LOS STATUS Y NOTAS DE DIFERENTES CÓDIGOS DE SOLICITUD
-- =============================================
CREATE PROCEDURE [dbo].[SP_ALTERA_PRECIO_CODSOL] 

AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;

	--======================================================================
    -- HAGO EL UPDATE DE LOS REGISTROS CARGADOS EN ZOSOLICITUD_ALTERAPRECIO.
    --======================================================================
	UPDATE ZOSOLICITUD
	SET		PRECIO = ZP.PrecioNuevo, 
			--NOTA = SUBSTRING(LTRIM(RTRIM(ISNULL(A.NOTA, ''))) + ' ' + LTRIM(RTRIM(B.NOTA)) + ' ' + CAST(GETDATE() AS VARCHAR),1,200)
			--LE PISO LA NOTA QUE TENÍAN. PREFIEREN TENER EL ÚLTIMO COMENTARIO A QUE QUEDE TRUNCO POR EXCESO DE CARACTERES.
			NOTA =
					CASE WHEN LEN(SUBSTRING(LTRIM(RTRIM(ISNULL(Z.NOTA, ''))) + ' ' + LTRIM(RTRIM(ZP.NOTA)) + ' ' + CAST(GETDATE() AS VARCHAR),1,200)) <= 200
						THEN	SUBSTRING(LTRIM(RTRIM(ISNULL(Z.NOTA, ''))) + ' ' + LTRIM(RTRIM(ZP.NOTA)) + ' ' + CAST(GETDATE() AS VARCHAR),1,200)
						ELSE	SUBSTRING(LTRIM(RTRIM(ZP.NOTA)) + ' ' + CAST(GETDATE() AS VARCHAR),1,200)
					END
	FROM 
		ZOSOLICITUD Z
	INNER JOIN ZOSOLICITUD_ALTERAPRECIO ZP ON 
	Z.CODSOLICITUD = ZP.CODSOLICITUD --AND	A.ID_BB = B.ID_BB

	--NO FUNCIONA ESTA QUERY DEBAJO:
	--PRINT 'RESULTADO: ' + CAST(@@ROWCOUNT AS VARCHAR) +' REGISTROS AFECTADOS.'

	--===================================================
    -- ELIMINO LOS REGISTROS DE ZOSOLICITUD_ALTERASTATUS.
    --===================================================
	DELETE DBO.ZOSOLICITUD_ALTERAPRECIO


END

GO
