USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_ALTERA_IP]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_ALTERA_IP]
	
AS
BEGIN
	SELECT DISTINCT Z.IP, P.DESCRIP, P.PAIS FROM ZOSOLICITUD Z
	INNER JOIN ZOPRODU1 P ON P.IP= Z.IP
	WHERE Z.FLGPROCESADO<>'1' 
    AND 
    P.PAIS=(SELECT TOP 1 PAIS  FROM DBO.ZOPRODU1 WHERE ZOPRODU1.IP= Z.IP ORDER BY FLGBAJALOGICA, P.PAIS)
	ORDER BY Z.IP ASC

END

GO
