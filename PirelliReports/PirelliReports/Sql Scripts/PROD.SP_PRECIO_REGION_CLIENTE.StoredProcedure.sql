USE [Comercial]
GO
/****** Object:  StoredProcedure [PROD].[SP_PRECIO_REGION_CLIENTE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nico y Joni
-- Create date: 06-04-2015
-- Description:	SP de precios por region de Comercial.
-- =============================================
CREATE PROCEDURE [PROD].[SP_PRECIO_REGION_CLIENTE]
AS
BEGIN


	SELECT TOP 100 YEAR(FECHACOMPRA) AS AÑO, MONTH(FECHACOMPRA) AS MES,C.RAZSOC,R.DESCRIPCION,S.IP, s.precio
		FROM [dbo].[ZoSolicitud] S WITH (NOLOCK)
		INNER JOIN [dbo].[Zoclien1] C WITH (NOLOCK) ON  C.COD =S.CODCLIE 
		INNER JOIN [dbo].[Zoprovincia] P WITH (NOLOCK) ON  C.CODPROV =P.ZOCOD
		INNER JOIN [dbo].[ZoRegion] R  WITH (NOLOCK) ON  R.[REG_COD] =  P.[REG_COD]
END

GO
