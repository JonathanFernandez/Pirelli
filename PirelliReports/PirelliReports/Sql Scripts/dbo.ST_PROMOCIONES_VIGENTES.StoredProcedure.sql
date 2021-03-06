USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[ST_PROMOCIONES_VIGENTES]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--EXEC dbo.PROMOCIONES_VIGENTES '2011-07-01 00:00:00'
CREATE PROCEDURE [dbo].[ST_PROMOCIONES_VIGENTES] 

	-- Add the parameters for the stored procedure here
		@Fecha datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select *  
	From ZoTipoPromo  

	Where	
		FecDesde <= CONVERT (DATETIME, @Fecha, 102) and 
		FecHasta >= CONVERT(DATETIME, @Fecha, 102)
		AND FlgBajaLogica<>'1'
END


GO
