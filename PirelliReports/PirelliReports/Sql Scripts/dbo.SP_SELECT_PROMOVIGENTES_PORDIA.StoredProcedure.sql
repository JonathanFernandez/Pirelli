USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_PROMOVIGENTES_PORDIA]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_PROMOVIGENTES_PORDIA]
(
	@FECHA DATETIME
)
AS
BEGIN
	SELECT 
	*	
FROM 
	ZOTIPOPROMO
WHERE 
	@FECHA BETWEEN FECDESDE AND FECHASTA
END

GO
