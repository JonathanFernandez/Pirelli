USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_CTC_ACTIVOS]    Script Date: 29/11/2015 19:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_CTC_ACTIVOS]
	
AS
BEGIN
	SELECT * FROM ZOCTC WHERE FLGBAJALOGICA = 1
END

GO
