USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarLogin]    Script Date: 18/11/2015 2:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VerificarLogin]
(
	@USUARIO NVARCHAR(50),
	@PASSWORD NVARCHAR(50)
)
AS
BEGIN
	SELECT 
		*
	FROM 
		MD_USUARIOS US
	WHERE 
		US.USU_ID = @USUARIO AND
		US.PASS = @PASSWORD

END

GO
