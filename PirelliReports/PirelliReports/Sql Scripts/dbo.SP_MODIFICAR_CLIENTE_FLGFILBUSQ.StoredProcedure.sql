USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_CLIENTE_FLGFILBUSQ]    Script Date: 19/11/2015 1:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_CLIENTE_FLGFILBUSQ]
(
	@CLIENTE CHAR(10),
	@FLAG CHAR(1)
)
AS
BEGIN
	  UPDATE DBO.ZOCLIEN1 SET FLGFILBUSQ = @FLAG WHERE COD=@CLIENTE
END

GO
