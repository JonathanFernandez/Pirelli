USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_IP_FLGFILBUSQ]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_IP_FLGFILBUSQ]
(
	@IP CHAR(7),
	@FLAG CHAR(1)
)
AS
BEGIN
	  UPDATE DBO.ZOPRODU1 SET FLGFILBUSQ = @FLAG WHERE IP = @IP
END

GO
