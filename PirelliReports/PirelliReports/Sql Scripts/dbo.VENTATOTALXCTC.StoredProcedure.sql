USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[VENTATOTALXCTC]    Script Date: 17/11/2015 1:59:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[VENTATOTALXCTC]
(
	@DESDE DATETIME,
	@HASTA DATETIME,
	@CTC VARCHAR(2)
)
AS
BEGIN
	SELECT
		convert(datetime,convert(varchar(10),DATEPART(YEAR,S.FECHACOMPRA)) + '-' +
				convert(varchar(10),DATEPART(MONTH,S.FECHACOMPRA)) + '-' +
				convert(varchar(10), 01)) AS [FECHA],  
		--DATEFROMPARTS(DATEPART(YEAR,S.FECHACOMPRA), DATEPART(MONTH,S.FECHACOMPRA),01) AS [FECHA], 
		SUM(S.PRECIO) AS TOTAL
	FROM 
		ZOSOLICITUD  S
	INNER JOIN ZOCLIEN1 C WITH(NOLOCK) ON
		C.COD = S.CODCLIE 
	INNER JOIN ZOCTC CTC WITH(NOLOCK) ON 
		CTC.CODCTC = C.CTC_CAR
	WHERE CTC.CODCTC = @CTC AND FECHACOMPRA > @DESDE AND FECHACOMPRA < @HASTA
	GROUP BY  convert(datetime,convert(varchar(10),DATEPART(YEAR,S.FECHACOMPRA)) + '-' +
			  convert(varchar(10),DATEPART(MONTH,S.FECHACOMPRA)) + '-' +
			  convert(varchar(10), 01))--DATEPART(YEAR,S.FECHACOMPRA),DATEPART(MONTH,S.FECHACOMPRA)
	ORDER BY 1 ASC

END

GO
