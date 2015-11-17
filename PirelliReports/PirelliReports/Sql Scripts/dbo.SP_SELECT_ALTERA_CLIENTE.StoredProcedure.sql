USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_ALTERA_CLIENTE]    Script Date: 17/11/2015 1:59:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_ALTERA_CLIENTE]
	
AS
BEGIN
	select distinct z.codclie, p.RazSoc from zoSolicitud z
		inner join zoclien1 p on p.cod = z.codclie
		where z.flgprocesado<>'1'
		order by z.codclie asc	

END

GO
