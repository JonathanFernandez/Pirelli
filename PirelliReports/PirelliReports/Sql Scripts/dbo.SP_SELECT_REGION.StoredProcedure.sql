USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_REGION]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_REGION]
AS
BEGIN
	SELECT * FROM ZOREGION
END

GO
