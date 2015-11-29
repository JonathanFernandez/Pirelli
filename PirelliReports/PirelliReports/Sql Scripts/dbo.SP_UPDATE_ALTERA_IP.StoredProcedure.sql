USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_ALTERA_IP]    Script Date: 29/11/2015 19:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_ALTERA_IP]
(
	@IP CHAR(7),
	@IPNUENVO CHAR(7),
	@USUARIO NVARCHAR(50)
)
AS
BEGIN
	UPDATE DBO.ZOSOLICITUD
	 SET IP= @IPNUENVO,
	 FECULTACT = GETDATE(),
	 USUULTACT = @USUARIO,
	 PAIS= (SELECT TOP 1 LTRIM(RTRIM(PAIS)) AS PAIS FROM DBO.ZOPRODU1 WHERE (IP = @IPNUENVO) ORDER BY FLGBAJALOGICA) 
	 WHERE 
	 (IP = @IP) AND (FLGPROCESADO <> '1')
END

GO
