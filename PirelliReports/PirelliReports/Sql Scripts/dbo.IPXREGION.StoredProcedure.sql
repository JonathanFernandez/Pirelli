USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[IPXREGION]    Script Date: 13/11/2015 2:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IPXREGION]
--AGRUPADO POR REGION 
--DECLARE 
@DATEDESDE DATE,
@DATEHASTA DATE,
@IP NVARCHAR(7),
@CODREGIONES NVARCHAR(MAX)
AS

/*SET @YEAR ='2015-01-01'
SET @MONTH = 1
SET @IP = '2057600'
*/

/*CREO UNA TEMP CON LAS IP MAS VENDIDAS O CON LA IP QUE ME VINO*/
CREATE TABLE #TEMPIP  (IP NVARCHAR(7))
IF @IP = 'NULL'-- IS NULL
BEGIN
	INSERT INTO #TEMPIP 
	SELECT TOP 5 IP
	FROM ZOSOLICITUD S
	WHERE
	S.FECHACOMPRA BETWEEN @DATEDESDE AND @DATEHASTA
	GROUP BY IP
	ORDER BY COUNT(*) DESC
END
ELSE
BEGIN
	INSERT INTO #TEMPIP 
	SELECT @IP
END

/*CREO UNA TEMP CON TODAS REGIONES O CON LAS REGIONES QUE ME VINO*/
CREATE TABLE #TEMPREG  (CODREG NVARCHAR(7))
IF @CODREGIONES = 'NULL'-- IS NULL
BEGIN
	INSERT INTO #TEMPREG 
	SELECT REG_COD
	FROM ZOREGION
	
END
ELSE
BEGIN
	INSERT INTO #TEMPREG 
	SELECT REG_COD
	FROM ZOREGION
	--WHERE REG_COD IN (@CODREGIONES)
	WHERE REG_COD IN (SELECT * FROM  DBO.FNUTILSPLIT(@CODREGIONES,','))
END


SELECT
	S.IP AS [IP], 
	R.DESCRIPCION AS REGION, 
	MIN(S.PRECIO) AS [MIN],
	AVG(S.PRECIO) AS [AVG],
	MAX(S.PRECIO) AS [MAX]
	
FROM            
	DBO.ZOSOLICITUD AS S WITH (NOLOCK) 
INNER JOIN DBO.ZOCLIEN1 AS C WITH (NOLOCK) ON 
	C.COD = S.CODCLIE 
INNER JOIN DBO.ZOPROVINCIA AS P WITH (NOLOCK) ON 
	C.CODPROV = P.ZOCOD 
INNER JOIN DBO.ZOREGION AS R WITH (NOLOCK) ON 
	R.REG_COD IN (SELECT REG.CODREG COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM #TEMPREG AS REG)
WHERE        
	S.FECHACOMPRA BETWEEN @DATEDESDE AND @DATEHASTA AND
	S.IP IN (SELECT IP COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM #TEMPIP) 
GROUP BY 
	R.DESCRIPCION,
	S.IP
	
ORDER BY
	COUNT(*) DESC--,

	
	--EXEC IPXREGION '2015/01/01','2015/05/07','NULL','NULL'
	--EXEC IPXREGION '2015/01/01','2015/05/07','NULL','00,01,03'
DROP TABLE #TEMPIP
DROP TABLE #TEMPREG
GO
