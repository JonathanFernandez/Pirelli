USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_ALTERA_CLIENTE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_ALTERA_CLIENTE]
(
	@COD CHAR(10),
	@CODNUEVO CHAR(10),
	@USUARIO NVARCHAR(50)

)
AS
BEGIN
	UPDATE 
		DBO.ZOSOLICITUD 
	SET 
		CODCLIE = @CODNUEVO,
		FECULTACT = GETDATE(),
		USUULTACT = @USUARIO  
	WHERE 
		(CODCLIE = @COD) AND 
		(FLGPROCESADO <> '1')
	END

GO
