USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_FAMILIA]    Script Date: 11/11/2015 1:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_FAMILIA]
AS
BEGIN
	SELECT DISTINCT  [CODFAMILIA] , [CODFAMILIA] AS FAMILIA
	FROM 
		[DBO].[ZOFAMILIA]
END

GO
