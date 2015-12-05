USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[IPXCLIENTE]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IPXCLIENTE]
--AGRUPADO POR IP
--DECLARE 
@DATEDESDE DATE,
@DATEHASTA DATE,
@IP NVARCHAR(7),
@CLIENTES NVARCHAR(MAX)
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
--SELECT * FROM ##TEMPIP

/*CREO UNA TEMP CON TODAS LOS CODMATRIZ O CON LAS CODMATRIZ QUE ME VINO*/
CREATE TABLE #TEMPCLIE  (CODCLIMATRIZ NVARCHAR(10))
IF @CLIENTES = 'NULL'-- IS NULL
BEGIN
	INSERT INTO #TEMPCLIE
	SELECT CODCLIMATRIZ
	FROM ZOCLIEN1 
	WHERE CODCLIMATRIZ IS NOT NULL
	
END
ELSE
BEGIN
	INSERT INTO #TEMPCLIE 
	SELECT CODCLIMATRIZ
	FROM ZOCLIEN1
	--WHERE REG_COD IN (@CODREGIONES)
	WHERE CODCLIMATRIZ IN (SELECT * FROM  DBO.FNUTILSPLIT(@CLIENTES,','))
END
--SELECT * FROM #TEMPCLIE

SELECT        

	S.IP AS [IP], 
	CONVERT(NVARCHAR,C.COD) +'-'+ C.RAZSOC AS [RAZSOC], 
	--C.RAZSOC AS [RAZSOC], 
	MIN(S.PRECIO) AS [MIN],
	AVG(S.PRECIO) AS [AVG],
	MAX(S.PRECIO) AS [MAX]
	
FROM            
	DBO.ZOSOLICITUD AS S WITH (NOLOCK) 
INNER JOIN DBO.ZOCLIEN1 AS C WITH (NOLOCK) ON 
	C.COD = S.CODCLIE AND
	C.CODCLIMATRIZ IN (SELECT CLIE.CODCLIMATRIZ COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM #TEMPCLIE AS CLIE)
	--(SELECT REG.CODREG COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM #TEMPREG AS REG)
INNER JOIN DBO.ZOPROVINCIA AS P WITH (NOLOCK) ON 
	C.CODPROV = P.ZOCOD 
INNER JOIN DBO.ZOREGION AS R WITH (NOLOCK) ON 
	R.REG_COD = P.REG_COD
WHERE        
	S.FECHACOMPRA BETWEEN @DATEDESDE AND @DATEHASTA AND
	IP IN (SELECT IP COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM #TEMPIP) 

GROUP BY 
	--C.RAZSOC,
	CONVERT(NVARCHAR,C.COD) +'-'+ C.RAZSOC,
	S.IP

ORDER BY
	COUNT(IP) DESC

DROP TABLE #TEMPCLIE
DROP TABLE #TEMPIP
	

	--EXEC IPXCLIENTE '2015/01/01','2015/05/08','NULL','NULL'
	--EXEC IPXCLIENTE '2015/01/01','2015/05/08','NULL','0009700008,0009700008,0009700008,0009700018,0009700039'
GO
