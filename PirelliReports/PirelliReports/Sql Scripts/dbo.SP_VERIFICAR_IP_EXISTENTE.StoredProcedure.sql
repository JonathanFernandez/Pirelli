USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICAR_IP_EXISTENTE]    Script Date: 07/11/2015 17:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VERIFICAR_IP_EXISTENTE]
(
	@ip char(7)
)
AS
BEGIN
	SELECT TOP 1 LTRIM(RTRIM(pais)) AS PAIS From dbo.Zoprodu1 WHERE (IP = @ip) ORDER BY FlgBajaLogica
END

GO
