USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_GRUPOS]    Script Date: 17/11/2015 1:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_GRUPOS]

AS
BEGIN
	SELECT * FROM MD_GRUPOS
END

GO
